import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'bottomNavigationBar.dart';

class RentACarScreen extends StatefulWidget {
  @override
  _RentACarScreenState createState() => _RentACarScreenState();
}

class _RentACarScreenState extends State<RentACarScreen> {
  final _firestore = FirebaseFirestore.instance;
  TextEditingController nameController = TextEditingController();
  TextEditingController ratingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    CollectionReference moviesRef = _firestore.collection('History');

    return Scaffold(
      bottomNavigationBar: BottomNavigationBarWidget(),
      backgroundColor: Colors.white,
      body: Column(children: [
          Container(
            margin: EdgeInsets.only(top: 150),
      child: Text(
        "Kirala",
        style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
      ),
          ),
          Container(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: 12.0, vertical: 10),
            child: Form(
              child: Column(
                children: [
                  TextFormField(
                    controller: nameController,
                    decoration:
                        InputDecoration(hintText: 'Araba Adını Giriniz'),
                  ),
                  TextFormField(
                    controller: ratingController,
                    decoration:
                        InputDecoration(hintText: 'Tarih Giriniz'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
          ),
          MaterialButton(
      color: Colors.deepPurple.shade500,
      child: Text('Kirala',style: TextStyle(color: Colors.white),),
     
      onPressed: () async {
        print(nameController.text);
        print(ratingController.text);
      
        /// Text alanlarındaki veriden bir map oluşturulması
        Map<String, dynamic> movieData = {
          'ad': nameController.text,
          'tarih': ratingController.text
        };
      
        await moviesRef.doc(nameController.text).set(movieData);
      },
     
          )
        ]),
      
    );
  }
}
