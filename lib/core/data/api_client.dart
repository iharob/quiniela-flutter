import 'dart:io';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:path_provider/path_provider.dart';

import 'package:quiniela_flutter/core/config/app_config.dart';
import 'package:quiniela_flutter/core/domain/game.dart';
import 'package:quiniela_flutter/core/domain/group.dart';
import 'package:quiniela_flutter/core/domain/predicted_result.dart';
import 'package:quiniela_flutter/core/domain/rankings.dart';
import 'package:quiniela_flutter/core/domain/user_results.dart';
import 'package:quiniela_flutter/core/domain/user_session.dart';
import 'package:quiniela_flutter/core/error/api_exception.dart';
import 'package:quiniela_flutter/core/utils/jwt.dart';
import 'package:quiniela_flutter/core/utils/simulate.dart';

@lazySingleton
class ApiClient {
  ApiClient(this._dio);

  final Dio _dio;

  Future<UserSession> googleAuth(String credential) async {
    final res = await _dio.post<dynamic>('/auth/google', data: {
      'credential': credential,
    });
    return _sessionFromAuthResponse(res, 'No pudimos identificarlo con Google');
  }

  Future<UserSession> emailRegister({
    required String email,
    required String name,
    required String password,
  }) async {
    final res = await _dio.post<dynamic>('/auth/register', data: {
      'email': email,
      'name': name,
      'password': password,
    });
    return _sessionFromAuthResponse(res, 'No pudimos completar el registro');
  }

  Future<UserSession> emailLogin({
    required String email,
    required String password,
  }) async {
    final res = await _dio.post<dynamic>('/auth/login', data: {
      'email': email,
      'password': password,
    });
    return _sessionFromAuthResponse(res, 'No pudimos iniciar sesión');
  }

  /// Asks the backend whether the currently held bearer token is still valid
  /// and returns the up-to-date prediction/payment flags. The user id comes
  /// from the JWT — [SessionInfo]'s `userId` is parsed only as a sanity
  /// fallback; if the two disagree we trust the token.
  Future<SessionInfo?> loadSession() async {
    try {
      final res = await _dio.get<dynamic>('/auth/session');
      return SessionInfo.fromJson(res.data as Map<String, dynamic>);
    } on DioException catch (e) {
      final status = e.response?.statusCode;
      if (status == 401 || status == 403 || status == 404) return null;
      rethrow;
    }
  }

  Future<UserProfile> fetchProfile() async {
    final res = await _dio.get<dynamic>('/profile');
    if (res.statusCode != 200) {
      throw const ApiException('No se pudo obtener el perfil');
    }
    return UserProfile.fromJson(res.data as Map<String, dynamic>);
  }

  Future<PublicUserProfile> getUserProfile(int userId) async {
    final res = await _dio.get<dynamic>('/profile/$userId');
    if (res.statusCode != 200) {
      throw const ApiException('No se pudo obtener el perfil del usuario');
    }
    return PublicUserProfile.fromJson(res.data as Map<String, dynamic>);
  }

  Future<UserProfile> updateProfile({
    required String name,
    required String bio,
    String? photoPath,
  }) async {
    final form = FormData.fromMap({
      'name': name,
      'bio': bio,
      if (photoPath != null)
        'photo': await MultipartFile.fromFile(photoPath, filename: 'avatar.jpg'),
    });
    final res = await _dio.put<dynamic>(
      '/profile',
      data: form,
      options: Options(
        contentType: 'multipart/form-data',
        validateStatus: (s) => s != null && s >= 200 && s < 300,
      ),
    );
    if (res.statusCode != 204 && res.statusCode != 200) {
      throw const ApiException('No se pudo actualizar el perfil');
    }
    return fetchProfile();
  }

  Future<List<GroupWithResults>> fetchGroups() async {
    final res = await _dio.get<dynamic>('/groups');
    if (res.statusCode != 200) throw const ApiException('bad response');
    final groups = (res.data as List<dynamic>)
        .map((e) => Group.fromJson(e as Map<String, dynamic>))
        .toList();
    final simulator = Simulator.instance;
    return groups
        .map(
          (g) => GroupWithResults(
            name: g.name,
            games: g.games.map((game) {
              final simulated =
                  simulator.simulateGroupScore(game.team1, game.team2);
              return GameWithResult(
                gameId: game.gameId,
                team1: game.team1,
                team2: game.team2,
                date: game.date,
                team1Score: AppConfig.simulate ? simulated.team1Score : null,
                team2Score: AppConfig.simulate ? simulated.team2Score : null,
              );
            }).toList(),
          ),
        )
        .toList();
  }

