// lib/pages/contact_list_page.dart

import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:file_picker/file_picker.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';
import 'dart:io';

import 'package:flutter_application_1/models/contact.dart';

class ContactListPage extends StatefulWidget {
  const ContactListPage({super.key});

  @override
  State<ContactListPage> createState() => _ContactListPageState();
}

class _ContactListPageState extends State<ContactListPage> {
  int _selectedIndex = 1;
  final _formKey = GlobalKey<FormState>();

  // Data List Kontak (sudah dihapus data awal sesuai permintaan)
  List<Contact> contacts = [];

  // State Form
  final _phoneController = TextEditingController();
  final _nameController = TextEditingController();
  final _dateController = TextEditingController();
  Color _currentColor = Colors.green;
  File? _selectedFile;
  Contact? _contactToEdit; // Untuk operasi update

  @override
  void dispose() {
    _phoneController.dispose();
    _nameController.dispose();
    _dateController.dispose();
    super.dispose();
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    if (index == 0) {
      Navigator.pushReplacementNamed(context, '/');
    }
  }

  // --- FORM FUNCTIONS ---

  Future<void> _pickDate() async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2030),
    );

    if (pickedDate != null) {
      setState(() {
        _dateController.text = DateFormat('dd-MM-yyyy').format(pickedDate);
      });
    }
  }

  void _pickColor() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Pick a color!'),
        content: SingleChildScrollView(
          child: BlockPicker(
            pickerColor: _currentColor,
            onColorChanged: (color) {
              setState(() => _currentColor = color);
            },
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: const Text('GOT IT'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
  }

  Future<void> _pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      setState(() {
        _selectedFile = File(result.files.single.path!);
      });
      _showSnackBar("File ${_selectedFile!.path.split('/').last} dipilih!");
    } else {
      // User canceled the picker
      _selectedFile = null;
    }
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      if (_contactToEdit == null) {
        // --- C (Create) ---
        final newContact = Contact(
          id: const Uuid().v4(),
          phoneNumber: _phoneController.text,
          name: _nameController.text,
          date: _dateController.text,
          color: _currentColor,
          file: _selectedFile,
        );

        setState(() {
          contacts.add(newContact);
        });

        _showSnackBar('Kontak berhasil ditambahkan!');
      } else {
        // --- U (Update) ---
        setState(() {
          _contactToEdit!.phoneNumber = _phoneController.text;
          _contactToEdit!.name = _nameController.text;
          _contactToEdit!.date = _dateController.text;
          _contactToEdit!.color = _currentColor;
          _contactToEdit!.file = _selectedFile;
          _contactToEdit = null; // Reset mode edit
        });
        _showSnackBar('Kontak berhasil diperbarui!');
      }

      _clearForm();
    } else {
      // --- Validasi Semua Form ---
      _showSnackBar('Pengisian form belum lengkap atau tidak valid!', isError: true);
    }
  }

  void _editContact(Contact contact) {
    setState(() {
      _contactToEdit = contact;
      _phoneController.text = contact.phoneNumber;
      _nameController.text = contact.name;
      _dateController.text = contact.date;
      _currentColor = contact.color;
      _selectedFile = contact.file;
    });
    _showSnackBar('Mode Edit: Isi form untuk memperbarui kontak.');
  }

  void _deleteContact(String id) {
    setState(() {
      contacts.removeWhere((contact) => contact.id == id);
      if (_contactToEdit?.id == id) {
        _clearForm();
        _contactToEdit = null;
      }
    });
    _showSnackBar('Kontak berhasil dihapus!');
  }

  void _clearForm() {
    _phoneController.clear();
    _nameController.clear();
    _dateController.clear();
    setState(() {
      _currentColor = Colors.green;
      _selectedFile = null;
      _contactToEdit = null; // Pastikan mode edit hilang
    });
  }

  void _showSnackBar(String message, {bool isError = false}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: isError ? Colors.red : Colors.green,
      ),
    );
  }

  // --- VALIDATORS ---

  String? _validateName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Nama harus diisi.';
    }
    List<String> words = value.trim().split(RegExp(r'\s+'));
    if (words.length < 2) {
      return 'Nama harus terdiri dari minimal 2 kata.';
    }
    // Cek huruf kapital di awal setiap kata dan tidak ada angka/karakter khusus (kecuali spasi)
    RegExp charCheck = RegExp(r'[0-9!@#\$%^&*(),.?":{}|<>]');
    if (charCheck.hasMatch(value)) {
      return 'Nama tidak boleh mengandung angka atau karakter khusus.';
    }
    for (var word in words) {
      if (word.isNotEmpty && word[0] != word[0].toUpperCase()) {
        return 'Setiap kata harus dimulai dengan huruf kapital.';
      }
    }
    return null;
  }

  String? _validatePhoneNumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'Nomor telepon harus diisi.';
    }
    if (!RegExp(r'^\d+$').hasMatch(value)) {
      return 'Nomor telepon harus terdiri dari angka saja.';
    }
    if (value.length < 8 || value.length > 13) {
      return 'Panjang nomor telepon minimal 8 dan maksimal 13 digit.';
    }
    if (!value.startsWith('62')) {
      return 'Nomor telepon harus dimulai dengan angka 62.';
    }
    return null;
  }

  String? _validateDate(String? value) {
    if (value == null || value.isEmpty) {
      return 'Tanggal harus diisi.';
    }
    return null;
  }

  // --- BUILD WIDGETS ---

  Widget _buildForm() {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // Phone Number
            TextFormField(
              controller: _phoneController,
              decoration: const InputDecoration(
                labelText: 'Phone Number (62...)',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.phone,
              validator: _validatePhoneNumber,
            ),
            const SizedBox(height: 12),
            // Name
            TextFormField(
              controller: _nameController,
              decoration: const InputDecoration(
                labelText: 'Name (Min 2 Kata, Kapital Awal)',
                border: OutlineInputBorder(),
              ),
              validator: _validateName,
            ),
            const SizedBox(height: 12),
            // Date (Menggunakan TextFormField dan date picker)
            TextFormField(
              controller: _dateController,
              decoration: InputDecoration(
                labelText: 'Date (DD-MM-YYYY)',
                border: const OutlineInputBorder(),
                suffixIcon: IconButton(
                  icon: const Icon(Icons.calendar_today),
                  onPressed: _pickDate,
                ),
              ),
              readOnly: true, // Mencegah input manual
              validator: _validateDate,
            ),
            const SizedBox(height: 12),
            // Color Picker
            Row(
              children: [
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    color: _currentColor,
                    border: Border.all(color: Colors.grey),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: ElevatedButton(
                    onPressed: _pickColor,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blueGrey,
                      foregroundColor: Colors.white,
                    ),
                    child: const Text('Pick Color'),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            // File Picker
            Row(
              children: [
                Expanded(
                  child: Text(
                    _selectedFile == null
                        ? 'No file selected'
                        : 'File: ${_selectedFile!.path.split('/').last}',
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: _pickFile,
                  child: const Text('Pick and Open File'),
                ),
              ],
            ),
            const SizedBox(height: 20),
            // Submit Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _submitForm,
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  backgroundColor: _contactToEdit == null ? Colors.blue : Colors.orange,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Text(
                  _contactToEdit == null ? 'SUBMIT' : 'UPDATE CONTACT',
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildContactList() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.fromLTRB(16, 16, 16, 8),
          child: Text(
            'List Contact',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ),
        Expanded(
          child: contacts.isEmpty
              ? const Center(child: Text('Belum ada kontak.'))
              : ListView.builder(
                  itemCount: contacts.length,
                  itemBuilder: (context, index) {
                    final contact = contacts[index];
                    return ContactItem(
                      contact: contact,
                      onEdit: () => _editContact(contact),
                      onDelete: () => _deleteContact(contact.id),
                    );
                  },
                ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('List Contacts'), // Sesuai spesifikasi (2a)
        backgroundColor: Colors.cyan,
      ),
      body: Column(
        children: <Widget>[
          // Form Input
          _buildForm(),
          const Divider(),
          // List Kontak
          Expanded(
            child: _buildContactList(), // Sesuai spesifikasi (2b)
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'Contact List',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.cyan,
        onTap: _onItemTapped,
      ),
    );
  }
}

// --- Contact Item Widget (lib/widgets/contact_item.dart) ---

class ContactItem extends StatelessWidget {
  final Contact contact;
  final VoidCallback onEdit;
  final VoidCallback onDelete;

  const ContactItem({
    super.key,
    required this.contact,
    required this.onEdit,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            // Avatar Placeholder
            const CircleAvatar(
              backgroundColor: Colors.blueGrey,
              child: Icon(Icons.person, color: Colors.white),
            ),
            const SizedBox(width: 15),
            // Contact Info
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    contact.name,
                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  Text(contact.phoneNumber, style: const TextStyle(color: Colors.grey)),
                  Text(contact.date, style: const TextStyle(color: Colors.grey)),
                  // Color Bar
                  Container(
                    margin: const EdgeInsets.only(top: 4),
                    height: 5,
                    width: 100,
                    decoration: BoxDecoration(
                      color: contact.color,
                      borderRadius: BorderRadius.circular(2.5),
                    ),
                  ),
                  // File Info
                  if (contact.file != null)
                    Text(
                      'File: ${contact.file!.path.split('/').last}',
                      style: const TextStyle(fontSize: 12, fontStyle: FontStyle.italic),
                    ),
                ],
              ),
            ),
            // Action Buttons
            IconButton(
              icon: const Icon(Icons.edit, color: Colors.blue), // (2e)
              onPressed: onEdit,
            ),
            IconButton(
              icon: const Icon(Icons.delete, color: Colors.red), // (2d)
              onPressed: onDelete,
            ),
          ],
        ),
      ),
    );
  }
}