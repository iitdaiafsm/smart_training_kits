import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:smart_training_kits/helper/models/kits_model.dart';
import 'package:smart_training_kits/helper/models/order_model.dart';
import 'package:smart_training_kits/helper/models/time_model.dart';

class FirebaseHelper {
  late FirebaseFirestore _firebaseFirestore;
  final String _KITS_COLLECTION = "Kits";
  final String _TIME_COLLECTION = "Time";
  final String _DATE_COLLECTION = "Date";
  final String _ORDERS_COLLECTION = "Orders";

  FirebaseHelper() {
    _firebaseFirestore = FirebaseFirestore.instance;
  }

  void addDummyData() async {
    List<dynamic> tempDynamicList = List<dynamic>.from([
      {"id": 0, "name": "Rockwell", "available": true},
      {"id": 1, "name": "Siemans", "available": true}
    ]);
    List<KitsModel> list = [];
    for (var item in tempDynamicList) {
      list.add(KitsModel.fromJson(item));
    }
    for (var item in list) {
      _firebaseFirestore
          .collection(_KITS_COLLECTION)
          .doc(item.name)
          .set(item.toJson());
    }
  }

  Future<List<KitsModel>> fetchKits() async {
    List<KitsModel> list = [];
    QuerySnapshot<Map<String, dynamic>> snapshot =
        await _firebaseFirestore.collection(_KITS_COLLECTION).get();
    for (var item in snapshot.docs) {
      list.add(KitsModel.fromJson(item.data()));
    }
    return list;
  }

  Future<List<TimeModel>> fetchTime() async {
    List<TimeModel> list = [];
    QuerySnapshot<Map<String, dynamic>> snapshot =
        await _firebaseFirestore.collection(_TIME_COLLECTION).get();
    for (var item in snapshot.docs) {
      list.add(TimeModel.fromJson(item.data()));
    }
    return list;
  }

  Future<List<String>> fetchOffDays() async {
    List<String> list = [];
    try {
      DocumentSnapshot<Map<String, dynamic>> snapshot = await _firebaseFirestore
          .collection(_DATE_COLLECTION)
          .doc("Off Days")
          .get();

      list = snapshot.data()!["off"].cast<String>();
    } catch (e) {
      print(e);
      list = [];
    }
    return list;
  }

  Future<bool> placeOrder(OrderModel orderModel) async {
    DocumentReference<Map<String, dynamic>> documentReference =
        await _firebaseFirestore
            .collection(_ORDERS_COLLECTION)
            .add(orderModel.toJson());
    if (documentReference.id.isNotEmpty) {
      return true;
    } else {
      return false;
    }
  }
}
