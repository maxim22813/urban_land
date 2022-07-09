import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../const.dart';
import 'work.dart';


class Reg extends StatefulWidget {

  static const String id = 'Reg';

  @override
  _RegState createState() => _RegState();

}

class _RegState extends State<Reg> {

  String email = '';
  String passwd = '';

  @override
  void initState() {
    super.initState();
    init();
  }

  void init() async{
    await Firebase.initializeApp();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Flexible(child: Container(
              height: 200.0,
              child: Image.asset('images/building3.png'),
            ), ),
            SizedBox(
              height: 50.0,
            ),
            TextField(
              keyboardType: TextInputType.emailAddress,
              textAlign: TextAlign.center,
              onChanged: (value) {
                email = value;
              },
              decoration: InputLogin,
            ),
            SizedBox(
              height: 8.0,
            ),
            TextField(
              textAlign: TextAlign.center,
              onChanged: (value) {
                passwd = value;
              },
              decoration: InputPasswd,
            ),
            SizedBox(
              height: 24.0,
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 16.0),
              child: Material(
                color: Colors.black,
                borderRadius: BorderRadius.all(Radius.circular(15.0)),
                elevation: 5.0,

                child: MaterialButton(

                  onPressed: () async {
                    try{
                      final auth = FirebaseAuth.instance;
                      await auth.createUserWithEmailAndPassword(email: email, password: passwd);
                      Navigator.pushNamed(context, Work.id);
                    }
                    catch(e){
                      print(e);
                    }
                  },

                  minWidth: 200.0,
                  height: 50.0,

                  child: Text('Зарегистироваться', style: GoogleFonts.robotoCondensed(textStyle: TextStyle(fontSize: 24, color: Colors.white,)),),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
