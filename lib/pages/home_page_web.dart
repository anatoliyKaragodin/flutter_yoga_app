import 'package:flutter/foundation.dart';
import 'package:flutter_file_downloader/flutter_file_downloader.dart';
import 'package:flutter_yoga_app/utils/dimensions_util.dart';
import 'package:flutter_yoga_app/utils/library.dart';

import '../main.dart';

class HomePageWeb extends StatefulWidget {
  const HomePageWeb({Key? key}) : super(key: key);

  @override
  State<HomePageWeb> createState() => _HomePageWebState();
}

class _HomePageWebState extends State<HomePageWeb> {
  @override
  Widget build(BuildContext context) {
    CookieManager cookieManager = CookieManager.instance();
    InAppWebViewController? webViewController;
    InAppWebViewGroupOptions options = InAppWebViewGroupOptions(
        crossPlatform: InAppWebViewOptions(
          useOnDownloadStart: true,
          useOnLoadResource: true,
          // allowFileAccessFromFileURLs: true,
          useShouldOverrideUrlLoading: true,
          mediaPlaybackRequiresUserGesture: false,
        ),
        android: AndroidInAppWebViewOptions(
          thirdPartyCookiesEnabled: true,
        ));
    Uri uri = Uri.parse(url);

    return Scaffold(
        body:

            /// Webview widget
            WillPopScope(
                onWillPop: () async {
                  webViewController?.goBack();
                  return false;
                },
                child: InAppWebView(
                  onWebViewCreated: (controller) async {
                    /// Set cookies
                    final prefs = await SharedPreferences.getInstance();
                    var cookiesNames = prefs.getKeys();
                    for (var element in cookiesNames) {
                      var cookieValue = prefs.getString(element);
                      cookieManager.setCookie(
                          url: uri, name: element, value: cookieValue!);

                    }
                    webViewController = controller;
                  },
                  initialOptions: options,
                  onDownloadStartRequest: (controller, downloadRequest) async {
                    SnackBar snackBar = SnackBar(

                      content: SizedBox(
                          height: Dimensions.height10*20,
                          child: Center(child: Text('Download start', style: TextStyle(fontSize: Dimensions.height10*2),))),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    if (kDebugMode) {
                      print(
                        "_______________________onDownloadStart url: ${downloadRequest.url}");
                    }
                    FileDownloader.downloadFile(url: '${downloadRequest.url}',
                    onDownloadCompleted: (path) {
                      SnackBar snackBar = SnackBar(

                        content: SizedBox(
                            height: Dimensions.height10*20,
                            child: Center(child: Text('File downloaded to $path', style: TextStyle(fontSize: Dimensions.height10*2),))),
                      );

                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      print('____________DOWNLOAD COMPLETED TO: $path');
                    });

                  },
                  onLoadStart:
                      (InAppWebViewController controller, Uri? url) async {

                  },
                  onLoadStop:
                      (InAppWebViewController controller, Uri? url) async {
                    final prefs = await SharedPreferences.getInstance();
                    List<Cookie> cookies =
                        await cookieManager.getCookies(url: url!);
                    cookies.forEach((cookie) async {
                      print(cookie.name + " " + cookie.value);
                      await prefs.setString(cookie.name, cookie.value);
                    });
                  },
                  initialUrlRequest: URLRequest(url: uri),
                )));
  }
}
