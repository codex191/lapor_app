import 'package:flutter/material.dart';

class Aduan {
  String id;
  String nama;
  String noTelp;
  String tgl;
  String aduan;
  String alamatKej;
  String jenisAduan;
  bool status;
  String imageGallery;
  Aduan({
    required this.id,
    required this.nama,
    required this.noTelp,
    required this.tgl,
    required this.alamatKej,
    required this.aduan,
    required this.status,
    required this.jenisAduan,
    required this.imageGallery,
  });
}

List<Aduan> dataAduan = [
  Aduan(
    id: DateTime.now().toString(),
    nama: "Brian",
    noTelp: "081340866989",
    tgl: '12-10-2022',
    alamatKej: 'Jl. Hiu Putih VII B No. 17',
    aduan:
        "Terdapat Jalan berlobang di sekitar jalan hiu putih vii b no 19, harap pihak terkait dapat memperbaiki masalah tersebut",
    status: false,
    jenisAduan: "Aduan",
    imageGallery: 'assets/images/jalan-berlubang1.jpeg',
  ),
  Aduan(
    id: DateTime.now().toString(),
    nama: "Brian",
    noTelp: "081340866989",
    tgl: '12-10-2022',
    alamatKej: 'Jl. Hiu Putih VII B No. 17',
    aduan:
        "Terdapat Jalan berlobang di sekitar jalan hiu putih vii b no 19, harap pihak terkait dapat memperbaiki masalah tersebut",
    status: false,
    jenisAduan: "Aduan",
    imageGallery: 'assets/images/jalan-berlubang1.jpeg',
  ),
  Aduan(
    id: DateTime.now().toString(),
    nama: "Brian",
    noTelp: "081340866989",
    tgl: '12-10-2022',
    alamatKej: 'Jl. Hiu Putih VII B No. 17',
    aduan:
        "Terdapat Jalan berlobang di sekitar jalan hiu putih vii b no 19, harap pihak terkait dapat memperbaiki masalah tersebut",
    status: true,
    jenisAduan: "Aduan",
    imageGallery: 'assets/images/jalan-berlubang1.jpeg',
  ),
  Aduan(
    id: DateTime.now().toString(),
    nama: "Brian",
    noTelp: "081340866989",
    tgl: '12-10-2022',
    alamatKej: 'Jl. Hiu Putih VII B No. 17',
    aduan:
        "Terdapat Jalan berlobang di sekitar jalan hiu putih vii b no 19, harap pihak terkait dapat memperbaiki masalah tersebut",
    status: false,
    jenisAduan: "Aduan",
    imageGallery: 'assets/images/jalan-berlubang1.jpeg',
  ),
];
