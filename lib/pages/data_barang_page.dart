import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ucp_1pml/pages/detail_barang_page.dart';

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

  void calculateTotalPrice() {
    int jumlahBarang = int.tryParse(_jumlahBarangController.text) ?? 0;
    int hargaSatuan = int.tryParse(_hargaSatuanController.text) ?? 0;

    setState(() {
      totalHarga = jumlahBarang * hargaSatuan;
    });
  }

  String? _validateTanggal(String? value) {
    if (value == null || value.isEmpty) {
      return 'Tanggal tidak boleh kosong';
    }
    return null;
  }

  String? _validateJenistransaksi(String? value) {
    if (value == null || value.isEmpty) {
      return 'Jenis Transaksi tidak boleh kosong';
    }
    return null;
  }

  String? _validateJensibarang(String? value) {
    if (value == null || value.isEmpty) {
      return 'Jenis Barang tidak boleh kosong';
    }
    return null;
  }

  String? _validateJumlahBarang(String? value) {
    if (value == null || value.isEmpty) {
      return 'Jumlah Barang tidak boleh kosong';
    }
    return null;
  }

  String? _validateHargaSatuan(String? value) {
    if (value == null || value.isEmpty) {
      return 'Harga Satuan tidak boleh kosong';
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
        title: const Text(
          'Pendataan Barang',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: const Text(
                  'Tanggal Transaksi',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 8),
              TextFormField(
                controller: _tanggalTransaksiController,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.event_available_outlined),
                  hintText: "Tanggal Transaksi",
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
                      _tanggalTransaksiController.text = DateFormat(
                        "EEEE, dd MMMM yyyy",
                        "id_ID",
                      ).format(pickedDate);
                    });
                  }
                },
                validator: _validateTanggal,
              ),
              const SizedBox(height: 30),
              DropdownButtonFormField<String>(
                value: _jenisTransaksiController,
                hint: const Text('Pilih jenis transaksi'),
                items:
                    jenisTransaksi.map((value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                onChanged: (String? value) {
                  setState(() {
                    _jenisTransaksiController = value;
                  });
                },
                decoration: InputDecoration(
                  labelText: 'Jenis Transaksi',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                validator: _validateJenistransaksi,
              ),
              const SizedBox(height: 30),
              DropdownButtonFormField<String>(
                value: _jenisBarangController,
                hint: Text('Pilih jenis barang'),
                items:
                    jenisBarang.map((value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                onChanged: (String? value) {
                  setState(() {
                    _jenisBarangController = value;
                    if (value != null) {
                      _hargaSatuanController.text =
                          hargaBarang[value]!.toString();
                    }
                  });
                },
                decoration: InputDecoration(
                  labelText: 'Jenis Barang',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                validator: _validateJensibarang,
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Jumlah Barang',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 8),
                        TextFormField(
                          controller: _jumlahBarangController,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            hintText: 'Jumlah barang',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                          ),
                          validator: _validateJumlahBarang,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    flex: 1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Harga Satuan',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 8),
                        TextFormField(
                          controller: _hargaSatuanController,
                          readOnly: true,
                          decoration: InputDecoration(
                            prefixText: 'Rp. ',
                            hintText: 'Harga Satuan',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                          ),
                          validator: _validateHargaSatuan,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 32),
              SizedBox(
                width: double.infinity,
                height: 60,
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      calculateTotalPrice();
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder:
                              (context) => DetailBarangPage(
                                tanggalTransaksi:
                                    _tanggalTransaksiController.text,
                                jenisTransaksi:
                                    _jenisTransaksiController.toString(),
                                jenisBarang: _jenisBarangController.toString(),
                                hargaSatuan: _hargaSatuanController.text,
                                jumlahBarang: _jumlahBarangController.text,
                                totalHarga: totalHarga,
                              ),
                        ),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepOrange,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    'Submit',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
