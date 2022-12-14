class KitsModel {
  int? id;
  String? name;
  bool? available;

  KitsModel({this.id, this.name, this.available});

  KitsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    available = json['available'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['available'] = available;
    return data;
  }
}
