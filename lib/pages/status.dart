import 'package:flutter/material.dart';

import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

import 'package:ekursus/models/kursus.dart';
import 'package:ekursus/pages/butiran.dart';

class StatusPage extends StatefulWidget {
  @override
  State<StatusPage> createState() => _StatusPageState();
}

class _StatusPageState extends State<StatusPage> {
  final _formKey = GlobalKey<FormState>();

  final inputNoKP = TextEditingController();

  bool submited = false;
  bool results = false;

  Future<List<Kursus>>? kursus;

  Future<List<Kursus>> fetchKursus(nokp) async {
    var url = Uri.http('10.55.250.77', '/testapi2.php', {'action': 'semak'});
    // var url = Uri.http('192.168.0.120', '/api/api.php', {'action': 'semak'});

    final response = await http.post(url, body: {'nokp': nokp});

    if (response.statusCode == 200) {
      final parsed = convert.jsonDecode(response.body).cast<Map<String, dynamic>>();
      
      return parsed.map<Kursus>((json) => Kursus.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load album');
    }
  }  

  void submit(nokp) {
    setState(() {
      kursus = fetchKursus(nokp);
      submited = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Semakan Status'),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(90.0),
          child: Container(
            padding: EdgeInsets.all(8.0),
            child: Form(
              key: _formKey,
              child: Row(
                children: [
                  const SizedBox(height: 5),
                  Expanded(
                    child: TextFormField(
                      controller: inputNoKP,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          labelText: 'No Kad Pengenalan',
                          labelStyle: TextStyle(color: Colors.green)),
                      // The validator receives the text that the user has entered.
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some text';
                        }else if(value.length != 12 ){
                          return 'Invalid input';
                        }
                        return null;
                      },
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 4),
                    width: 60,
                    height: 55,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(elevation: 0),
                      onPressed: () {
                        // Validate returns true if the form is valid, or false otherwise.
                        if (_formKey.currentState!.validate()) {                          
                          submit(inputNoKP.text);                          
                        }
                      },
                      child: const Icon(Icons.search),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      body: FutureBuilder<List<Kursus>>(
        future: kursus,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return snapshot.data!.length == 0
                ? const Center(
                    child: Text('Data Tidak dijumpai'),
                  )
                : ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) => InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ButiranPage(
                                    kursus: snapshot.data![index])));
                      },
                      child: Card(
                        child: ListTile(
                          title: Text(
                            snapshot.data![index].NamaKursus,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          subtitle: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [                              
                              Text(
                                  "${snapshot.data![index].TarikhMula} - ${snapshot.data![index].TarikhTamat}",
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold)),                              
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
                                  style: const TextStyle(
                                      fontSize: 12, color: Colors.white),
                                ),
                              ),
                              const Icon(Icons.chevron_right, size: 32.0),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
          } else {
            return const Center(child: Text('Carian melalui No Kad Pengenalan'));
          }
        },
      ),
    );
  }
}
