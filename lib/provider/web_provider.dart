import 'package:flutter/cupertino.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class WebProvider extends ChangeNotifier {
  InAppWebViewController? inAppWebViewController;
  PullToRefreshController? pullToRefreshController;

  void initcontroller(contoller) {
    inAppWebViewController = contoller;
    notifyListeners();
  }

  void initRefresh() {
    pullToRefreshController = PullToRefreshController(
        options: PullToRefreshOptions(color: Color(0xffF44336)),
        onRefresh: () {
          inAppWebViewController!.reload();
        });
    notifyListeners();
  }

  Future<void> home(String uri) async {
    await inAppWebViewController!
        .loadUrl(urlRequest: URLRequest(url: Uri.parse(uri)));
  }

  forward() async{
    if(await inAppWebViewController!.canGoForward()){
      await inAppWebViewController!.goForward();
    }
    notifyListeners();
  }

  backward() async{
    if(await inAppWebViewController!.canGoBack()){
      await inAppWebViewController!.goBack();
      notifyListeners();
    }
  }

  void stoprefresh(){
    pullToRefreshController!.endRefreshing();
    notifyListeners();
  }
}
