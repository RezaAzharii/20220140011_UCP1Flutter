import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DataPiketPage extends StatefulWidget {
  final String namaAkun;
  const DataPiketPage({
    super.key,
    required this.namaAkun
  });

  @override
  State<DataPiketPage> createState() => _DataPiketPageState();
}

class _DataPiketPageState extends State<DataPiketPage> {
  final _namaAnggotaController = TextEditingController();
  final _tanggalPiketController = TextEditingController();
  final _tugasPiketController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  List<Map<String, dynamic>> daftarPiket = [];

  @override
  void initState() {
    super.initState();
    _namaAnggotaController.text = widget.namaAkun;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
    );
  }
}
