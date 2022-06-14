import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/material.dart';

class Fazenda extends StatelessWidget {
  const Fazenda({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey,
        appBar: AppBar(
          title: Text('Fazenda Topzera'),
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
        body: ListView(children: [
          Padding(padding: const EdgeInsets.all(2), child: Column())
        ]));
  }
}
