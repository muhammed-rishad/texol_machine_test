class Criteria {
  String? type;
  String text = '';
  Map<String, dynamic> valuesMap = {};

  Criteria({this.type, required this.text});

  Criteria.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    text = json['text'] ?? '';
    Map<String, dynamic> _temp = {};
    if (type == 'variable') {
      json['variable'].forEach((key, value) {
        if (value['type'] == 'value') {
          _temp[key] = value["values"];
        } else if (value['type'] == 'indicator') {
          _temp[key] = value['default_value'];
        }
      });
      _temp.forEach((key1, value1) {
        if (value1.runtimeType == int) {
          text = text.replaceAll(key1, "($value1)");
          valuesMap["($value1)"] = value1;
        } else {
          text = text.replaceAll(key1, "(${value1[0]})");
          valuesMap["(${value1[0]})"] = value1;
        }
      });
    }

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    data['text'] = this.text;
    return data;
  }
}