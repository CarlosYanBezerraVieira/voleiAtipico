import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
enum Position { levantador, oposto, ponteiro, central, libero }

class PlayerModel {
  final int? id;
  final String name;
  final double rate;
  final Position position;
  final String pathImage;
  PlayerModel({
    this.pathImage = '',
    this.id,
    required this.name,
    required this.rate,
    required this.position,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'rate': rate,
      'position': position.name,
      'pathImage': pathImage,
    };
  }

  factory PlayerModel.init() {
    return PlayerModel(
      id: 0,
      name: "",
      rate: 0.0,
      position: Position.values.first,
    );
  }

  factory PlayerModel.fromMap(Map<String, dynamic> map) {
    return PlayerModel(
      id: map['id'] ?? 0,
      name: map['name'] ?? "",
      rate: map['rate'] ?? 0.0,
      pathImage: map['pathImage'] ?? "",
      position: Position.values
          .firstWhere((element) => element.name == map['position']),
    );
  }

  String toJson() => json.encode(toMap());

  factory PlayerModel.fromJson(String source) =>
      PlayerModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'PlayerModel(id: $id, name: $name, rate: $rate, position: $position, pathImage: $pathImage)';
  }

  PlayerModel copyWith({
    int? id,
    String? name,
    double? rate,
    Position? position,
    String? pathImage,
  }) {
    return PlayerModel(
      id: id ?? this.id,
      name: name ?? this.name,
      rate: rate ?? this.rate,
      position: position ?? this.position,
      pathImage: pathImage ?? this.pathImage,
    );
  }
}
