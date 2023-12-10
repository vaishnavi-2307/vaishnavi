import 'package:flutter/material.dart';

class Error404Page extends StatelessWidget {
  const Error404Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('404, not found!'),
      ),
    );
  }
}
