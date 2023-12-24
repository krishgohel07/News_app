import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:practical_test/provider/news_provider.dart';
import 'package:practical_test/provider/web_provider.dart';
import 'package:provider/provider.dart';

class webPage extends StatefulWidget {
  const webPage({super.key});

  @override
  State<webPage> createState() => _webPageState();
}

class _webPageState extends State<webPage> {
  @override
  Widget build(BuildContext context) {
    var webprovider = Provider.of<WebProvider>(context);
    var webproviderfalse = Provider.of<WebProvider>(context, listen: false);
    int index = ModalRoute.of(context)!.settings.arguments as int;
    var newsprovider = Provider.of<News_Provider>(context);
    return Scaffold(
        appBar: AppBar(
          title: Text("${newsprovider.countrylist[index]['source']['name']}"),
        ),
        body: InAppWebView(
          pullToRefreshController: webprovider.pullToRefreshController,
          initialUrlRequest: URLRequest(
              url: Uri.parse("${newsprovider.countrylist[index]['url']}")),
          onLoadStart: (controller, uri) {},
          onLoadStop: (controller, uri) {},
        ),
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
              onPressed: () {},
              child: Icon(Icons.arrow_back_ios_rounded),
            ),
            FloatingActionButton(
              onPressed: () {},
              child: Icon(Icons.arrow_forward_ios_rounded),
            ),
            FloatingActionButton(
              onPressed: () {},
              child: Icon(Icons.refresh),
            ),
            FloatingActionButton(
              onPressed: () {
                webproviderfalse
                    .home("${newsprovider.countrylist[index]['url']}");
              },
              child: Icon(Icons.home),
            )
          ],
        ));
  }
}
