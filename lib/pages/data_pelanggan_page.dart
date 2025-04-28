import 'package:flutter/material.dart';

class DataPelangganPage extends StatefulWidget {
  const DataPelangganPage({super.key});

  @override
  State<DataPelangganPage> createState() => _DataPelangganPageState();
}

class _DataPelangganPageState extends State<DataPelangganPage> {
  final _namaCustomerController = TextEditingController();
  final _emailController = TextEditingController();
  final _noHpController = TextEditingController();
  final _alamatController = TextEditingController();
  final _provinsiController = TextEditingController();
  final _kodePosController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  String? _validasiNamaCustomer (String? value){
    if(value == null || value.isEmpty){
      return 'Nama tidak boleh kosong';
    }
    return null;
  }

  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email';
    }
    if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
      return 'Please enter a valid email';
    }
    return null;
  }

  String? _validateNoHp(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'No HP wajib diisi';
    }
    if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
      return 'No HP harus berupa angka';
    }
    if (value.length < 10 || value.length > 13) {
      return 'No HP harus 10-13 digit';
    }
    return null;
  }

  String? _validasiAlamat (String? value){
    if(value == null || value.isEmpty){
      return 'Alamat tidak boleh kosong';
    }
    return null;
  }
  String? _validasiProvinsi (String? value){
    if(value == null || value.isEmpty){
      return 'Provinsi tidak boleh kosong';
    }
    return null;
  }
  String? _validasiKodePos (String? value){
    if(value == null || value.isEmpty){
      return 'Kode Pos tidak boleh kosong';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
    );
  }
}
