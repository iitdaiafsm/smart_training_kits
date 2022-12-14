class OrderModel {
  String? orderId;
  int? kitId;
  String? kitName;
  String? scheduledDate;
  int? slotId;
  String? slotStart;
  String? slotEnd;
  String? orderPlaced;
  String? orderCompleted;
  String? status;

  OrderModel(
      {this.orderId,
      this.kitId,
      this.kitName,
      this.scheduledDate,
      this.slotId,
      this.slotStart,
      this.slotEnd,
      this.orderPlaced,
      this.orderCompleted,
      this.status});

  OrderModel.fromJson(Map<String, dynamic> json) {
    orderId = json['order_id'];
    kitId = json['kit_id'];
    kitName = json['kit_name'];
    scheduledDate = json['scheduled_date'];
    slotId = json['slot_id'];
    slotStart = json['slot_start'];
    slotEnd = json['slot_end'];
    orderPlaced = json['order_placed'];
    orderCompleted = json['order_completed'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['order_id'] = orderId;
    data['kit_id'] = kitId;
    data['kit_name'] = kitName;
    data['scheduled_date'] = scheduledDate;
    data['slot_id'] = slotId;
    data['slot_start'] = slotStart;
    data['slot_end'] = slotEnd;
    data['order_placed'] = orderPlaced;
    data['order_completed'] = orderCompleted;
    data['status'] = status;
    return data;
  }
}
