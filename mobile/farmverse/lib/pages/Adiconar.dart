import 'dart:convert';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:farmverse/model/animal.dart';
class Adicionar extends StatefulWidget {
  final Animal animal;
  const Adicionar(this.animal, {Key? key}) : super(key: key);
  @override
  State<Adicionar> createState() => _AdicionarViewState();
}
class _AdicionarViewState extends State<Adicionar> {

  final GlobalKey<FormState> _formKey = GlobalKey();
  final TextEditingController _controladordescricao = TextEditingController();
  final TextEditingController _controladorproprietario = TextEditingController();
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
                  //inserir navegação para perfil}
                }),
          ),
        ],
      ),
      body: Column(
          children: <Widget>[
            TextField(controller: _controladordescricao,decoration: InputDecoration(labelText: 'Descrição'),),
            TextField(controller: _controladorproprietario,decoration: InputDecoration(labelText: 'Proprietario'),),
            TextField(controller: _controladorpreco,decoration: InputDecoration(labelText: 'Preço'),),
            TextField(controller: _controladorurlImagem,decoration: InputDecoration(labelText: 'Url'),),
            RaisedButton(
              child: Text('Cadastrar'),
                onPressed: () {
                  final String descricao = _controladordescricao.text;
                  final String propriaetario = _controladorproprietario.text;
                  final int valor = int.parse(_controladorpreco.text);
                  final String Url = _controladorurlImagem.text;

                  final Animal produtoNovo =  Animal(5,descricao, propriaetario, valor, Url);
                  print(produtoNovo);


                },
            )
        ],
      ),
    );
  }

}