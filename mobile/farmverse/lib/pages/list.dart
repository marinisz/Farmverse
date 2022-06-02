import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:farmverse/model/animal.dart';

class AnimalsList extends StatefulWidget {
  const AnimalsList({Key? key}) : super(key: key);

  @override
  State<AnimalsList> createState() => _AnimalsListState();
}

Future<List<Animal>> fetchAnimais() async {
  List<Animal> animais = <Animal>[];
  http.Response response;
  String url = "http://localhost:5000/animais";
  response = await http.get(Uri.parse(url));
  if (response.statusCode == 200) {
    final animaisJson = jsonDecode(response.body);
    print(animaisJson[0]);
    for (var animal in animaisJson) {
      animais.add(Animal.fromJson(animal));
    }
  } else {
    throw Exception('Animais não encontrados');
  }
  return animais;
}

class _AnimalsListState extends State<AnimalsList> {
  late Future<List<Animal>> animais;
  @override
  void initState() {
    super.initState();
    animais = fetchAnimais();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animais'),
        backgroundColor: Colors.amber,
      ),
      body: FutureBuilder<List<dynamic>>(
        future: fetchAnimais(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
                padding: const EdgeInsets.all(8),
                itemCount: snapshot.data.length,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    child: InkWell(
                      onTap: () {},
                      child: Padding(
                        padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                        child: ListTile(
                          leading: const Padding(
                            padding: EdgeInsets.only(top: 5.0),
                          ),
                          title: Text((snapshot.data[index].descricao)),
                        ),
                      ),
                    ),
                  );
                });
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
