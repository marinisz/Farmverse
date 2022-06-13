import 'dart:convert';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:farmverse/model/animal.dart';

class AnimalView extends StatefulWidget {
  final Animal animal;

  const AnimalView(this.animal, {Key? key}) : super(key: key);

  @override
  State<AnimalView> createState() => _AnimalViewState();
}

class _AnimalViewState extends State<AnimalView> {
  // late Future<List<Animal>> animais;
  String descricao = ' ';
  String proprietario = ' ';
  String urlImagem = ' ';
  num preco = 0;
  final GlobalKey<FormState> _formKey = GlobalKey();

  @override
  void initState() {
    setState(() {
      descricao = widget.animal.descricao;
      proprietario = widget.animal.proprietario;
      preco = widget.animal.preco;
      urlImagem = widget.animal.urlImagem;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: Text(descricao),
        backgroundColor: Colors.brown,
        actions: [
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
            child: IconButton(
                icon: const FaIcon(FontAwesomeIcons.cow),
                onPressed: () {
                  //inserir navegação para perfil}
                }),
          ),
        ],
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(4),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const SizedBox(height: 20),
                  Card(
                    elevation: 5,
                    // color: Colors.grey,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 20, top: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width * 0.86,
                                height:
                                    MediaQuery.of(context).size.height * 0.36,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    fit: BoxFit.fitWidth,
                                    image: NetworkImage(urlImagem),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 25.0),
                          child: Container(
                            width: double.infinity,
                            padding: const EdgeInsets.all(10.0),
                            child: Center(
                                child: Text(descricao,
                                    style: const TextStyle(
                                        fontSize: 50,
                                        fontWeight: FontWeight.bold))),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Card(
                    child: ListTile(
                        leading: const Padding(
                          padding: EdgeInsets.only(top: 4.0, left: 4.0),
                          child: FaIcon(
                            FontAwesomeIcons.user,
                            size: 30.0,
                            color: Colors.black,
                          ),
                        ),
                        title: Text('Proprietário'),
                        subtitle: Text(proprietario)),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Card(
                    child: ListTile(
                        leading: const Padding(
                          padding: EdgeInsets.only(top: 4.0, left: 4.0),
                          child: FaIcon(
                            FontAwesomeIcons.brazilianRealSign,
                            size: 30.0,
                            color: Colors.black,
                          ),
                        ),
                        title: Text('Preço'),
                        subtitle: Text(preco.toString())),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Card(
                    child: ListTile(
                        leading: const Padding(
                          padding: EdgeInsets.only(top: 4.0, left: 4.0),
                          child: FaIcon(
                            FontAwesomeIcons.cow,
                            size: 30.0,
                            color: Colors.black,
                          ),
                        ),
                        title: Text('Características'),
                        subtitle: Text(
                            "Idade: 3 anos, Peso: 400kg, Altura: 150cm, Comprimento: 130cm")),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  // GestureDetector(
                  //   onTap: () async {
                  //     await StreamingSharedPreferences.instance.then((sharedPref) async {
                  //       await sharedPref.setString("dashwalletName", description);
                  //       await sharedPref.setInt("dashwalletID", int.parse(widget.wallet.id.toString()));
                  //     });
                  //     ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  //       content: Text("Wallet Changed"),
                  //     ));
                  //   },
                  //   child: const Card(
                  //     child: ListTile(
                  //         leading: Padding(
                  //           padding: EdgeInsets.only(top: 4.0, left: 4.0),
                  //           child: FaIcon(
                  //             FontAwesomeIcons.house,
                  //             size: 30.0,
                  //             color: Colors.black,
                  //           ),
                  //         ),
                  //         title: Text('Set Dashboard Wallet'),
                  //         subtitle: Text('')),
                  //   ),
                  // ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
