import 'package:flutter/material.dart';

class ProfilePelangganPage extends StatelessWidget {
  final String namaCustomer;
  final String email;
  final String noHp;
  final String alamat;
  final String provinsi;
  final String kodePos;
  const ProfilePelangganPage({
    super.key,
    required this.namaCustomer,
    required this.email,
    required this.noHp,
    required this.alamat,
    required this.provinsi,
    required this.kodePos,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 80,
        backgroundColor: Colors.deepOrange,
        foregroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          'Detail $namaCustomer',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 70,
              backgroundImage: AssetImage('assets/images/bob3.jpg'),
            ),
          ],
        ),
      ),
    );
  }
}