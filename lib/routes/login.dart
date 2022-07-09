import 'package:flutter/material.dart';
import '../const.dart';
import 'work.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_fonts/google_fonts.dart';



class Login extends StatefulWidget {

  static const String id = 'Login';

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {

  var email = '';
  var passwd = '';

  bool _isObscure = true;

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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Flexible(
            child: Container(
              height: 160.0,
              child: Image.asset('images/building2.png'),
            ),
          ),

          SizedBox(
            height: 60.0,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50),
            child: TextField(
              onChanged: (value) {
                email = value;
              },
              decoration: InputLogin,
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50.0),
            child: TextField(
              obscureText: _isObscure,
              onChanged: (value) {
                passwd = value;
              },
              decoration: InputDecoration(
                hintText: 'Пароль',
                suffixIcon:  IconButton(
                  icon: Icon(
                    color: Colors.black,
                    _isObscure ? Icons.visibility : Icons.visibility_off,
                  ), onPressed: () {
                  setState(() {
                    _isObscure = !_isObscure;
                  });
                },
                ),
                contentPadding: f_cp,
                border: ff_cp,
                enabledBorder: cp,
                focusedBorder: cp,
              ),
            ),
          ),
          SizedBox(
            height: 50.0,
          ),
          Material(
            color: Colors.black,
            borderRadius: BorderRadius.all(Radius.circular(15.0)),
            elevation: 5.0,
            child: MaterialButton(
              onPressed: () async {
                try{
                  final auth = FirebaseAuth.instance;
                  await auth.signInWithEmailAndPassword(email: email, password: passwd);
                  Navigator.pushNamed(context, Work.id);
                }
                catch(e){
                  print('wrong login or password');
                }
              },
              minWidth: 120.0,
              height: 50.0,

              child: Text('Вход', style: GoogleFonts.robotoCondensed(textStyle: TextStyle(fontSize: 24, color: Colors.white, letterSpacing: 2,)),),

            ),
          ),
        ],
      ),
    );
  }
}
