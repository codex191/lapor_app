import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:intl/intl.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({super.key});

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  String? JenisAduan;
  bool _validate = false;
  TextEditingController nama = TextEditingController(text: "");
  TextEditingController notelpController = TextEditingController(text: "");

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
                  CircleAvatar(),
                  const SizedBox(height: 16),
                  TextFormField(
                    initialValue: '',
                    decoration: InputDecoration(
                      labelText: 'Nama Baru',
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
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.blueAccent,
                    ),
                    onPressed: () {
                      setState(() {
                        nama.text.isEmpty
                            ? _validate = true
                            : _validate = false;
                      });
                    },
                    child: const Text(
                      'Edit Profil',
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
