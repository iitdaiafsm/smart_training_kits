class TimeModel {
  int? id;
  String? startTime;
  String? endTime;
  bool? available;

  TimeModel({this.id, this.startTime, this.endTime, this.available});

  TimeModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    startTime = json['start_time'];
    endTime = json['end_time'];
    available = json['available'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['start_time'] = startTime;
    data['end_time'] = endTime;
    data['available'] = available;
    return data;
  }
}
