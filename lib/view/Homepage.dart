import 'package:flutter/material.dart';
import 'package:practical_test/provider/news_provider.dart';
import 'package:provider/provider.dart';

class Home_page extends StatefulWidget {
  const Home_page({super.key});

  @override
  State<Home_page> createState() => _Home_pageState();
}

class _Home_pageState extends State<Home_page> {
  String country = "";

  @override
  Widget build(BuildContext context) {
    var newsprovider = Provider.of<News_Provider>(context);
    return DefaultTabController(
        length: 2,
        child: Scaffold(
            // bottomNavigationBar: BottomNavigationBar(items: [
            //   BottomNavigationBarItem(icon: Icon(Icons.home), label: 'General'),
            //   BottomNavigationBarItem(
            //       icon: Icon(Icons.roundabout_right_outlined),
            //       label: 'Country'),
            //   BottomNavigationBarItem(
            //       icon: Icon(Icons.search), label: 'Category'),
            // ]),
            drawer: Drawer(
              child: Column(
                children: [
                  Row(
                    children: [Icon(Icons.add)],
                  )
                ],
              ),
            ),
            appBar: AppBar(
              bottom: TabBar(
                tabs: [
                  Tab(
                    icon: Icon(Icons.home),
                    text: 'Home',
                  ),
                  Tab(
                    icon: Icon(Icons.roundabout_right_outlined),
                    text: 'Country',
                  ),
                ],
              ),
              title: Text("News App"),
              actions: [
                IconButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed('likedpage');
                  },
                  icon: Icon(Icons.favorite_outline_rounded),
                  color: Colors.red,
                )
              ],
            ),
            body: TabBarView(children: [
              ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: 10,
                itemBuilder: (context, index) => Container(
                  height: 50,
                  width: double.infinity,
                  margin: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.grey),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text("Name : ${newsprovider.allsourcedata[index].name}"),
                      Text(
                          "Country : ${newsprovider.allsourcedata[index].country}"),
                      IconButton(
                          onPressed: () {
                            Navigator.of(context)
                                .pushNamed('detail', arguments: index);
                          },
                          icon: Icon(Icons.arrow_forward_ios))
                    ],
                  ),
                ),
              ),
              ListView.builder(
                itemCount: newsprovider.countrylist.length,
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
                                newsprovider.addnews(index);
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(SnackBar(
                                  content: Text(
                                      "Successfully Added Toii Liked List"),
                                  backgroundColor: Colors.green,
                                ));
                              },
                              icon: Icon(
                                Icons.favorite_outline_rounded,
                                color: Colors.red,
                              ))
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ])));
  }
}
