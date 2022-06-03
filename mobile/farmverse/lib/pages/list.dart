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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: const Text('Farmverse'),
        backgroundColor: Colors.brown,
      ),
      body: FutureBuilder<List<dynamic>>(
        future: fetchAnimais(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
                padding: const EdgeInsets.all(4),
                itemCount: snapshot.data.length,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    child: InkWell(
                      onTap: () {},
                      child: ListTile(
                        title: Column(
                          children: [
                            Row(
                              children: <Widget>[
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.86,
                                  height:
                                      MediaQuery.of(context).size.height * 0.36,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      fit: BoxFit.fitWidth,
                                      image: NetworkImage(
                                          snapshot.data[index].urlImagem),
                                    ),
                                  ),
                                )
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Center(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Row(
                                        children: [
                                          Text((snapshot.data[index].descricao
                                              .toString())),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Text((snapshot
                                              .data[index].proprietario
                                              .toString())),
                                        ],
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            0, 0, 0, 8),
                                        child: Row(
                                          children: [
                                            Text('R\$'),
                                            Text((snapshot.data[index].preco
                                                .toStringAsFixed(2)))
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            )
                          ],
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
