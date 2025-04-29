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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
    );
  }
}
