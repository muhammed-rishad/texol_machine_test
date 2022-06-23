
import 'criteria.dart';

class Stock {
  int? id;
  String? name;
  String? tag;
  String? color;
  List<Criteria> criteria = [];

  Stock({this.id, this.name, this.tag, this.color, this.criteria = const []});

  Stock.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    tag = json['tag'];
    color = json['color'];
    if (json['criteria'] != null) {
      json['criteria'].forEach((v) {
        criteria.add(Criteria.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['tag'] = this.tag;
    data['color'] = this.color;
    if (this.criteria.isNotEmpty) {
      data['criteria'] = this.criteria.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
