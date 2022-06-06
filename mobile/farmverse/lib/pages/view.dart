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
  num preco = 0;
  final GlobalKey<FormState> _formKey = GlobalKey();

  @override
  void initState() {
    setState(() {
      descricao = widget.animal.descricao;
      proprietario = widget.animal.proprietario;
      preco = widget.animal.preco;
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
            padding: const EdgeInsets.symmetric(horizontal: 32.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const SizedBox(height: 20),
                  Card(
                    elevation: 5,
                    color: Colors.grey,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 20, top: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              IconButton(
                                alignment: Alignment.topRight,
                                icon: const FaIcon(
                                  FontAwesomeIcons.ellipsis,
                                  size: 30.0,
                                  color: Colors.black,
                                ),
                                color: Colors.black,
                                onPressed: () {
                                  // Navigator.push(
                                  //   context,
                                  //   MaterialPageRoute(
                                  //       builder: (context) =>
                                  //           WalletForm(widget.wallet)),
                                  // ).then((value) => {
                                  //       if (value is Wallet)
                                  //         {
                                  //           setState(() {
                                  //             description = value.description!;
                                  //           }),
                                  //         }
                                  //       else if (value is String)
                                  //         {
                                  //           if (value == 'CLOSE')
                                  //             Navigator.of(context).pop()
                                  //         }
                                  //     });
                                },
                              ),
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
                        // const SizedBox(height: 25.0),
                        // Text(
                        //   widget.wallet.shared == 1 ? 'Shared' : 'Private',
                        //   style: const TextStyle(fontWeight: FontWeight.w700),
                        // ),
                        // const SizedBox(height: 60.0),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 35,
                  ),
                  const Card(
                    child: ListTile(
                        leading: Padding(
                          padding: EdgeInsets.only(top: 4.0, left: 4.0),
                          child: FaIcon(
                            FontAwesomeIcons.user,
                            size: 30.0,
                            color: Colors.black,
                          ),
                        ),
                        title: Text('Proprietario'),
                        subtitle: Text('proprietario')),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Card(
                    child: ListTile(
                        leading: Padding(
                          padding: EdgeInsets.only(top: 4.0, left: 4.0),
                          child: FaIcon(
                            FontAwesomeIcons.brazilianRealSign,
                            size: 30.0,
                            color: Colors.black,
                          ),
                        ),
                        title: Text('Preço'),
                        subtitle: Text('20000')),
                  ),
                  const SizedBox(
                    height: 10,
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
