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
                  const SizedBox(height: 8),
                  TextFormField(
                    controller: _tanggalPiketController,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.event_available_outlined),
                      hintText: "Pilih Tanggal",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    readOnly: true,
                    onTap: () async {
                      DateTime? pickedDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2000),
                        lastDate: DateTime(2101),
                      );
                      if (pickedDate != null) {
                        setState(() {
                          _tanggalPiketController.text = DateFormat(
                            "EEEE, dd MMMM yyyy",
                            "id_ID",
                          ).format(pickedDate);
                        });
                      }
                    },
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                  ),
                  const SizedBox(height: 20),
                  Align(
                    alignment: Alignment.topLeft,
                    child: const Text(
                      'Tugas Piket',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            TextFormField(
                              controller: _tugasPiketController,
                              decoration: InputDecoration(
                                hintText: "Tugas Piket",
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(16),
                                ),
                              ),

                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 20),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ButtonStyle(
                            fixedSize: WidgetStateProperty.all(
                              const Size(400, 56),
                            ),
                            backgroundColor: WidgetStateProperty.all(
                              Colors.deepOrange,
                            ),
                            shape: WidgetStateProperty.all(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                          ),
                          child: const Text(
                            "Tambah",
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ]
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
