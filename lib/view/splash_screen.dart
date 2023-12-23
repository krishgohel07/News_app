import 'dart:async';

import 'package:flutter/material.dart';
import 'package:practical_test/provider/news_provider.dart';
import 'package:provider/provider.dart';

class Splash_screen extends StatefulWidget {
  const Splash_screen({super.key});

  @override
  State<Splash_screen> createState() => _Splash_screenState();
}

class _Splash_screenState extends State<Splash_screen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getdata(context).then((value) => Timer(Duration(seconds: 3), () {
          Navigator.of(context).pushReplacementNamed('homepage');
        }));
  }

  Future<void> getdata(BuildContext context) async {
    await Provider.of<News_Provider>(context,listen: false).fetchdata();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Container(
        decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage('assets/img.png'))),
      ),
    ));
  }
}
