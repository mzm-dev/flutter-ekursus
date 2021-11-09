import 'package:ekursus/models/kursus.dart';
import 'package:flutter/material.dart';

class ButiranPage extends StatelessWidget {
  const ButiranPage({Key? key, required this.kursus}) : super(key: key);

  final Kursus kursus;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(kursus.nama),
      ),
      body: Card(
        child: Column(
          children: [
            ListTile(
              subtitle: Text(
                kursus.nama,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              title: Text('Nama Kursus'),
            ),
            ListTile(
              subtitle: Text(
                kursus.tarikhakhirmohon,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              title: Text('Tarikh Kursus'),
            ),
          ],
        ),
      ),
    );
  }
}
