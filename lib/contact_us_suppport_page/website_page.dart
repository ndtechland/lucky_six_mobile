import 'package:flutter/material.dart';
import 'package:game_app/constantt/responsive_text_color.dart';
import 'package:url_launcher/url_launcher.dart';
//import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class WebViewHirejobwebsite extends StatefulWidget {
  const WebViewHirejobwebsite({Key? key}) : super(key: key);

  @override
  State<WebViewHirejobwebsite> createState() => _WebViewHirejobwebsiteState();
}

class _WebViewHirejobwebsiteState extends State<WebViewHirejobwebsite> {
  double _progress = 0;
  //late InAppWebViewController inAppWebViewController;
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.pop(context);

        // var isLastPage = await inAppWebViewController.canGoBack();
        // if (isLastPage) {
        //   inAppWebViewController.goBack();
        //   return false;
        // }

        return true;
      },
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            elevation: 0,
            title: const Text('Luckysix'),
            backgroundColor: appColor,
            centerTitle: true,
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // InAppWebView(
              //   initialUrlRequest:
              //       URLRequest(url: Uri.parse("http://pswellness.in")),
              //   onWebViewCreated: (InAppWebViewController controller) {
              //     inAppWebViewController = controller;
              //   },
              //   onProgressChanged:
              //       (InAppWebViewController controller, int progress) {
              //     setState(() {
              //       _progress = progress / 100;
              //     });
              //   },
              // ),

              ElevatedButton(
                onPressed: _launchURL3,
                child: Text('Luckysix'),
              ),
              _progress < 1
                  ? Container(
                      child: LinearProgressIndicator(
                        value: _progress,
                      ),
                    )
                  : SizedBox()
            ],
          ),
        ),
      ),
    );
  }
}

void _launchURL3() async {
  const url = 'https://luckysix.com';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
