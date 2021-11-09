
import 'package:ekursus/models/kursus.dart';
import 'package:ekursus/pages/butiran.dart';
import 'package:flutter/material.dart';

class KatalogPage extends StatelessWidget {
  List kursus = [
    Kursus('Nama Kursus 1', '10-11-2020 hingga 12-11-2021', '09-11-2021', '2',
        'Gred 29 dan ke atas', 'Kursus pengurusan pejabat', 'catatan 1', '10'),
    Kursus('Nama Kursus 2', '10-11-2020 hingga 12-11-2021', '11-11-2021', '2',
        'Gred 19 dan ke atas', 'Kursus pengurusan pejabat', 'catatan 2', '5'),
    Kursus('Nama Kursus 3', '10-11-2020 hingga 12-11-2021', '11-11-2021', '2',
        'Gred 32 dan ke atas', 'Kursus pengurusan pejabat', 'catatan 3', '25'),
    Kursus('Nama Kursus 4', '10-11-2020 hingga 12-11-2021', '12-11-2021', '2',
        'Gred 41 dan ke atas', 'Kursus pengurusan pejabat', 'catatan 4', '35'),
    Kursus('Nama Kursus 5', '10-11-2020 hingga 12-11-2021', '12-11-2021', '2',
        'Gred 44 dan ke atas', 'Kursus pengurusan pejabat', 'catatan 5', '15'),
    Kursus('Nama Kursus 6', '10-11-2020 hingga 12-11-2021', '15-11-2021', '2',
        'Gred 11 dan ke atas', 'Kursus pengurusan pejabat', 'catatan 6', '15'),
    Kursus('Nama Kursus 7', '16-11-2020 hingga 16-11-2021', '15-11-2021', '1',
        'Gred 19 dan ke atas', 'Kursus pengurusan pejabat', 'catatan 7', '5'),
    Kursus('Nama Kursus 8', '16-11-2020 hingga 16-11-2021', '15-11-2021', '1',
        'Gred 19 dan ke atas', 'Kursus pengurusan pejabat', 'catatan 7', '10'),
    Kursus('Nama Kursus 9', '16-11-2020 hingga 16-11-2021', '15-11-2021', '1',
        'Gred 19 dan ke atas', 'Kursus pengurusan pejabat', 'catatan 7', '15'),
    Kursus('Nama Kursus 10', '16-11-2020 hingga 16-11-2021', '15-11-2021', '1',
        'Gred 19 dan ke atas', 'Kursus pengurusan pejabat', 'catatan 7', '10'),
    Kursus('Nama Kursus 11', '16-11-2020 hingga 16-11-2021', '15-11-2021', '1',
        'Gred 19 dan ke atas', 'Kursus pengurusan pejabat', 'catatan 7', '10'),
    Kursus('Nama Kursus 12', '16-11-2020 hingga 16-11-2021', '15-11-2021', '1',
        'Gred 19 dan ke atas', 'Kursus pengurusan pejabat', 'catatan 7', '15'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Katalog Kursus'),
      ),
      body: ListView.builder(
          itemCount: kursus.length,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            ButiranPage(kursus: kursus[index])));
              },
              child: Card(
                child: ListTile(
                  title: Text(
                    kursus[index].nama,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(kursus[index].objektif),
                      Row(
                        children: [
                          const Icon(Icons.group,
                              size: 14.0, color: Colors.blue),
                          Text("${kursus[index].bilanganpeserta}"),
                          const SizedBox(width: 12),
                          const Icon(Icons.event,
                              size: 14.0, color: Colors.green),
                          Text(
                              "${kursus[index].tarikh} (${kursus[index].tempoh})"),
                        ],
                      ),
                    ],
                  ),
                  trailing: Icon(Icons.chevron_right, size: 32.0),
                ),
              ),
            );
          }),
    );
  }
}
