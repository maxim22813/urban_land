import 'package:flutter/material.dart';

const InputLogin = InputDecoration(
  hintText: 'Логин',
  contentPadding:
  EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(15.0)),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.black, width: 3.0),
    borderRadius: BorderRadius.all(Radius.circular(15.0)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.black, width: 3.0),
    borderRadius: BorderRadius.all(Radius.circular(15.0)),
  ),
);

const cp = OutlineInputBorder(
  borderSide: BorderSide(color: Colors.black, width: 3.0),
  borderRadius: BorderRadius.all(Radius.circular(15.0)),
);

const f_cp = EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0);

const ff_cp = OutlineInputBorder(
borderRadius: BorderRadius.all(Radius.circular(15.0)),
);

const InputPasswd = InputDecoration(
  hintText: 'Пароль',
  contentPadding:
  EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(15.0)),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.black, width: 3.0),
    borderRadius: BorderRadius.all(Radius.circular(15.0)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.black, width: 3.0),
    borderRadius: BorderRadius.all(Radius.circular(15.0)),
  ),
);


const InputProblem= InputDecoration(
  hintText: 'опишите проблему',
  contentPadding:
  EdgeInsets.symmetric(vertical: 80.0, horizontal: 20.0),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(10.0)),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.black, width: 3.0),
    borderRadius: BorderRadius.all(Radius.circular(10.0)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.black, width: 3.0),
    borderRadius: BorderRadius.all(Radius.circular(10.0)),
  ),
);
