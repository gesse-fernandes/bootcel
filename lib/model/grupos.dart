class Grupo {
  final int? id;
  final String name;
  late final String groupName;
  final String time;
  Grupo(
      {this.id,
      required this.name,
      required this.groupName,
      required this.time});

  Map<String, dynamic> toMap() {
    return {'id': id, 'name': name, 'groupName': groupName, 'time': time};
  }

  factory Grupo.fromMap(Map<String, dynamic> map) {
    return Grupo(
      id: map['id'],
        name: map['name'], groupName: map['groupName'], time: map['time']);
  }
}
