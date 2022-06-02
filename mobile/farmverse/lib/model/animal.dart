// ignore: file_names
class Animal {
  final String descricao;
  final String proprietario;
  final num preco;
  final num id;

  const Animal(
      {required this.id,
      required this.descricao,
      required this.proprietario,
      required this.preco});

  factory Animal.fromJson(Map<String, dynamic> json) {
    return Animal(
      id: json['id'],
      descricao: json['descricao'],
      preco: json['preco'],
      proprietario: json['proprietario'],
    );
  }
}
