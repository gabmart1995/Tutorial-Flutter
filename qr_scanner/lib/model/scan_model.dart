import 'dart:convert';

ScanModel scanModelFromJson(String str) => ScanModel.fromJson(json.decode(str));
String scanModelToJson(ScanModel data) => json.encode(data.toJson());

class ScanModel {

  // constructor
  ScanModel({
    this.id,
    this.type,
    required this.value,
  }) {
    // comprueba el valor del tipo
    type = value.contains('http') ? 'http' : 'geo';
  }

  int? id;
  String? type;
  String value;

  factory ScanModel.fromJson(Map<String, dynamic> json) => ScanModel(
    id: json["id"],
    type: json["type"],
    value: json["value"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "type": type,
    "value": value,
  };
}