import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../shared/widgets/avatar.dart';
import '../../../theme/domain/tournament_theme.dart';
import '../bloc/profile_cubit.dart';
import '../bloc/profile_state.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final _name = TextEditingController();
  final _bio = TextEditingController();

  String? _photoPath;
  String? _initialPhotoUrl;
  bool _initialized = false;

  @override
  void initState() {
    super.initState();
    context.read<ProfileCubit>().load();
  }

  @override
  void dispose() {
    _name.dispose();
    _bio.dispose();
    super.dispose();
  }

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final picked = await picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 80,
    );
    if (picked != null) {
      setState(() => _photoPath = picked.path);
    }
  }

  void _save() {
    if (_name.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('El nombre no puede estar vacío.')),
      );
      return;
    }
    context.read<ProfileCubit>().save(
          name: _name.text.trim(),
          bio: _bio.text.trim(),
          photoPath: _photoPath,
        );
  }

  @override
  Widget build(BuildContext context) {
    final tournament = context.tournamentTheme;
    return BlocConsumer<ProfileCubit, ProfileState>(
      listener: (context, state) {
        if (state.profile != null && !_initialized) {
          _initialized = true;
          _name.text = state.profile!.name;
          _bio.text = state.profile!.bio ?? '';
          _initialPhotoUrl = state.profile!.photoUrl;
        }
        if (state.saved) {
          Navigator.of(context).pop();
        }
        if (state.error != null) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('No se pudieron guardar los cambios.'),
            ),
          );
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(title: const Text('Ajustes')),
          body: state.loading
              ? const Center(child: CircularProgressIndicator())
              : SingleChildScrollView(
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    children: [
                      GestureDetector(
                        onTap: _pickImage,
                        child: Stack(
                          children: [
                            _photoPath != null
                                ? ClipOval(
                                    child: Image.file(
                                      File(_photoPath!),
                                      width: 96,
                                      height: 96,
                                      fit: BoxFit.cover,
                                    ),
                                  )
                                : Avatar(
                                    name: _name.text.isEmpty
                                        ? '?'
                                        : _name.text,
                                    size: 96,
                                    uri: _initialPhotoUrl,
                                  ),
                            Positioned(
                              right: 0,
                              bottom: 0,
                              child: Container(
                                width: 32,
                                height: 32,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.white,
                                  border: Border.all(
                                    color: tournament.borderColor,
                                  ),
                                ),
                                child: Icon(Icons.camera_alt,
                                    size: 16, color: tournament.primaryColor),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 32),
                      _LabelField(
                        label: 'NOMBRE',
                        controller: _name,
                        hint: 'Tu nombre',
                      ),
                      const SizedBox(height: 20),
                      _LabelField(
                        label: 'BIO',
                        controller: _bio,
                        hint: 'Algo sobre ti',
                        maxLength: 140,
                      ),
                      const SizedBox(height: 24),
                      SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: FilledButton(
                          onPressed: state.saving ? null : _save,
                          style: FilledButton.styleFrom(
                            backgroundColor: Colors.black,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: state.saving
                              ? const CircularProgressIndicator(
                                  color: Colors.white,
                                  strokeWidth: 2,
                                )
                              : const Text(
                                  'Guardar',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white,
                                  ),
                                ),
                        ),
                      ),
                    ],
                  ),
                ),
        );
      },
    );
  }
}

class _LabelField extends StatelessWidget {
  const _LabelField({
    required this.label,
    required this.controller,
    required this.hint,
    this.maxLength,
  });

  final String label;
  final TextEditingController controller;
  final String hint;
  final int? maxLength;

  @override
  Widget build(BuildContext context) {
    final tournament = context.tournamentTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 6),
        TextField(
          controller: controller,
          maxLength: maxLength,
          style: const TextStyle(fontSize: 16),
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: TextStyle(color: tournament.placeholderTextColor),
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: tournament.borderColor),
            ),
          ),
        ),
      ],
    );
  }
}
