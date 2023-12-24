import 'package:flutter/material.dart';
import 'package:practical_test/provider/news_provider.dart';
import 'package:practical_test/provider/web_provider.dart';
import 'package:practical_test/view/Homepage.dart';
import 'package:practical_test/view/Liked_page.dart';
import 'package:practical_test/view/country_detail.dart';
import 'package:practical_test/view/detail_page.dart';
import 'package:practical_test/view/splash_screen.dart';
import 'package:practical_test/view/web_age.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Provider.debugCheckInvalidValueType = null;
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => News_Provider(),
        ),
        ChangeNotifierProvider(
          create: (context) => WebProvider(),
        )
      ],
      builder: (context, _) => MaterialApp(
        initialRoute: '/',
        routes: {
          '/': (context) => Splash_screen(),
          'homepage': (context) => Home_page(),
          'detail': (context) => Details_page(),
          'webpage': (context) => webPage(),
          'countrydetail': (context) => Country_detail(),
          'likedpage': (context) => Favorite_list()
        },
      ),
    );
  }
}
