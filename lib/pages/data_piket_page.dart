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
      appBar: AppBar(
        toolbarHeight: 80,
        backgroundColor: Colors.deepOrange,
        foregroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          'Piket Gudang',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        children: [
          Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: const Text(
                      'Nama Anggota',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(height: 8),
                  TextFormField(
                    controller: _namaAnggotaController,
                    decoration: InputDecoration(
                      hintText: "Nama Lengkap",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),

                    autovalidateMode: AutovalidateMode.onUserInteraction,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
