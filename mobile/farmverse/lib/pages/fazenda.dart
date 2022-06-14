import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/material.dart';

class Fazenda extends StatelessWidget {
  const Fazenda({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey,
        appBar: AppBar(
          title: Text('Meu Perfil'),
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
          Padding(padding: const EdgeInsets.all(2), child: Card(
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
                                      image: NetworkImage('https://diariodocomercio.com.br/wp-content/uploads/2022/01/hotel-fazenda.jpg'),
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
                                    children: [Text('Fazenda Topzera'),Text('3 Animais'),Text('(31) 34493322')],
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ))
        ]));
  }
}
