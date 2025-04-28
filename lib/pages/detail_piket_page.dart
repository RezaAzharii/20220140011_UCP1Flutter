import 'package:flutter/material.dart';

class DetailPiketPage extends StatelessWidget {
  final String namaAnggota;
  final String tanggalPiket;
  final String tugasPiket;
  const DetailPiketPage({
    super.key,
    required this.namaAnggota,
    required this.tanggalPiket,
    required this.tugasPiket,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        backgroundColor: Colors.deepOrange,
        foregroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          'Detail $tugasPiket',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}