import 'package:flutter/material.dart';

import 'routes/intro.dart';
import 'routes/login.dart';
import 'routes/reg.dart';
import 'routes/work.dart';

void main() => runApp(GeekChat());

class GeekChat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: Intro.id,
      routes: {
        Intro.id: (context) => Intro(),
        Login.id: (context) => Login(),
        Reg.id: (context) => Reg(),
        Work.id: (context) => Work(),
      },
    );
  }
}