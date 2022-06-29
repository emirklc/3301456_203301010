import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_1/bottomNavigationBar.dart';
import 'package:flutter_application_1/cars/fordFocus.dart';
import 'package:flutter_application_1/cars/hondaCivic.dart';
import 'package:flutter_application_1/cars/kiaCerato.dart';
import 'package:flutter_application_1/cars/renaultClio.dart';
import 'package:flutter_application_1/cars/renaultMegane.dart';
import 'package:flutter_application_1/cars/toyotaCorolla.dart';
import 'package:flutter_application_1/cars/volkswagenPassat.dart';
import 'package:flutter_application_1/cars/volvoXC90.dart';

class mainScreen extends StatefulWidget {
  const mainScreen({Key? key}) : super(key: key);

  @override
  State<mainScreen> createState() => _mainScreenState();
}

class _mainScreenState extends State<mainScreen> {
  @override
  final _firestore = FirebaseFirestore.instance;
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    //collection düzeyinde veri
    CollectionReference musicInfo = _firestore.collection('Cars');
    //document düzeyinde veri

    return Scaffold(
      bottomNavigationBar: BottomNavigationBarWidget(),
      body: Stack(children: [
        Positioned(
          child: Text(
            "Arabalar",
            style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
          ),
          top: 125,
          left: 45,
        ),
        Padding(
          padding: EdgeInsets.only(top: 200),
          child: StreamBuilder<QuerySnapshot>(
              stream: musicInfo.snapshots(),
              builder: (BuildContext context, AsyncSnapshot asyncSnapshot) {
                //just add this line
                if (asyncSnapshot.data == null)
                  return Center(child: CircularProgressIndicator());
                List<DocumentSnapshot> docSnap = asyncSnapshot.data.docs;
                return GridView.builder(
                  primary: false,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 5.0,
                    mainAxisSpacing: 5.0,
                  ),
                  padding: const EdgeInsets.all(20),
                  itemCount: docSnap.length,
                  itemBuilder: (context, index) {
                    return Flexible(
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.deepPurple.shade400,
                            borderRadius: BorderRadius.circular(20)),
                        padding: const EdgeInsets.all(8),
                        child: GestureDetector(
                          onTap: () {
                            switch (index) {
                              case 0:
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                          VolkswagenDetailPage()));

                                break;
                              case 1:
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            ToyotaCorollaDetailPage()));

                                break;
                                case 2:
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            RenaultClioDetailPage()));

                                break;
                                case 3:
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            KiaCeratoDetailPage()));

                                break;
                                case 4:
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            FordFocusDetailPage()));

                                break;
                                case 5:
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            HondaCivicDetailPage()));

                                break;
                                case 6:
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                          RenaultMeganeDetailPage  ()));

                                break;
                                 case 7:
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            VolvoDetailPage()));

                                break;
                              default:
                            }
                          },
                          child: Center(
                              child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                "${docSnap[index]["adı"]}",
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                              Container(
                                child:
                                    Image.network("${docSnap[index]["img"]}"),
                                width: 115,
                                height: 115,
                              ),
                              Container(
                                padding: EdgeInsets.all(2),
                                child: Text(
                                  "${docSnap[index]["ücret"]}",
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                              )
                            ],
                          )),
                        ),
                      ),
                    );
                  },
                );
              }),
        ),
      ]),
    );
  }
}
