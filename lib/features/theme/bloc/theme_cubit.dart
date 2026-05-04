import 'package:flutter_bloc/flutter_bloc.dart';

import '../domain/tournament_theme.dart';

class ThemeCubit extends Cubit<TournamentTheme> {
  ThemeCubit() : super(defaultTournamentTheme);

  void setTheme(TournamentTheme theme) => emit(theme);
}
