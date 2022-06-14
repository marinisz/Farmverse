import 'dart:convert';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:farmverse/model/animal.dart';

import 'fazenda.dart';
import 'list.dart';

class Adicionar extends StatefulWidget {
  const Adicionar({Key? key}) : super(key: key);
  @override
  State<Adicionar> createState() => _AdicionarViewState();
}

class _AdicionarViewState extends State<Adicionar> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  final TextEditingController _controladordescricao = TextEditingController();
  final TextEditingController _controladorproprietario =
      TextEditingController();
  final TextEditingController _controladorpreco = TextEditingController();
  final TextEditingController _controladorurlImagem = TextEditingController();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: Text("Adicionar"),
        backgroundColor: Colors.brown,
        actions: [
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
            child: IconButton(
                icon: const FaIcon(FontAwesomeIcons.cow),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Fazenda()),
                  );
                }),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(4.0),
        child: SizedBox(
          height: 300,
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: <Widget>[
                  TextField(
                    controller: _controladordescricao,
                    decoration: InputDecoration(labelText: 'Descrição'),
                  ),
                  TextField(
                    controller: _controladorproprietario,
                    decoration: InputDecoration(labelText: 'Proprietario'),
                  ),
                  TextField(
                    controller: _controladorpreco,
                    decoration: InputDecoration(labelText: 'Preço'),
                  ),
                  TextField(
                    controller: _controladorurlImagem,
                    decoration: InputDecoration(labelText: 'Url'),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                      child: Text('Cadastrar'),
                      onPressed: () {
                        final String descricao = _controladordescricao.text;
                        final String propriaetario =
                            _controladorproprietario.text;
                        final int valor = int.parse(_controladorpreco.text);
                        final String Url = _controladorurlImagem.text;
                        final jsonData =
                            '{"descricao": "${descricao}", "proprietario": "${propriaetario}", "preco": ${valor}, "urlImagem": "${Url}"}';
                        final animaisJson = jsonDecode(jsonData);
                        http.post(Uri.parse('http://localhost:5000/animais'),
                            headers: <String, String>{
                              'Content-Type': 'application/json; charset=UTF-8',
                            },
                            body: jsonData);
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const AnimalsList()));
                      },
                      style: ElevatedButton.styleFrom(
                          shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(30.0),
                      )))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