  Future<List<BracketRound>> computeBrackets(
      List<GroupWithResults> results) async {
    final res = await _dio.post<dynamic>(
      '/brackets',
      data: {'results': results.map((g) => g.toJson()).toList()},
    );
    if (res.statusCode != 200) {
      throw const ApiException('No se pudo obtener el sorteo');
    }
    return (res.data as List<dynamic>)
        .map((e) => BracketRound.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  Future<void> sendPrediction({
    required List<GroupWithResults> groups,
    required Map<int, List<List<GameWithResult>>> knockout,
    required GameWithResult finalGame,
  }) async {
    GameWithResult stripWinner(GameWithResult g) => g.copyWith(winner: null);
    GameWithResult sanitizeKnockout(GameWithResult g) {
      if (g.team1Score != null && g.team1Score == g.team2Score) return g;
      return stripWinner(g);
    }

    final sanitizedGroups = groups
        .map((g) => g.copyWith(games: g.games.map(stripWinner).toList()))
        .toList();

    final orderedRounds = knockout.keys.toList()..sort((a, b) => b - a);
    final playoffs = orderedRounds
        .map(
          (k) => knockout[k]!
              .map((pair) => [
                    sanitizeKnockout(pair[0]).toJson(),
                    sanitizeKnockout(pair[1]).toJson(),
                  ])
              .toList(),
        )
        .toList();

    final res = await _dio.post<dynamic>(
      '/prediction',
      data: {
        'groups': sanitizedGroups.map((g) => g.toJson()).toList(),
        'playoffs': playoffs,
        'final': sanitizeKnockout(finalGame).toJson(),
      },
    );
    if (res.statusCode != 201 && res.statusCode != 200) {
      throw const ApiException(
          'No pudimos crear su quiniela, vuelva a intentar luego');
    }
  }

  Future<List<GameResultGroup>> fetchLive({CancelToken? cancelToken}) async {
    final res = await _dio.get<dynamic>(
      '/live',
      cancelToken: cancelToken,
    );
    if (res.statusCode != 200) throw const ApiException('bad response');
    return (res.data as List<dynamic>)
        .map((e) => GameResultGroup.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  Future<List<RankingsEntry>> fetchRankings({CancelToken? cancelToken}) async {
    final res = await _dio.get<dynamic>(
      '/rankings',
      cancelToken: cancelToken,
    );
    if (res.statusCode != 200) throw const ApiException('bad response');
    return (res.data as List<dynamic>)
        .map((e) => RankingsEntry.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  Future<PointsDetails> getUserScoreDetails(
    int userId, {
    CancelToken? cancelToken,
  }) async {
    final res = await _dio.get<dynamic>(
      '/prediction/$userId/score',
      cancelToken: cancelToken,
    );
    if (res.statusCode != 200) throw const ApiException('bad response');
    return PointsDetails.fromJson(res.data as Map<String, dynamic>);
  }

  Future<File> downloadUserScorePdf(int userId) async {
    final dir = await getTemporaryDirectory();
    final file = File('${dir.path}/quiniela_$userId.pdf');
    final res = await _dio.download(
      '/prediction/$userId/pdf',
      file.path,
      options: Options(
        responseType: ResponseType.bytes,
        headers: const {'Accept': 'application/pdf'},
      ),
    );
    if (res.statusCode != 200) {
      throw const ApiException('No se pudo descargar el PDF');
    }
    return file;
  }

  UserSession _sessionFromAuthResponse(
    Response<dynamic> res,
    String errorMessage,
  ) {
    final status = res.statusCode;
    if (status != 200 && status != 201) {
      throw ApiException(errorMessage, statusCode: status);
    }
    final auth = AuthResponse.fromJson(res.data as Map<String, dynamic>);
    return UserSession(
      userId: userIdFromJwt(auth.token),
      token: auth.token,
      predicted: auth.predicted,
      payed: auth.payed,
    );
  }
}
