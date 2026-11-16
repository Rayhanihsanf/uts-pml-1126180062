import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    final skills = [
      ('Pengembangan Aplikasi', 'Mempelajari pembuatan aplikasi menggunakan Flutter dan Dart.', Icons.phone_android),
      ('Figma Design', 'Mempelajari design dan Prototyping.', Icons.code),
      ('Problem Solving', 'Melatih kemampuan menganalisis masalah dan mencari solusi.', Icons.lightbulb_outline),
    ];
    final hobbies = [
      ('Badminton', 'Olahraga dan menjaga kebugaran.', Icons.sports_tennis),
      ('Billiard', 'Mengisi waktu luang dan melatih fokus.', Icons.sports),
      ('Bersepeda', 'Melatih otot dan menjaga kebugaran.', Icons.bike_scooter),
    ];
    final education = [
      ('Perguruan Tinggi', 'Global Institute of Technology and Business'),
      ('Sekolah Menengah Atas', 'SMA NEGERI 18 KAB.TANGERANG'),
      ('Sekolah Menengah Pertama', 'SMP NEGERI 2 KAB.TANGERNG'),
    ];

    return ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Text('Keahlian', style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold)),
          const SizedBox(height: 12),
          ...skills.map((item) => Card(
                child: ListTile(
                  leading: CircleAvatar(child: Icon(item.$3)),
                  title: Text(item.$1, style: const TextStyle(fontWeight: FontWeight.w600)),
                  subtitle: Text(item.$2),
                ),
              )),
          const SizedBox(height: 20),
          Text('Hobi dan Minat', style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold)),
          const SizedBox(height: 12),
          ...hobbies.map((item) => Card(
                child: ListTile(
                  leading: CircleAvatar(child: Icon(item.$3)),
                  title: Text(item.$1),
                  subtitle: Text(item.$2),
                ),
              )),
          const SizedBox(height: 20),
          Text('Riwayat Pendidikan', style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold)),
          const SizedBox(height: 12),
          ...education.map((item) => Card(
                child: ListTile(
                  leading: const CircleAvatar(child: Icon(Icons.school_outlined)),
                  title: Text(item.$1),
                  subtitle: Text(item.$2),
                ),
              )),
        ],
    );
  }
}
