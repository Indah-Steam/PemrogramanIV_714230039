// lib/models/contact.dart

import 'dart:io';
import 'package:flutter/material.dart';

class Contact {
  final String id; // Untuk memudahkan operasi CRUD
  String phoneNumber;
  String name;
  String date; // Bisa berupa String atau DateTime
  Color color;
  File? file;

  Contact({
    required this.id,
    required this.phoneNumber,
    required this.name,
    required this.date,
    required this.color,
    this.file,
  });

  // Contoh konversi ke Map (jika nanti menggunakan database lokal seperti SharedPrefs/Hive)
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'phoneNumber': phoneNumber,
      'name': name,
      'date': date,
      'colorValue': color.value,
      'filePath': file?.path,
    };
  }
}