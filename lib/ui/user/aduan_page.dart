import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter/services.dart';

class AduanPage extends StatefulWidget {
  const AduanPage({super.key});

  @override
  State<AduanPage> createState() => _AduanPageState();
}

class _AduanPageState extends State<AduanPage> {
  String? JenisAduan;
  TextEditingController date = TextEditingController();

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
                  Image.asset('assets/LaporTrans.png'),
                  const SizedBox(height: 16),
                  TextFormField(
                    initialValue: '',
                    decoration: InputDecoration(
                      labelText: 'Judul Laporan',
                      border: OutlineInputBorder(),
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
                  TextFormField(
                    initialValue: '',
                    decoration: InputDecoration(
                      labelText: 'Nama',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    initialValue: '',
                    decoration: InputDecoration(
                      labelText: 'Isi Laporan',
                      border: OutlineInputBorder(),
                    ),
                    maxLines: 5,
                    minLines: 1,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.blueAccent,
                    ),
                    onPressed: () {},
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