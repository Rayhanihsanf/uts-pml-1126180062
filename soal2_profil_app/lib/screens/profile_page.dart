import 'package:flutter/material.dart';
import '../models/profile.dart';
import '../widgets/info_tile.dart';
import 'about_page.dart';
import 'edit_profile_page.dart';

class ProfilePage extends StatefulWidget {
  final Profile profile;
  final ValueChanged<Profile> onProfileChanged;
  final VoidCallback onLogout;
  final bool isDarkMode;
  final ValueChanged<bool> onThemeChanged;

  const ProfilePage({
    super.key,
    required this.profile,
    required this.onProfileChanged,
    required this.onLogout,
    required this.isDarkMode,
    required this.onThemeChanged,
  });

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  int _selectedIndex = 0;
  late Profile _profile;

  @override
  void initState() {
    super.initState();
    _profile = widget.profile;
  }

  Future<void> _editProfile() async {
    final updated = await Navigator.push<Profile>(
      context,
      MaterialPageRoute(
        builder: (_) => EditProfilePage(profile: _profile),
      ),
    );
    if (updated != null) {
      setState(() => _profile = updated);
      widget.onProfileChanged(updated);
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Profil berhasil diperbarui')),
        );
      }
    }
  }

  void _selectPage(int index) {
    setState(() => _selectedIndex = index);
  }

  @override
  Widget build(BuildContext context) {
    final pages = [_buildProfileContent(), const AboutPage()];
    return Scaffold(
      appBar: AppBar(
        title: Text(_selectedIndex == 0 ? 'Profil Mahasiswa' : 'Tentang Saya'),
        actions: [
        ],
      ),
      drawer: Drawer(
        child: SafeArea(
          child: Column(
            children: [
              UserAccountsDrawerHeader(
                currentAccountPicture: const CircleAvatar(
                  backgroundImage: AssetImage('assets/images/barista.png'),
                ),
                accountName: Text(_profile.name),
                accountEmail: Text(_profile.nim),
              ),
              ListTile(
                leading: const Icon(Icons.person_outline),
                title: const Text('Profil'),
                selected: _selectedIndex == 0,
                onTap: () {
                  Navigator.pop(context);
                  _selectPage(0);
                },
              ),
              ListTile(
                leading: const Icon(Icons.info_outline),
                title: const Text('Tentang Saya'),
                selected: _selectedIndex == 1,
                onTap: () {
                  Navigator.pop(context);
                  _selectPage(1);
                },
              ),
              const Divider(),
              SwitchListTile(
                secondary: Icon(widget.isDarkMode ? Icons.dark_mode : Icons.light_mode),
                title: const Text('Mode Gelap'),
                value: widget.isDarkMode,
                onChanged: widget.onThemeChanged,
              ),
              const Spacer(),
              ListTile(
                leading: const Icon(Icons.logout, color: Colors.red),
                title: const Text('Keluar'),
                onTap: widget.onLogout,
              ),
            ],
          ),
        ),
      ),
      body: IndexedStack(
        index: _selectedIndex,
        children: pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _selectPage,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profil'),
          BottomNavigationBarItem(icon: Icon(Icons.info), label: 'Tentang'),
        ],
      ),
      floatingActionButton: _selectedIndex == 0
          ? FloatingActionButton.extended(
              onPressed: _editProfile,
              icon: const Icon(Icons.edit),
              label: const Text('Edit Profil'),
            )
          : null,
    );
  }

  Widget _buildProfileContent() {
    return ListView(
      padding: const EdgeInsets.fromLTRB(20, 24, 20, 100),
      children: [
        Center(
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Theme.of(context).colorScheme.primary,
                    width: 3,
                  ),
                ),
                child: const CircleAvatar(
                  radius: 60,
                  backgroundImage: AssetImage('assets/images/barista.png'),
                ),
              ),
              const SizedBox(height: 16),
              Text(
                _profile.name,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const SizedBox(height: 6),
              Text(
                _profile.nim,
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: Theme.of(context).colorScheme.primary,
                    ),
              ),
              const SizedBox(height: 12),
              Wrap(
                alignment: WrapAlignment.center,
                spacing: 8,
                runSpacing: 8,
                children: [
                  _tag(_profile.prodi, Icons.school_outlined),
                  _tag(_profile.kelas, Icons.groups_outlined),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(height: 26),
        _sectionTitle('Tentang Saya'),
        Card(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Text(_profile.bio, textAlign: TextAlign.justify),
          ),
        ),
        const SizedBox(height: 18),
        _sectionTitle('Informasi Kontak'),
        InfoTile(
          icon: Icons.email_outlined,
          title: 'Email',
          subtitle: _profile.email,
        ),
        InfoTile(
          icon: Icons.phone_outlined,
          title: 'Nomor HP',
          subtitle: _profile.hp,
        ),
        InfoTile(
          icon: Icons.code,
          title: 'GitHub',
          subtitle: _profile.github,
        ),
      ],
    );
  }

  Widget _sectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Text(
        title,
        style: Theme.of(context).textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.bold,
            ),
      ),
    );
  }

  Widget _tag(String text, IconData icon) {
    return Chip(
      avatar: Icon(icon, size: 17),
      label: Text(text),
    );
  }
}
