import 'package:complimentapp/compli_model.dart';
import 'package:complimentapp/home_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class Compli extends StatefulWidget {
  final String payload;
  Compli({this.payload});
  @override
  _CompliState createState() => _CompliState();
}

class _CompliState extends State<Compli> {

  List<CompliModel> complis = CompliModel.compli;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
//      appBar:AppBar(
//        backgroundColor: Colors.transparent,
//      ),
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            Container(
              height: double.infinity,
              width: double.infinity,
              decoration: BoxDecoration(
                  image:DecorationImage(
                      image: AssetImage("assets/images/noti_back.png"),
                      fit: BoxFit.cover
                  )
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20,top: 30),
              child: Align(
                  alignment: Alignment.topLeft,
                  child: InkWell(
                      onTap: (){
                        Navigator.pop(context);
//                        Navigator.push(
//                          context,
//                          MaterialPageRoute(builder: (context) => HomeScreen()),
//                        );
                      },
                      child: Image.asset("assets/images/back_arrow.png",height: 30 ,width: 30,))),
            ),

            SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.only(top: 65),
                    child: Center(
                      child: Column(
                        children: <Widget>[
                          Text("Compliment Of",style: TextStyle(fontSize: 45,fontFamily: 'nick',color: Colors.white),),
                          SizedBox(height: 8),
                          Text("The Day",style: TextStyle(fontSize: 45,fontFamily: 'nick',color: Colors.white),),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 40),
                  widget.payload ==1 ?CircleAvatar(
                    radius: 80,
                    backgroundColor: Colors.white,
                    child: CircleAvatar(
                      backgroundImage: AssetImage(complis[int.parse(widget.payload)].image),
                      radius: 75,
                    ),
                  ): Image.asset(complis[int.parse(widget.payload)].image,height: 30,width: 30,),
                  SizedBox(height: 25),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 15),
                    child: Text(complis[int.parse(widget.payload)].text.toString().toUpperCase(),textAlign: TextAlign.center,
                      style: TextStyle(fontFamily: 'monster',fontSize: 24,color: Colors.white,height: 1.7,letterSpacing: 2),),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
