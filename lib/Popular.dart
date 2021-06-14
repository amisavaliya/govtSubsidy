import 'package:flutter/material.dart';
import 'package:flutter_appgovernment_subsidy/AppList.dart';
import 'package:flutter_appgovernment_subsidy/model/PopularItem.dart';
import 'package:get/get.dart';
import 'popularListItem.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final subsidies = FirebaseFirestore.instance.collection("subsidy");

class Popular extends StatefulWidget {
  @override
  _PopularState createState() => _PopularState();
}

class _PopularState extends State<Popular> {
  var subsidyName;
  var subsidyInfo;
  var subdidydoc;
  var subsidylink;
  List<popularListItem> popularList;

  //List<PopularItem> popularList = AppList.popularItemList;

  @override
  void initState() {
    super.initState();
    getAllSubsidies();
  }

  getAllSubsidies() async {
    print("1");
    QuerySnapshot dataSnapshot2 = await subsidies.limit(50).get();

    List<popularListItem> popularListItems2 = dataSnapshot2.docs
        .map((document) => popularListItem.fromDocument(document))
        .toList();
    setState(() {
      this.popularList = popularListItems2;
    });
  }

  @override
  Widget build(BuildContext context) {
    if(popularList == null)
      {
        return Container(
            child: Center(child : CircularProgressIndicator()));
      }
    else{
      return Container(
          height: Get.height,
          width: Get.width,
          child: GridView.count(
            crossAxisCount: 2,
            childAspectRatio: 1.0,
            mainAxisSpacing: 0,
            //reverse: true,
            crossAxisSpacing: 10,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            children: popularList,
          ));
    }
  }
}
