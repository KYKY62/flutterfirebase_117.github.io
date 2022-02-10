// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class LoadingView extends StatelessWidget {
  const LoadingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    ));
  }
}
