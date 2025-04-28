import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DataPiketPage extends StatefulWidget {
  final String namaAkun;
  const DataPiketPage({super.key, required this.namaAkun});

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

  String? _validateNamaAnggota(String? value) {
    if (value == null || value.isEmpty) {
      return 'Nama tidak boleh kosong';
    }
    return null;
  }

  String? _validateTanggalPiket(String? value) {
    if (value == null || value.isEmpty) {
      return 'Tanggal tidak boleh kosong';
    }
    return null;
  }

  String? _validateTugasPiket(String? value) {
    if (value == null || value.isEmpty) {
      return 'Tugas tidak boleh kosong';
    }
    return null;
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
                    validator: _validateNamaAnggota,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                  ),
                  const SizedBox(height: 20),
                  Align(
                    alignment: Alignment.topLeft,
                    child: const Text(
                      'Pilih Tanggal',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
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
                    validator: _validateTanggalPiket,
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
                              validator: _validateTugasPiket,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 20),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              setState(() {
                                daftarPiket.add({
                                  'namaAnggota': _namaAnggotaController.text,
                                  'tanggalPiket': _tanggalPiketController.text,
                                  'tugasPiket': _tugasPiketController.text,
                                });
                                _tanggalPiketController.clear();
                                _tugasPiketController.clear();
                              });
                            }
                          },
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
                    ],
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: const Text(
              'Daftar Tugas Piket',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(height: 20),
          Expanded(
            child:
                daftarPiket.isEmpty
                    ? Center(
                      child: Text(
                        "Belum ada Data",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey,
                        ),
                      ),
                    )
                    : ListView.builder(
                      itemCount: daftarPiket.length,
                      itemBuilder: (context, index) {
                        final piket = daftarPiket[index];
                        return GestureDetector(
                          onTap: () {},
                          child: Card(
                            color: Colors.deepOrange,
                            margin: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 8,
                            ),
                            elevation: 4,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: ListTile(
                              title: Text(
                                piket['tugasPiket'],
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              trailing: Icon(
                                Icons.arrow_forward_ios,
                                size: 16,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
          ),
        ],
      ),
    );
  }
}
