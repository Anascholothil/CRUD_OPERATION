import 'dart:collection';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'mdlclass.dart';

class Amirprovider extends ChangeNotifier {
  FirebaseFirestore db = FirebaseFirestore.instance;
  TextEditingController employeenameController = TextEditingController();
  // TextEditingController employeeTeamController = TextEditingController();
  TextEditingController employeephoneController = TextEditingController();

  Future<void> addData(String from,String oldid) async {
    String id = DateTime.now().millisecondsSinceEpoch.toString();
    HashMap<String, dynamic> map = HashMap();
    
    map["NAME"] = employeenameController.text;
    map["PHONE"] = employeephoneController.text;
    
               if(from=="NEW") {
                 map["EMPLOYEE_ID"] = id;
               }

               if(from=="EDIT"){
                 db.collection("AMIRDETAILS").doc(oldid).update(map).then((value) {
                   Fluttertoast.showToast(
                       msg: "smthng old!!!!!!!!!!",
                       toastLength: Toast.LENGTH_SHORT,
                       gravity: ToastGravity.CENTER,
                       timeInSecForIosWeb: 1,
                       backgroundColor: Colors.red,
                       textColor: Colors.white,
                       fontSize: 16.0);
                 });

               }else{
                 db.collection("AMIRDETAILS").doc(id).set(map).then((value) {
                   Fluttertoast.showToast(
                       msg: "smthng new!!!!!!!!!!",
                       toastLength: Toast.LENGTH_SHORT,
                       gravity: ToastGravity.CENTER,
                       timeInSecForIosWeb: 1,
                       backgroundColor: Colors.red,
                       textColor: Colors.white,
                       fontSize: 16.0);
                 });

               }
               getemployeeDetails();
           notifyListeners();

        }

  List<modelClass> employelist = [];

  void getemployeeDetails() {
    db.collection("AMIRDETAILS").get().then((value) {
      if (value.docs.isNotEmpty) {
        employelist.clear();
        for (var element in value.docs) {
          Map<dynamic, dynamic> map = element.data();
          employelist.add(
            modelClass(
              element.id,
              map["NAME"].toString(),
              map["PHONE"].toString(),
            ),
          );
          notifyListeners();
        }
      }
      notifyListeners();
    });
  }

  void clearFun() {
    employeenameController.clear();
    employeephoneController.clear();
  }

  void playersDelete(id, BuildContext context) {

    db.collection('AMIRDETAILS').doc(id).delete();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Delete Successfully!!'),
        backgroundColor: Colors.blueAccent,
      ),
    );
    getemployeeDetails();
notifyListeners();
  }

  void playeredit(String id, ){
    db.collection('AMIRDETAILS').doc(id).get().then((value){
      if(value.exists){
        Map<dynamic,dynamic>map=value.data() as Map;
        employeenameController.text=map['NAME'].toString();
        employeephoneController.text=map['PHONE'].toString();
        getemployeeDetails();
        notifyListeners();
      }
      notifyListeners();
     }

     );

  }



}
