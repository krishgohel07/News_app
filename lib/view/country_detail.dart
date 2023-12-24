import 'package:flutter/material.dart';
import 'package:practical_test/provider/news_provider.dart';
import 'package:provider/provider.dart';

class Country_detail extends StatefulWidget {
  const Country_detail({super.key});

  @override
  State<Country_detail> createState() => _Country_detailState();
}

class _Country_detailState extends State<Country_detail> {
  @override
  Widget build(BuildContext context) {
    int index = ModalRoute.of(context)!.settings.arguments as int;
    var newsprovider = Provider.of<News_Provider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("${newsprovider.countrylist[index]['source']['name']}"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 250,
              width: double.infinity,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(
                          "${newsprovider.countrylist[index]['urlToImage']}"))),
            ),
            SizedBox(
              height: 0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Author : ${newsprovider.countrylist[index]['author']}"),
                Column(
                  children: [
                    Text("Published At : "),
                    Text("${newsprovider.countrylist[index]['publishedAt']}")
                  ],
                )
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "${newsprovider.countrylist[index]['title']}",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 8,
            ),
            Divider(
              height: 5,
              color: Colors.grey,
              thickness: 2,
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              "${newsprovider.countrylist[index]['description']}",
              style: TextStyle(fontWeight: FontWeight.w400),
            ),
            SizedBox(
              height: 8,
            ),
            Divider(
              height: 5,
              color: Colors.grey,
              thickness: 2,
            ),
            Text("${newsprovider.countrylist[index]['content']}"),
            SizedBox(
              height: 8,
            ),
            Divider(
              height: 5,
              color: Colors.grey,
              thickness: 2,
            ),
            Container(
              margin: EdgeInsets.only(top: 12),
              height: 30,
              width: 250,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.purple),
              child: Center(
                child: InkWell(
                  onTap: () {
                    Navigator.of(context)
                        .pushNamed('webpage', arguments: index);
                  },
                  child: Text("SEE MORE ABOUT THIS >"),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
