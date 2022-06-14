import 'dart:convert';
import 'dart:html';
import 'package:farmverse/pages/view.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:farmverse/model/animal.dart';

import 'fazenda.dart';

class AnimalsList extends StatefulWidget {
  const AnimalsList({Key? key}) : super(key: key);

  @override
  State<AnimalsList> createState() => _AnimalsListState();
}

Future<List<Animal>> fetchAnimais() async {
  List<Animal> animais = <Animal>[];
  try {
    http.Response response;
    String url = "http://localhost:5000/animais";
    response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      print(response);
      final animaisJson = jsonDecode(response.body);
      for (var animal in animaisJson) {
        animais.add(Animal.fromJson(animal));
      }
    } else {
      throw Exception('Animais não encontrados');
    }
  } catch (e) {
    print(e);
    final jsonData =
        '[ { "id": 1, "descricao": "vaquinha", "proprietario": "Joao", "preco": 2000.3, "urlImagem": "https://static.dw.com/image/50907943_303.jpg"}, { "id": 2, "descricao": "marronzinha", "proprietario": "Seu zé", "preco": 3000.3, "urlImagem": "https://i0.wp.com/profissaobiotec.com.br/wp-content/uploads/2019/10/cow-1715829_1920-1.jpg?fit=1088%2C725&ssl=1"}]';
// 2. decode the json
    final animaisJson = jsonDecode(jsonData);

    for (var animal in animaisJson) {
      animais.add(Animal.fromJson(animal));
    }

    // animais.add(Animal.fromJson(parsedJson));
    // walletList = await fetchWalletsOffline();
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
        title: const Text(''),
        backgroundColor: Colors.brown,
        actions: [
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
            child: IconButton(
                icon: const FaIcon(FontAwesomeIcons.cow),
                onPressed: () {
                  Navigator.push(context, Fazenda);
                }),
          ),
        ],
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
                      onTap: () {
                        final Animal a = Animal(
                            id: snapshot.data[index].id,
                            descricao: snapshot.data[index].descricao,
                            preco: snapshot.data[index].preco,
                            proprietario: snapshot.data[index].proprietario,
                            urlImagem: snapshot.data[index].urlImagem);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AnimalView(a)),
                        ).then((value) => {
                              setState(() {
                                animais = fetchAnimais();
                              })
                            });
                      },
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
