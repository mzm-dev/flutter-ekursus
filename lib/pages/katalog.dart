import 'package:flutter/material.dart';

import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

import 'package:ekursus/models/kursus.dart';
import 'package:ekursus/pages/butiran.dart';

class KatalogPage extends StatefulWidget {
  @override
  State<KatalogPage> createState() => _KatalogPageState();
}

class _KatalogPageState extends State<KatalogPage> {
  // var url = Uri.parse('http://10.55.250.77/testapi2.php?action=kursus');
  // var url = Uri.parse('http://192.168.0.120/api/api.php?action=kursus');

  late Future<List<Kursus>> kursus;

  Future<List<Kursus>> fetchKursus() async {

    var url = Uri.http('10.55.250.77', '/testapi2.php', {'action': 'kursus'});
    // var url = Uri.http('192.168.0.120', '/api/api.php', {'action': 'kursus'});

    final response = await http.get(url);

    if (response.statusCode == 200) {
      final parsed =
          convert.jsonDecode(response.body).cast<Map<String, dynamic>>();

      return parsed.map<Kursus>((json) => Kursus.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load album');
    }
  }

  //Start Awalan sebelum semua start
  @override
  void initState() {
    super.initState();
    //init start get data
    kursus = fetchKursus();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Katalog Kursus'),
      ),
      body: FutureBuilder<List<Kursus>>(
        future: kursus,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) => InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              ButiranPage(kursus: snapshot.data![index])));
                },
                child: Card(
                  child: ListTile(
                    leading: LeadingIconWidget(
                        peserta: snapshot.data![index].BilPeserta),
                    title: Text(
                      snapshot.data![index].NamaKursus,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Text("Lokasi : ${snapshot.data![index].TempatKursus}"),
                        Text(
                            "${snapshot.data![index].TarikhMula} - ${snapshot.data![index].TarikhTamat}",
                            style:
                                const TextStyle(fontWeight: FontWeight.bold)),
                        const SizedBox(height: 5),
                        Text(
                            "Mohon Sebelum : ${snapshot.data![index].TarikhTamatMohon}"),
                      ],
                    ),
                    trailing: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Container(
                          alignment: Alignment.center,
                          padding: EdgeInsets.all(2),
                          width: 40,
                          height: 20,
                          color: Colors.green,
                          child: Text(
                            snapshot.data![index].StatusKursus,
                            style: TextStyle(fontSize: 12, color: Colors.white),
                          ),
                        ),
                        Icon(Icons.chevron_right, size: 32.0),
                      ],
                    ),
                  ),
                ),
              ),
            );
          } else {
            return const Center(
                child: CircularProgressIndicator(
              color: Colors.orange,
            ));
          }
        },
      ),
    );
  }
}

class LeadingIconWidget extends StatelessWidget {
  const LeadingIconWidget({Key? key, required this.peserta}) : super(key: key);

  final String peserta;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(
          Icons.groups,
          size: 20.0,
        ),
        Text(peserta,
            style:
                const TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0)),
        const Text(
          "Bil. Peserta",
          textAlign: TextAlign.justify,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(fontSize: 11.0),
          maxLines: 2,
        )
      ],
    );
  }
}
