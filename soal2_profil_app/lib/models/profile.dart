class Profile {
  final String name;
  final String nim;
  final String prodi;
  final String kelas;
  final String bio;
  final String email;
  final String hp;
  final String github;

  const Profile({
    required this.name,
    required this.nim,
    required this.prodi,
    required this.kelas,
    required this.bio,
    required this.email,
    required this.hp,
    required this.github,
  });

  Profile copyWith({
    String? name,
    String? nim,
    String? prodi,
    String? kelas,
    String? bio,
    String? email,
    String? hp,
    String? github,
  }) {
    return Profile(
      name: name ?? this.name,
      nim: nim ?? this.nim,
      prodi: prodi ?? this.prodi,
      kelas: kelas ?? this.kelas,
      bio: bio ?? this.bio,
      email: email ?? this.email,
      hp: hp ?? this.hp,
      github: github ?? this.github,
    );
  }

  static Profile initial() => const Profile(
        name: 'Rayhan Ihsan Fadhilah',
        nim: '1126180062',
        prodi: 'Teknik Informatika',
        kelas: 'TI 24 SH SE',
        bio: 'Saya mahasiswa yang tertarik pada teknologi, pengembangan aplikasi, '
            'dan terus belajar untuk mengembangkan kemampuan diri.',
        email: 'rayhanihsanfadhilah@gmail.com',
        hp: '083819049467',
        github: 'Rayhanihsanf',
      );
}
