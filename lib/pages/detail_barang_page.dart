import 'package:flutter/material.dart';

class DetailBarangPage extends StatelessWidget {
  final String tanggalTransaksi;
  final String jenisTransaksi;
  final String jenisBarang;
  final String jumlahBarang;
  final String hargaSatuan;
  final int totalHarga;
  const DetailBarangPage({
    super.key,
    required this.tanggalTransaksi,
    required this.jenisTransaksi,
    required this.jenisBarang,
    required this.jumlahBarang,
    required this.hargaSatuan,
    required this.totalHarga,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
    );
  }
}
