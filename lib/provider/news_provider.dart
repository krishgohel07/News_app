import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:practical_test/model/country_model.dart';
import 'package:practical_test/model/source_model.dart';

class News_Provider extends ChangeNotifier {
  List<SourceModel> allsourcedata = [];
  List<Countrymodel> allcountrydata = [];
  List countrylist=[];
  String country = "us";

  Future<void> fetchdata() async {
    String apikey = "5ef57aeb289c4d418c21392792a98883";
    String api = "https://newsapi.org/v2/top-headlines/sources?apiKey=$apikey";
    String api2 = "https://newsapi.org/v2/everything?q=bitcoin&apiKey=$apikey";
    String api3 =
        "https://newsapi.org/v2/top-headlines?country=$country&apiKey=$apikey";
    http.Response response = await http.get(Uri.parse(api));
    http.Response response2 = await http.get(Uri.parse(api2));
    http.Response response3 = await http.get(Uri.parse(api3));
    if (response.statusCode == 200 &&
        response2.statusCode == 200 &&
        response3.statusCode == 200) {
      String data = response.body;
      String data2 = response2.body;
      String data3 = response3.body;
      Map<String, dynamic> sourcedata = jsonDecode(data);
      Map<String, dynamic> categorydata = jsonDecode(data);
      Map<String, dynamic> countrydata = jsonDecode(data3);
      List source = sourcedata['sources'];
      countrylist = countrydata['articles'];
      allsourcedata = source
          .map((e) => SourceModel(
              id: e['id'],
              country: e['country'],
              name: e['name'],
              description: e['description'],
              category: e['category'],
              language: e['language'],
              url: e['url']))
          .toList();
     // for(int i=0;i<countrylist.length;i++){
     //   allcountrydata = countrylist
     //       .map((e) => Countrymodel(
     //       description: e[0]['description'],
     //       url: e[0]['url'],
     //       title: e[0]['title'],
     //       author: e[0]['author'],
     //       content: e[0]['content'],
     //       publishdAt: e[0]['publishdAt'],
     //       urlToImage: e[0]['urlToImage']))
     //       .toList();
     // }
    }
  }

  void changecity(String val) {}
}
