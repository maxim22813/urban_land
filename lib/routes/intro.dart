import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import './login.dart';
import './reg.dart';

class Intro extends StatefulWidget {

  static const String id = 'Intro';

  @override
  _IntroState createState() => _IntroState();
}

class _IntroState extends State<Intro> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('URBAN LAND', style: GoogleFonts.oswald(textStyle: TextStyle(fontSize: 32, fontWeight: FontWeight.bold)), ),

          SizedBox(height: 50.0,),

          Container(
            child: Image.asset('images/buildings.png'),
            height: 150.0,
            alignment: Alignment.center,
          ),

          SizedBox(height: 50.0,),

          Material(
            elevation: 5.0,
            color: Colors.black,
            borderRadius: BorderRadius.circular(15.0),

            child: MaterialButton(

              onPressed: () {
                Navigator.pushNamed(context, Login.id);
              },

              minWidth: 220.0,
              height: 60.0,

              child: Text('Войти',  style: GoogleFonts.robotoCondensed(textStyle: TextStyle(fontSize: 24, color: Colors.white, letterSpacing: 2,)),),

            ),
          ),

          SizedBox(height: 20.0,),

          Material(
            color: Colors.black,
            borderRadius: BorderRadius.circular(15.0),
            elevation: 5.0,

            child: MaterialButton(
              onPressed: () {
                Navigator.pushNamed(context, Reg.id);
              },

              minWidth: 220.0,
              height: 60.0,

              child: Text('Зарегистрироваться', style: GoogleFonts.robotoCondensed(textStyle: TextStyle(fontSize: 24, color: Colors.white, letterSpacing: 2,)),),
            ),
          ),
        ],
      ),
    );
  }
}
