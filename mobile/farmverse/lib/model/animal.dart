// ignore: file_names
class Animal {
  final String descricao;
  final String proprietario;
  final String urlImagem;
  final num preco;
  final num id;

  const Animal(
      {required this.id,
      required this.descricao,
      required this.proprietario,
      required this.preco,
      required this.urlImagem});

  factory Animal.fromJson(Map<String, dynamic> json) {
    return Animal(
      id: json['id'],
      descricao: json['descricao'],
      preco: json['preco'],
      proprietario: json['proprietario'],
      urlImagem: json['urlimagem']
    );
  }
}
