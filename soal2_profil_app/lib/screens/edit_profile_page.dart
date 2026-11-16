import 'package:flutter/material.dart';
import '../models/profile.dart';

class EditProfilePage extends StatefulWidget {
  final Profile profile;

  const EditProfilePage({super.key, required this.profile});

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _nameController;
  late final TextEditingController _nimController;
  late final TextEditingController _prodiController;
  late final TextEditingController _kelasController;
  late final TextEditingController _bioController;
  late final TextEditingController _emailController;
  late final TextEditingController _hpController; 
  late final TextEditingController _githubController;

  @override
  void initState() {
    super.initState();
    final p = widget.profile;
    _nameController = TextEditingController(text: p.name);
    _nimController = TextEditingController(text: p.nim);
    _prodiController = TextEditingController(text: p.prodi);
    _kelasController = TextEditingController(text: p.kelas);
    _bioController = TextEditingController(text: p.bio);
    _emailController = TextEditingController(text: p.email);
    _hpController = TextEditingController(text: p.hp);
    _githubController = TextEditingController(text: p.github);
  }

  @override
  void dispose() {
    _nameController.dispose();
    _nimController.dispose();
    _prodiController.dispose();
    _kelasController.dispose();
    _bioController.dispose();
    _emailController.dispose();
    _hpController.dispose();
    _githubController.dispose();
    super.dispose();
  }

  String? _validateEmail(String? value) {
    final email = value?.trim() ?? '';
    if (email.isEmpty) return 'Email wajib diisi';
    if (!RegExp(r'^[\w.+-]+@[\w-]+(\.[\w-]+)+$').hasMatch(email)) {
      return 'Masukkan format email yang valid';
    }
    return null;
  }

  String? _validatePhone(String? value) {
    final phone = value?.trim() ?? '';
    if (!RegExp(r'^\d{10,13}$').hasMatch(phone)) {
      return 'Nomor HP harus 10–13 digit angka';
    }
    return null;
  }

  void _save() {
    if (!_formKey.currentState!.validate()) return;
    final updated = widget.profile.copyWith(
      name: _nameController.text.trim(),
      nim: _nimController.text.trim(),
      prodi: _prodiController.text.trim(),
      kelas: _kelasController.text.trim(),
      bio: _bioController.text.trim(),
      email: _emailController.text.trim(),
      hp: _hpController.text.trim(),
      github: _githubController.text.trim(),
    );
    Navigator.pop(context, updated);
  }

  InputDecoration _decoration(String label, IconData icon) {
    return InputDecoration(
      labelText: label,
      prefixIcon: Icon(icon),
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(14)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Edit Profil')),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            TextFormField(
              controller: _nameController,
              decoration: _decoration('Nama lengkap', Icons.person_outline),
              textCapitalization: TextCapitalization.words,
              validator: (v) => v == null || v.trim().isEmpty
                  ? 'Nama lengkap wajib diisi'
                  : null,
            ),
            const SizedBox(height: 14),
            TextFormField(
              controller: _nimController,
              decoration: _decoration('NIM', Icons.badge_outlined),
            ),
            const SizedBox(height: 14),
            TextFormField(
              controller: _prodiController,
              decoration: _decoration('Program studi', Icons.school_outlined),
            ),
            const SizedBox(height: 14),
            TextFormField(
              controller: _kelasController,
              decoration: _decoration('Kelas', Icons.groups_outlined),
            ),
            const SizedBox(height: 14),
            TextFormField(
              controller: _bioController,
              decoration: _decoration('Bio singkat', Icons.notes),
              maxLines: 3,
            ),
            const SizedBox(height: 14),
            TextFormField(
              controller: _emailController,
              decoration: _decoration('Email', Icons.email_outlined),
              keyboardType: TextInputType.emailAddress,
              validator: _validateEmail,
            ),
            const SizedBox(height: 14),
            TextFormField(
              controller: _hpController,
              decoration: _decoration('Nomor HP', Icons.phone_outlined),
              keyboardType: TextInputType.number,
              validator: _validatePhone,
            ),
            const SizedBox(height: 14),
            TextFormField(
              controller: _githubController,
              decoration: _decoration('Akun GitHub', Icons.code),
            ),
            const SizedBox(height: 24),
            SizedBox(
              height: 52,
              child: FilledButton.icon(
                onPressed: _save,
                icon: const Icon(Icons.save_outlined),
                label: const Text('Simpan Perubahan'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
