import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_appgovernment_subsidy/AppColors.dart';

import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import 'model/PopularItem.dart';

class Itemdecription extends StatefulWidget {
  //PopularItem popularItem;
  final String name;
  final String info;
  final String link;
  final String doc;
  Itemdecription({this.name, this.info,this.link,this.doc});
  @override
  _ItemdecriptionState createState() => _ItemdecriptionState();
}

class _ItemdecriptionState extends State<Itemdecription> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: InkWell(
          onTap: () {
            Get.back();
          },
          child: Container(
            child: Icon(
              Icons.arrow_back,
              color: AppColors.primaryColour,
              size: 20.0,
            ),
          ),
        ),
        title: Text(
          widget.name,
          style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: AppColors.primaryColour),
        ),
      ),
      body: Container(
        height: Get.height,
        width: Get.width,
         child: SingleChildScrollView(
           child: Column(
             children: [
               Stack(
                 children: [


                  Container(
                   width: Get.width,
                   child: Image.asset('assets/asset-4.png'),
                 ),

           ]
               ),
               Container(
                 padding: const EdgeInsets.all(20),
                 alignment: Alignment.topLeft,
                 child:Text(widget.name,
                 style: TextStyle(
                     color: AppColors.primaryColour,
                     fontSize: 18,
                     fontWeight: FontWeight.bold),
               ),
               ),
               SizedBox(height: 20,),
               Container(
                 padding: const EdgeInsets.all(20),
                 alignment: Alignment.topLeft,
                 child:Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
                   mainAxisAlignment: MainAxisAlignment.start,
                   children: [
                    Text("About",style: TextStyle(
                       color: AppColors.grayColor,
                       fontSize: 15,
                       fontWeight: FontWeight.bold),),
                     Text(widget.info,style: TextStyle(
                       fontSize: 13,fontWeight:FontWeight.bold,color: Colors.black
                     ),)

                 ],)
                 
                 
                 
               ),
               SizedBox(height: 20,),
               Container(
                   padding: const EdgeInsets.all(20),
                   alignment: Alignment.topLeft,
                   child:Column(
                     crossAxisAlignment: CrossAxisAlignment.start,
                     mainAxisAlignment: MainAxisAlignment.start,
                     children: [
                       Text("Required Document",style: TextStyle(
                           color: AppColors.grayColor,
                           fontSize: 15,
                           fontWeight: FontWeight.bold),),
                       Text(widget.doc,style: TextStyle(
                           fontSize: 13,fontWeight:FontWeight.bold,color: Colors.black
                       ),)

                     ],)
               ),
               SizedBox(height: 10,),
               Container(
                   padding: const EdgeInsets.all(20),
                   alignment: Alignment.topLeft,
                   child:Column(
                     crossAxisAlignment: CrossAxisAlignment.start,
                     mainAxisAlignment: MainAxisAlignment.start,
                     children: [
                       Text("Link to apply",style: TextStyle(
                           color: AppColors.grayColor,
                           fontSize: 15,
                           fontWeight: FontWeight.bold),),


                 new InkWell(
                     child: new Text(widget.link,style: TextStyle(color: AppColors.primaryColour),),
                     onTap: () => launch(widget.link)
                 ),



                     ],
                   )
               )
             ],
           ),
         ),

      ),
    );
  }
}
