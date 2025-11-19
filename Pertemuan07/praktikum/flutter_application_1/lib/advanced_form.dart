import 'dart:io';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:file_picker/file_picker.dart';
import 'package:open_file/open_file.dart';

class AdvancedForm extends StatefulWidget {
  const AdvancedForm({super.key});

  @override
  State<AdvancedForm> createState() => _AdvancedFormState();
}

class _AdvancedFormState extends State<AdvancedForm> {
  DateTime _dueDate = DateTime.now();
  final currentDate = DateTime.now();
  Color _currentColor = Colors.orange;

  String? _dataFile;
  File? _imageFile;

  Future<void> _pickFile() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.any,
    );

    if (result == null) return;

    final file = result.files.first;

    String ext = file.extension!.toLowerCase();

    // Jika file adalah gambar → tampilkan
    if (ext == 'jpg' || ext == 'jpeg' || ext == 'png') {
      setState(() {
        _imageFile = File(file.path!);
        _dataFile = file.name;
      });
      return;
    }

    // Jika file lain → simpan nama + buka file
    setState(() {
      _dataFile = file.name;
      _imageFile = null; // supaya tidak tampil gambar lama
    });

    OpenFile.open(file.path);
  }

  Widget buildDatePicker(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('Date'),
            TextButton(
              child: const Text('Select'),
              onPressed: () async {
                final pick = await showDatePicker(
                  context: context,
                  initialDate: _dueDate,
                  firstDate: DateTime(1990),
                  lastDate: DateTime(currentDate.year + 5),
                );

                if (pick != null) {
                  setState(() => _dueDate = pick);
                }
              },
            ),
          ],
        ),
        Text(DateFormat('dd MMMM yyyy').format(_dueDate)),
      ],
    );
  }

  Widget buildColorPicker(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Color'),
        const SizedBox(height: 10),
        Container(
          height: 100,
          width: double.infinity,
          color: _currentColor,
        ),
        const SizedBox(height: 10),
        Center(
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: _currentColor),
            onPressed: () {
              showDialog(
                context: context,
                builder: (_) {
                  return AlertDialog(
                    title: const Text('Pick Your Color'),
                    content: BlockPicker(
                      pickerColor: _currentColor,
                      onColorChanged: (color) {
                        setState(() => _currentColor = color);
                      },
                    ),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: const Text('Save'),
                      )
                    ],
                  );
                },
              );
            },
            child: const Text('Pick Color'),
          ),
        ),
      ],
    );
  }

  Widget buildFilePicker(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Pick File'),
        const SizedBox(height: 10),
        Center(
          child: ElevatedButton(
            onPressed: _pickFile,
            child: const Text('Pick and Open File'),
          ),
        ),

        const SizedBox(height: 10),

        // tampilkan nama file
        if (_dataFile != null)
          Text('File Name: $_dataFile'),

        const SizedBox(height: 10),

        // tampilkan gambar jika file adalah gambar
        if (_imageFile != null)
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.file(
              _imageFile!,
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Interactive Widget'),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          buildDatePicker(context),
          const SizedBox(height: 20),
          buildColorPicker(context),
          const SizedBox(height: 20),
          buildFilePicker(context),
        ],
      ),
    );
  }
}
