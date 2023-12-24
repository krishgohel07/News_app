import 'package:flutter/material.dart';
import 'package:practical_test/provider/news_provider.dart';
import 'package:provider/provider.dart';

class Favorite_list extends StatefulWidget {
  const Favorite_list({super.key});

  @override
  State<Favorite_list> createState() => _Favorite_listState();
}

class _Favorite_listState extends State<Favorite_list> {
  @override
  Widget build(BuildContext context) {
    var newsprovider = Provider.of<News_Provider>(context);
    return Scaffold(
        appBar: AppBar(
          title: Text("Liked News"),
        ),
        body: (newsprovider.favorite.isNotEmpty)
            ? ListView.builder(
                itemCount: newsprovider.favorite.length,
                itemBuilder: (context, index) => Container(
                  height: 150,
                  margin: EdgeInsets.all(15),
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.black12),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Container(
                            margin: EdgeInsets.only(top: 15),
                            height: 80,
                            width: 250,
                            child: Column(
                              children: [
                                Text(
                                    "${newsprovider.countrylist[index]['title']}")
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 15, top: 15),
                            height: 70,
                            width: 80,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: NetworkImage(
                                        "${newsprovider.countrylist[index]['urlToImage']}"),
                                    fit: BoxFit.cover)),
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
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
                                  Navigator.of(context).pushNamed(
                                      'countrydetail',
                                      arguments: index);
                                },
                                child: Text("SEE MORE ABOUT THIS >"),
                              ),
                            ),
                          ),
                          IconButton(
                              onPressed: () {
                                newsprovider.removenews(index);
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(SnackBar(
                                  content: Text(
                                      "Successfully Removed From Liked List"),
                                  backgroundColor: Colors.green,
                                ));
                              },
                              icon: Icon(
                                Icons.hide_source_sharp,
                                color: Colors.red,
                              ))
                        ],
                      )
                    ],
                  ),
                ),
              )
            : Center(
                child: Text("Your Favorite List is Empty"),
              ));
  }
}
