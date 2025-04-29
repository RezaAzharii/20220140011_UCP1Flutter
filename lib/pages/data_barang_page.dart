import 'package:flutter/material.dart';

class DataBarangPage extends StatefulWidget {
  const DataBarangPage({super.key});

  @override
  State<DataBarangPage> createState() => _DataBarangPageState();
}

class _DataBarangPageState extends State<DataBarangPage> {
  final _tanggalTransaksiController = TextEditingController();
  final _jumlahBarangController = TextEditingController();
  final _hargaSatuanController = TextEditingController();
  String? _jenisTransaksiController;
  String? _jenisBarangController;
  int totalHarga = 0;
  final _formKey = GlobalKey<FormState>();

  List<String> jenisTransaksi = ['Barang Masuk', 'Barang Keluar'];
  List<String> jenisBarang = ['Carrier', 'Sleeping Bag', 'Tenda', 'Sepatu'];

  final Map<String, int> hargaBarang = {
    'Carrier': 1500000,
    'Sleeping Bag': 300000,
    'Tenda': 700000,
    'Sepatu': 500000,
  };
  
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
