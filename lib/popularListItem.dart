import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_appgovernment_subsidy/AppColors.dart';
import 'package:flutter_appgovernment_subsidy/Itemdecription.dart';
import 'package:get/get.dart';
import 'model/PopularItem.dart';

class popularListItem extends StatefulWidget {
  final String image_url;
  final String name;
  final String info;
  final String link;
  final String doc;
  popularListItem({this.image_url, this.name, this.info,this.link,this.doc});

  factory popularListItem.fromDocument(DocumentSnapshot documentSnapshot) {
    return popularListItem(
      image_url: documentSnapshot["image_url"],
      name: documentSnapshot["name"],
      info: documentSnapshot["info"],
      link: documentSnapshot["link"],
      doc: documentSnapshot["doc"],
    );
  }

  @override
  _popularListItemState createState() => _popularListItemState(
      image_url: this.image_url, name: this.name, info: this.info, link:this.link, doc:this.doc);
}

class _popularListItemState extends State<popularListItem> {
  final String image_url;
  final String name;
  final String info;
  final String link;
  final String doc;

  _popularListItemState({
    this.image_url,
    this.name,
    this.info,
    this.link,
    this.doc,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.5,
      child: Column(
        children: [
          Stack(
            children:[
              Container(
              height: 110.0,
              width: Get.width,

        decoration: new BoxDecoration(
                 image: new DecorationImage(
                 image: new AssetImage('assets/asset-1.png'),
                 fit: BoxFit.cover,
               ))



             ),



                    Align(
                    alignment: Alignment.topRight,
                    child: Icon(Icons.favorite,color: AppColors.grayColor),
                ),



           ]
          ),



          Container(
            child: Text(
              name,
              //popularItem[index].name,
              style: TextStyle(
                  color: AppColors.primaryColour,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Container(
              height: 40,
              decoration: BoxDecoration(
                color: AppColors.greenColor,
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(15.0),
                    bottomLeft: Radius.circular(15.0)),
              ),
              child: RaisedButton(
                color: AppColors.greenColor,
                onPressed: () {
                  Get.to(Itemdecription(name: name, info: info,link: link,doc: doc,));
                },
                child: Center(
                    child: Text(
                  "SEE MORE",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                )),
              ))
        ],
      ),
    );
  }
}

// Widget popularListItem(
//     List<PopularItem> popularItem, int index, String name, String Info) {
//   return new Container(
//     child: Column(
//       children: [
//         Container(
//             height: 110.0,
//             width: Get.width,
//             decoration: new BoxDecoration(
//                 image: new DecorationImage(
//               image: new AssetImage(popularItem[index].image),
//               fit: BoxFit.cover,
//             ))),
//         Container(
//           child: Text(
//             name,
//             //popularItem[index].name,
//             style: TextStyle(
//                 color: AppColors.primaryColour,
//                 fontSize: 18,
//                 fontWeight: FontWeight.bold),
//           ),
//         ),
//         Container(
//             height: 40,
//             decoration: BoxDecoration(
//               color: AppColors.greenColor,
//               borderRadius: BorderRadius.only(
//                   bottomRight: Radius.circular(15.0),
//                   bottomLeft: Radius.circular(15.0)),
//             ),
//             child: RaisedButton(
//               color: AppColors.greenColor,
//               onPressed: () {
//                 Get.to(Itemdecription(
//                   popularItem: popularItem[index],
//                 ));
//               },
//               child: Center(
//                   child: Text(
//                 "SEE MORE",
//                 style:
//                     TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
//               )),
//             ))
//       ],
//     ),
//   );
// }
