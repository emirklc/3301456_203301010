import 'package:flutter/material.dart';
import 'package:flutter_application_1/rentacarPage.dart';

class VolvoDetailPage extends StatefulWidget {
  VolvoDetailPage({Key? key}) : super(key: key);

  @override
  State<VolvoDetailPage> createState() => _VolvoDetailPageState();
}

class _VolvoDetailPageState extends State<VolvoDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple.shade400,
      body: Stack(children: [
        Positioned(
            right: 15,
            top: 35,
            child: Opacity(
                opacity: 0.1,
                child: Image.network(
                  "https://icon-library.com/images/rental-car-icon/rental-car-icon-9.jpg",
                  width: 50,
                ))),
        Positioned(
          top: 40,
          left: 15,
          child: GestureDetector(
            child: Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ),
        Positioned(
          top: 100,
          left: 15,
          child: Text(
            "Volvo XC60",
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 35, color: Colors.white),
          ),
        ),
        Positioned(
          top: 300,
          child: Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30))),
            width: 412,
            height: 420,
          ),
        ),
        Positioned(
          left: 70,
          top: 190,
          child: Container(
            width: 275,
            child: Image.network(
                "https://experix.com.tr/wp-content/uploads/2022/02/xc60.png"),
          ),
        ),
        Positioned(
          top: 355,
          right: 140,
          child: Image.network(
            "https://mythesishelp.com/images/rating.png",
            width: 125,
          ),
        ),
        Positioned(
          top: 375,
          left: 60,
          child: Container(
            width: 200,
            height: 250,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  "Yıl: 2020",
                  style: TextStyle(fontSize: 17.5, fontWeight: FontWeight.w500),
                ),
                Text("Yakıt: Benzinli",
                    style:
                        TextStyle(fontSize: 17.5, fontWeight: FontWeight.w500)),
                Text("Vites: Otomatik",
                    style:
                        TextStyle(fontSize: 17.5, fontWeight: FontWeight.w500)),
                Text("KM: 38.000",
                    style:
                        TextStyle(fontSize: 17.5, fontWeight: FontWeight.w500)),
                Text("Motor Gücü: 250 hp",
                    style:
                        TextStyle(fontSize: 17.5, fontWeight: FontWeight.w500)),
              ],
            ),
          ),
        ),
        Positioned(
            right: 100,
            bottom: 20,
            child: GestureDetector(
              onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => RentACarScreen()));
                  },
              child: Container(
                width: 200,
                height: 45,
                decoration: BoxDecoration(
                    color: Colors.deepPurple.shade400,
                    borderRadius: BorderRadius.circular(20)),
                    child: Center(child: Text("Kirala",style: TextStyle(color: Colors.white,fontSize: 20),)),
              ),
            ))
      ]),
    );
  }
}
