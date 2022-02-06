class Oferta {
  final int? id;
  final String nameGroup;
  final String caption;
  final String imageName;
  final String time;

  Oferta(
      {this.id,
      required this.nameGroup,
      required this.caption,
      required this.imageName, required this.time});
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nameGroup': nameGroup,
      'caption': caption,
      'imageName': imageName,
      'time': time,
    };
  }

  factory Oferta.fromMap(Map<String, dynamic> map) {
    return Oferta(
        id: map['id'],
        nameGroup: map['nameGroup'],
        caption: map['caption'],
        imageName: map['imageName'], time: map['time']);
  }
}
