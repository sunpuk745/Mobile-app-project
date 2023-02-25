import 'package:flutter/material.dart';
import './app_screen/ginraidee.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Ginraidee',
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        body: ListViewFood(),
      )
    )
  );
}