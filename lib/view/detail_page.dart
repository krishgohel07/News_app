import 'package:flutter/material.dart';
import 'package:practical_test/provider/news_provider.dart';
import 'package:provider/provider.dart';

class Details_page extends StatefulWidget {
  const Details_page({super.key});

  @override
  State<Details_page> createState() => _Details_pageState();
}

class _Details_pageState extends State<Details_page> {
  @override
  Widget build(BuildContext context) {
    int index = ModalRoute.of(context)!.settings.arguments as int;
    var newsprovider = Provider.of<News_Provider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("${newsprovider.allsourcedata[index].name}"),
      ),
      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage('assets/img_1.png'))),
          ),
          Text(
              "Description : ${newsprovider.allsourcedata[index].description}"),
          SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Text("Category : ${newsprovider.allsourcedata[index].category}")
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Text("Category : ${newsprovider.allsourcedata[index].country}")
            ],
          ),
          Container(
            height: 50,
            width: double.infinity,
            margin: EdgeInsets.all(15),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.blueAccent),
            child: Center(
              child: InkWell(
                onTap: () {
                  Navigator.of(context).pushNamed('webpage',arguments: index);
                },
                child: Text("Click here For more Information"),
              ),
            ),
          )
        ],
      ),
    );
  }
}
