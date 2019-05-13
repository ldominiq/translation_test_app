import 'dart:convert';

Traduction clientFromJson(String str) {
  final jsonData = json.decode(str);
  return Traduction.fromMap(jsonData);
}

String clientToJson(Traduction data) {
  final dyn = data.toMap();
  return json.encode(dyn);
}

class Traduction {
  int id;
  String source;
  String target;
  String file;

  Traduction({
    this.id,
    this.source,
    this.target,
    this.file,
  });

  factory Traduction.fromMap(Map<String, dynamic> json) => new Traduction(
        id: json["id"],
        source: json["source"],
        target: json["target"],
        file: json["file"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "source": source,
        "target": target,
        "file": file,
      };
}