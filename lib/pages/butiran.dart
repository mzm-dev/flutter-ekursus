import 'package:ekursus/models/kursus.dart';
import 'package:flutter/material.dart';

class ButiranPage extends StatelessWidget {
  const ButiranPage({Key? key, required this.kursus}) : super(key: key);

  final Kursus kursus;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(kursus.NamaKursus),
      ),
      body: ListView(
        padding: const EdgeInsets.all(8),
        children: [
          ListTile(
            subtitle: Text(
              kursus.NamaKursus,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            title: const Text('Nama Kursus'),
          ),
          ListTile(
            subtitle: Text(
              "${kursus.TarikhMula} - ${kursus.TarikhTamat}",
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            title: const Text('Tarikh Kursus'),
          ),
          ListTile(
            subtitle: Text(
              "${kursus.TarikhTamatMohon}",
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            title: const Text('Tarikh Akhir Permohonan'),
          ),
          ListTile(
            subtitle: Text(
              "${kursus.TempatKursus}",
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            title: const Text('Lokasi'),
          ),
          ListTile(
            subtitle: Text(
              "${kursus.KumpSasar}",
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            title: const Text('Kumpulan Sasar'),
          ),          
          ListTile(
            subtitle: Text(
              "${kursus.TarikhMula} - ${kursus.BilPeserta}",
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            title: const Text('Bilangan Peserta'),
          ),
          ListTile(
            subtitle: Text(
              "${kursus.TarikhMula} - ${kursus.catatan}",
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            title: const Text('Catatan'),
          ),
        ],
      ),
    );
  }
}
