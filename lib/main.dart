import 'package:flutter/material.dart';

void main(){
  runApp(MainApp());
}
class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Profil Rayhan',
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,
      home: ProfilSaya(),
    );
  }
}
class ProfilSaya extends StatelessWidget {
  const ProfilSaya({super.key});
  final String nama = 'Rayhan Ihsan Fadhilah';
  final String nim = '1126180062';
  final String prodi = 'Teknik Informatika';
  final String role = 'Mahasiswa Global Institut';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Profil Rayhan Ihsan Fadhilah',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.deepOrange,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 40,
              child: Icon(Icons.person, size: 40, color: Colors.white,),
              backgroundColor: Colors.grey,
            ),
            SizedBox(height: 15),
            Text(
              nama,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            Text(
              nim,
              style: TextStyle(
                fontSize: 15,
                color: Colors.black,
              ),
            ),
            Text(
              prodi,
              style: TextStyle(
                fontSize: 15,
                color: Colors.black,
              ),
            ),
            Text(
              role,
              style: TextStyle(
                fontSize: 15,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 15),
            ElevatedButton.icon(onPressed: (){}, 
            label: Text('Edit'),
            icon: Icon(Icons.edit),
            ),
            SizedBox(height: 15),
            Align(
              alignment: Alignment.centerLeft,
              child: Text('Data Diri',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black
              ),),
            ),
            Divider(),
            Expanded(child: ListView(
              children: [
                Column(
                  children: [
                    Card(
                      child:  ListTile(
                      leading: Icon(Icons.email),
                      title: Text('Email'),
                      subtitle: Text('rayhanihsanfadhilah@gmail.com'),
                    ),
                    ),
                    Card(
                      child:  ListTile(
                      leading: Icon(Icons.phone),
                      title: Text('No Hp'),
                      subtitle: Text('+62 83819049467'),
                    ),
                    ),
                    Card(
                      child:  ListTile(
                      leading: Icon(Icons.home),
                      title: Text('Alamat'),
                      subtitle: Text('Mulya Asri 2 Blok H2/06'),
                    ),
                    ),
                  ],
                )
              ],
            ))
          ],
        ),
      ),
    );
  }
}