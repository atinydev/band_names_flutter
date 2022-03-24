import 'dart:convert';

class Band {
  final String id;
  final String name;
  final int votes;

  const Band({
    required this.id,
    required this.name,
    this.votes = 0,
  });



  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'votes': votes,
    };
  }

  factory Band.fromMap(Map<String, dynamic> map) {
    return Band(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      votes: map['votes']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory Band.fromJson(String source) => Band.fromMap(json.decode(source));
}
