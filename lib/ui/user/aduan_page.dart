import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:flutter/services.dart';

import '../../auth/controller/add_aduan_controller.dart';

class AduanPage extends StatefulWidget {
  const AduanPage({super.key});

  @override
  State<AduanPage> createState() => _AduanPageState();
}

class _AduanPageState extends State<AduanPage> {
  String? JenisAduan;
  bool _validate = false;
  TextEditingController date = TextEditingController();
  TextEditingController judulController = TextEditingController(text: "");
  TextEditingController notelpController = TextEditingController(text: "");
  TextEditingController jenislaporanController =
      TextEditingController(text: "");
  TextEditingController isiLaporanController = TextEditingController(text: "");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: const BackButton(color: Colors.black),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Image.asset('assets/logolaporpky.png'),
                  const SizedBox(height: 16),
                  TextFormField(
                    initialValue: '',
                    decoration: InputDecoration(
                      labelText: 'Judul Laporan',
                      border: OutlineInputBorder(),
                      errorText: _validate ? 'Form tidak boleh kosong' : null,
                    ),
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    initialValue: '',
                    keyboardType: TextInputType.number,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    decoration: InputDecoration(
                      labelText: 'No. Telpon',
                      border: OutlineInputBorder(),
                      errorText: _validate ? 'Form tidak boleh kosong' : null,
                    ),
                  ),
                  const SizedBox(height: 16),
                  DropdownSearch<String>(
                    popupProps: PopupProps.menu(
                      showSelectedItems: true,
                    ),
                    items: ["Pengaduan", "Aspirasi", "Permintaan Informasi"],
                    dropdownDecoratorProps: DropDownDecoratorProps(
                      dropdownSearchDecoration: InputDecoration(
                        labelText: "Jenis Laporan",
                        hintText: "country in menu mode",
                        errorText: _validate ? 'Form tidak boleh kosong' : null,
                      ),
                    ),
                    onChanged: print,
                    selectedItem: "",
                  ),
                  const SizedBox(height: 16),
                  TextField(
                      controller: date,
                      keyboardType: TextInputType.datetime,
                      decoration: const InputDecoration(
                          icon: Icon(Icons.calendar_today_rounded),
                          labelText: "Select Date"),
                      onTap: () async {
                        DateTime? pickdate = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(2000),
                            lastDate: DateTime(2101));
                        if (pickdate != null) {
                          setState(() {
                            date.text =
                                DateFormat('yyyy-MM-dd').format(pickdate);
                          });
                        }
                      }),
                  const SizedBox(height: 16),
                  DropdownSearch<String>(
                    popupProps: PopupProps.menu(
                      showSelectedItems: true,
                    ),
                    items: [
                      "Jekan Raya",
                      "Pahandut",
                      "Bukit Batu",
                      "Sebangau",
                      "Rakumpit"
                    ],
                    dropdownDecoratorProps: DropDownDecoratorProps(
                      dropdownSearchDecoration: InputDecoration(
                        labelText: "Kecamatan",
                        hintText: "country in menu mode",
                        errorText: _validate ? 'Form tidak boleh kosong' : null,
                      ),
                    ),
                    onChanged: print,
                    selectedItem: "",
                  ),
                  DropdownSearch<String>(
                    popupProps: PopupProps.menu(
                      showSelectedItems: true,
                    ),
                    items: [
                      "Jekan Raya",
                      "Pahandut",
                      "Bukit Batu",
                      "Sebangau",
                      "Rakumpit"
                    ],
                    dropdownDecoratorProps: DropDownDecoratorProps(
                      dropdownSearchDecoration: InputDecoration(
                        labelText: "Kecamatan",
                        hintText: "country in menu mode",
                        errorText: _validate ? 'Form tidak boleh kosong' : null,
                      ),
                    ),
                    onChanged: print,
                    selectedItem: "",
                  ),
                  const SizedBox(height: 16),
                  DropdownSearch<String>(
                    popupProps: PopupProps.menu(
                      showSelectedItems: true,
                    ),
                    items: [
                      "Jekan Raya",
                      "Pahandut",
                      "Bukit Batu",
                      "Sebangau",
                      "Rakumpit"
                    ],
                    dropdownDecoratorProps: DropDownDecoratorProps(
                      dropdownSearchDecoration: InputDecoration(
                        labelText: "Kelurahan",
                        hintText: "country in menu mode",
                        errorText: _validate ? 'Form tidak boleh kosong' : null,
                      ),
                    ),
                    onChanged: print,
                    selectedItem: "",
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {},
                    child: const Text('Masukkan Gambar'),
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    initialValue: '',
                    decoration: InputDecoration(
                      labelText: 'Isi Laporan',
                      border: OutlineInputBorder(),
                      errorText: _validate ? 'Form tidak boleh kosong' : null,
                    ),
                    maxLines: 5,
                    minLines: 1,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.blueAccent,
                    ),
                    onPressed: () {
                      setState(() {
                        judulController.text.isEmpty
                            ? _validate = true
                            : _validate = false;
                      });
                    },
                    child: const Text(
                      'Adukan',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
