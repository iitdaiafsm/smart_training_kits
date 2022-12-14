import 'package:flutter/src/widgets/framework.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:smart_training_kits/helper/date_format_helper.dart';
import 'package:smart_training_kits/helper/models/order_model.dart';
import 'package:smart_training_kits/main.dart';

import '../../helper/models/kits_model.dart';
import '../../helper/models/time_model.dart';

class MainController extends GetxController {
  List<KitsModel> kitsList = [];
  List<TimeModel> timeList = [];
  int selectedKitSlot = -1;
  int selectedTimeSlot = -1;
  DateTime selectedDateTime = DateTime(2000);
  List<DateTime> dates =
      List.generate(7, (index) => DateTime.now().add(Duration(days: index)));
  String text = "Select Training Kit to proceed";
  List<String> offDays = [];
  bool isLoading = false;

  @override
  void onInit() {
    addKits();
    addTime();
    addDates();
    super.onInit();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void addKits() async {
    kitsList = await firebaseHelper.fetchKits();
    update();
  }

  void addTime() async {
    timeList = await firebaseHelper.fetchTime();
    update();
  }

  void addDates() async {
    offDays = await firebaseHelper.fetchOffDays();
    update();
  }

  void saveOrder(BuildContext context) async {
    OrderModel orderModel = OrderModel(
      orderId:
          "FSM-Kit-${DateFormatHelper.convertDateFromDate(DateTime.now(), "ddMMyyyyhhmmss")}",
      kitId: selectedKitSlot,
      kitName:
          kitsList.where((element) => element.id == selectedKitSlot).first.name,
      scheduledDate:
          DateFormatHelper.convertDateFromDate(selectedDateTime, "dd/MM/yyyy"),
      slotId: selectedTimeSlot,
      slotStart: timeList
          .where((element) => element.id == selectedTimeSlot)
          .first
          .startTime,
      slotEnd: timeList
          .where((element) => element.id == selectedTimeSlot)
          .first
          .endTime,
      orderPlaced:
          DateFormatHelper.convertDateFromDate(DateTime.now(), "dd/MM/yyyy"),
      status: "Scheduled",
    );

    isLoading = true;
    update();
    bool isSuccess = await firebaseHelper.placeOrder(orderModel);
    isLoading = false;
    update();

    if (isSuccess) {
      Fluttertoast.showToast(msg: "Training Kits is Scheduled Successfully");
    }
  }
}
