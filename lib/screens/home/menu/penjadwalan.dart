import 'package:flutter/material.dart';
import 'package:login_signup/widgets/custom_textfield.dart';
import 'package:login_signup/widgets/custom_timepicker.dart';
import 'package:login_signup/widgets/custom_datepicker.dart';

class PenjadwalanPage extends StatelessWidget {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController subjectController = TextEditingController();
  final TextEditingController dateController = TextEditingController();
  final TextEditingController timeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          "Tambah Penjadwalan",
          style: TextStyle(
            color: Colors.green,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: 40),
              CustomTextField(
                labelText: 'Title',
                controller: titleController,
              ),
              SizedBox(height: 15),
              CustomTextField(
                labelText: 'Subject',
                controller: subjectController,
              ),
              SizedBox(height: 20),
              CustomDatePickerField(
                labelText: 'Date',
                controller: dateController,
              ),
                SizedBox(height: 15),
              CustomTimePickerField( // Gunakan CustomTimePickerField
                labelText: 'Time',
                controller: timeController,
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.green,
                ),
                onPressed: () {
                  // Lakukan aksi saat tombol ditekan
                  if (_validateInputs()) {
                    _saveData();
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Semua input harus diisi.'),
                      ),
                    );
                  }
                },
                child: Text('Simpan'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  bool _validateInputs() {
    return titleController.text.isNotEmpty &&
        subjectController.text.isNotEmpty &&
        dateController.text.isNotEmpty &&
        timeController.text.isNotEmpty;
  }

  void _saveData() {
    // Lakukan aksi untuk menyimpan data ke dalam database atau sumber data lainnya
    // Gunakan nilai dari titleController.text, subjectController.text, dateController.text, dan timeController.text
  }
}
