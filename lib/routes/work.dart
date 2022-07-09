import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../const.dart';
import './login.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:geolocator/geolocator.dart';

class Work extends StatefulWidget {

  static const String id = 'Work';

  @override
  _WorkState createState() => _WorkState();
}

class _WorkState extends State<Work> {

  @override
  void initState() {
    super.initState();
    init();
  }

  var lat = '';
  var lon = '';

  late FirebaseAuth auth = FirebaseAuth.instance;
  late FirebaseFirestore doc = FirebaseFirestore.instance;
  late String mess;

  var currentUser;


  void init() async{
    getLocation ();
    await Firebase.initializeApp();
    currentUser = auth.currentUser;
  }

  final txtControl = TextEditingController();

  getLocation () async {
    await Geolocator.requestPermission();
    Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);

    setState((){
      lat = position.latitude.toString();
      lon = position.longitude.toString();
    });

    print(position);

  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: null,
        actions: [
          IconButton(icon: Icon(Icons.close),
              onPressed: () async {
                try {
                  await auth.signOut();
                  print(auth.currentUser);
                  Navigator.pushNamed(context, Login.id);
                }
                catch (e) {
                  print(e);
                }
              }
          ),
        ],
        title: Text('urban land', style: GoogleFonts.oswald(textStyle: TextStyle(fontSize: 18, letterSpacing: 5)) ),
        backgroundColor: Colors.black,
      ),

      body:
        Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,


            children: [



              Flexible(child:

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: TextField(

                  onChanged: (value) {
                    mess = value;
                  },
                  decoration: InputProblem,
                ),
              ),

              ),


              SizedBox(
                height: 50.0,
              ),

              Flexible(child:
              Material(
                color: Colors.black,
                borderRadius: BorderRadius.circular(15.0),
                elevation: 5.0,

                child: MaterialButton(

                  onPressed: (){

                    final data = FirebaseFirestore.instance;

                    data.collection('mess').add(

                        { 'time': Timestamp.now().seconds.toString(),
                          'sender': auth.currentUser?.email,
                          'text': mess,
                          'latitude': lat,
                          'longitude': lon,

                        }
                    );

                    Navigator.popAndPushNamed(context, Work.id);

                  },

                  child:
                  Text('Отправить',
                    style: GoogleFonts.robotoCondensed(textStyle: TextStyle(fontSize: 24, color: Colors.white,)),),
                ),
              )
              ),

            ]

        )


    );
  }
}

