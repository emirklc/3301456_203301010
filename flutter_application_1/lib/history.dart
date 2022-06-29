import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class HistoryScreen extends StatefulWidget {
  HistoryScreen({Key? key}) : super(key: key);

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  final _firestore = FirebaseFirestore.instance;
  @override
  Widget build(BuildContext context) {
    CollectionReference moviesRef = _firestore.collection('History');
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple.shade500,
        title: Text(
          "Geçmiş Kiralamalar",
        ),
        centerTitle: true,
      ),
      body: Column(children: [
        Container(
          margin: EdgeInsets.only(top: 25),
        ),
        StreamBuilder<QuerySnapshot>(
          /// Neyi dinlediğimiz bilgisi, hangi streami
          stream: moviesRef.snapshots(),

          /// Streamden her yerni veri aktığında, aşağıdaki metodu çalıştır
          builder: (BuildContext context, AsyncSnapshot asyncSnapshot) {
            if (asyncSnapshot.hasError) {
              return Center(child: Text('Bir Hata Oluştu, Tekrar Deneynizi'));
            } else {
              if (asyncSnapshot.hasData) {
                List<DocumentSnapshot> listOfDocumentSnap =
                    asyncSnapshot.data.docs;
                return Flexible(
                  child: ListView.builder(
                    itemCount: listOfDocumentSnap.length,
                    itemBuilder: (context, index) {
                      return Card(
                        color: Colors.deepPurple.shade500,
                        child: ListTile(
                          title: Text('${listOfDocumentSnap[index]['ad']}',
                              style:
                                  TextStyle(fontSize: 24, color: Colors.white)),
                          subtitle: Text(
                              '${listOfDocumentSnap[index]['tarih']}',
                              style:
                                  TextStyle(fontSize: 16, color: Colors.white)),
                          trailing: IconButton(
                            icon: Icon(Icons.delete, color: Colors.white),
                            onPressed: () async {
                              await listOfDocumentSnap[index]
                                  .reference
                                  .delete();
                            },
                          ),
                        ),
                      );
                    },
                  ),
                );
              } else {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            }
          },
        ),
      ]),
    );
  }
}
