import 'package:flutter/material.dart';
import 'package:flutter_application_1/mainscreen.dart';
import 'package:flutter_application_1/service/auth.dart';


class createAccount extends StatefulWidget {
  @override
  _createAccount createState() => _createAccount();
}

class _createAccount extends State<createAccount> {
  AuthService _authService = AuthService();
  @override
  Widget build(BuildContext context) {
    final TextEditingController _nameController = TextEditingController();
    final TextEditingController _emailController = TextEditingController();
    final TextEditingController _passwordController = TextEditingController();
    final TextEditingController _passwordAgainController =
        TextEditingController();
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple.shade400,
    
        
        centerTitle: true,
      ),
      body: arkaPlan(),
    );
  }
}

class arkaPlan extends StatefulWidget {
  arkaPlan({Key? key}) : super(key: key);

  @override
  State<arkaPlan> createState() => _arkaPlanState();
}

class _arkaPlanState extends State<arkaPlan> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _passwordAgainController =
      TextEditingController();
  AuthService _authService = AuthService();
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Container(
      width: screenSize.width,
      height: screenSize.height,
      decoration: BoxDecoration(
          color:Colors.white,
           ),
      child: Center(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              
              Padding(
                padding: const EdgeInsets.only(
                    left: 15.0, right: 15.0, top: 20, bottom: 0),
                //padding: EdgeInsets.symmetric(horizontal: 15),
                child: Container(
                  width: screenSize.width,
                  height: screenSize.height * .088,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(22),
                    border: Border.all(
                      color:Colors.deepPurple.shade500.withOpacity(.75),
                    ),
                    
                      color:Colors.deepPurple.shade500.withOpacity(.75),
                  ),
                  child: new TextField(
                    cursorColor: Colors.white,
                    controller: _emailController,
                    style: TextStyle(color: Colors.white),
                    textAlign: TextAlign.center,
                    decoration: new InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                          color: Colors.transparent,
                        )),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                          color: Colors.transparent,
                        )),
                        border: new OutlineInputBorder(
                            borderSide: new BorderSide(
                                color: Color.fromARGB(255, 6, 253, 228))),
                        hintText: 'Eposta adresinizi giriniz   abcd@gmail.com',
                        labelText: 'Eposta',
                        labelStyle: TextStyle(color: Colors.white),
                        hintStyle: TextStyle(
                            color: Color.fromARGB(153, 255, 255, 255)),
                        prefixIcon: const Icon(
                          Icons.email,
                          color: Colors.white,
                        ),
                        suffixStyle: const TextStyle(color: Colors.green)),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 15.0, right: 15.0, top: 20, bottom: 0),
                //padding: EdgeInsets.symmetric(horizontal: 15),
                child: Container(
                  width: screenSize.width,
                  height: screenSize.height * .088,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(22),
                    border: Border.all(
                      color: Colors.deepPurple.shade500.withOpacity(.75),
                    ),
                 color:Colors.deepPurple.shade500.withOpacity(.75),
                  ),
                  child: new TextField(
                    style: TextStyle(
                      color: Colors.white,
                    ),
                    cursorColor: Colors.white,
                    controller: _passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.vpn_key,
                        color: Colors.white,
                      ),
                      hintText: 'Parola',
                      prefixText: ' ',
                      hintStyle: TextStyle(color: Colors.white),
                      focusColor: Colors.white,
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                        color: Colors.white,
                      )),
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                        color: Colors.white,
                      )),
                    ),
                  ),
                                
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 15.0, right: 15.0, top: 20, bottom: 0),
                //padding: EdgeInsets.symmetric(horizontal: 15),
                child: Container(
                  width: screenSize.width,
                  height: screenSize.height * .088,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(22),
                    border: Border.all(
                color:Colors.deepPurple.shade500.withOpacity(.75),
                    ),
                 color:Colors.deepPurple.shade500.withOpacity(.75),
                  ),
                  child: new TextField(
                    cursorColor: Colors.white,
                    controller: _nameController,
                    style: TextStyle(color: Colors.white),
                    textAlign: TextAlign.center,
                    decoration: new InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                          color: Colors.transparent,
                        )),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                          color: Colors.transparent,
                        )),
                        border: new OutlineInputBorder(
                            borderSide: new BorderSide(
                                color: Color.fromARGB(255, 6, 253, 228))),
                        hintText: 'Parolayı Tekrar Girin: ',
                        labelText: 'Parola Tekrar',
                        labelStyle: TextStyle(color: Colors.white),
                        hintStyle: TextStyle(
                            color: Color.fromARGB(153, 255, 255, 255)),
                        prefixIcon: const Icon(
                          Icons.vpn_key,
                          color: Colors.white,
                        ),
                        suffixStyle: const TextStyle(color: Colors.green)),
                  ),
                  
                  
                  
                  
                ),
              ),

              //KAYIT OLMA KISMI BAŞARILI FAKAT KAYIT OLDUKTAN SONRA YÖNLENDİRME HATASI ALIYORUM
              Padding(
                padding: const EdgeInsets.only(top: 50),
                child: MaterialButton(
                  onPressed: () {
                    _authService
                        .createPerson(_nameController.text,
                            _emailController.text, _passwordController.text)
                        .then((value) {
                      return Navigator.push(context,
                          MaterialPageRoute(builder: (context) => mainScreen()));
                    });
                  },
                  child: Container(
                    width: screenSize.width * .4,
                    height: screenSize.height * .07,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        gradient: new LinearGradient(
                            colors: [
                             Colors.deepPurple.shade500.withOpacity(.75),
                             Colors.deepPurple.shade500.withOpacity(.75),
                            ],
                            stops: [
                              0.6,
                              0.7,
                            ],
                            begin: FractionalOffset.topCenter,
                            end: FractionalOffset.bottomCenter,
                            tileMode: TileMode.repeated)),
                    child: Center(
                      child: Text(
                        "Kayıt ol",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}