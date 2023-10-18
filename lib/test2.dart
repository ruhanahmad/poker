import 'dart:math';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:screenshot/screenshot.dart';
// import 'package:webview_flutter/webview_flutter.dart';
// import 'package:image_gallery_saver/image_gallery_saver.dart';


class MyHomePageSreen extends StatefulWidget {


  @override
  _MyHomePageSreenState createState() => _MyHomePageSreenState();
}

class _MyHomePageSreenState extends State<MyHomePageSreen> {
  //Create an instance of ScreenshotController
  ScreenshotController screenshotController = ScreenshotController();


  Uint8List? _imageFile;

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text("widget.title"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Screenshot(
              controller: screenshotController,
              child: Container(
                  padding: const EdgeInsets.all(30.0),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.blueAccent, width: 5.0),
                    color: Colors.amberAccent,
                  ),
                  child: Stack(
                    children: [
                      Image.asset(
                        'asset/images/pokercalculator.png',
                      ),
                      Text("This widget will be captured as an image"),
                    ],
                  )),
            ),
            SizedBox(
              height: 25,
            ),
            ElevatedButton(
              child: Text(
                'Capture Above Widget',
              ),
              onPressed: () {
                screenshotController
                    .capture(delay: Duration(milliseconds: 10))
                    .then((capturedImage) async {
                setState(() {
                   _imageFile = capturedImage; 
                });
                 
  ShowCapturedWidget(context,  _imageFile!);
                }).catchError((onError) {
                  print(onError);
                });
              },
            ),
            ElevatedButton(
              child: Text(
                'Capture An Invisible Widget',
              ),
              onPressed: () {
                var container = Container(
                    padding: const EdgeInsets.all(30.0),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.blueAccent, width: 5.0),
                      color: Colors.redAccent,
                    ),
                    child: Stack(
                      children: [
                        Image.asset(
                          'assets/images/flutter.png',
                        ),
                        Text(
                          "This is an invisible widget",
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                      ],
                    ));
                screenshotController
                    .captureFromWidget(
                        InheritedTheme.captureAll(
                            context, Material(child: container)),
                        delay: Duration(seconds: 1))
                    .then((capturedImage) {
                  ShowCapturedWidget(context, capturedImage);
                });
              },
            ),
            ElevatedButton(
              child: Text(
                'Capture A dynamic Sized Widget',
              ),
              onPressed: () {
                var randomItemCount = Random().nextInt(100);
                var container = Builder(builder: (context) {
                  return Container(
                      // width: size2.width,
                      padding: const EdgeInsets.all(30.0),
                      decoration: BoxDecoration(
                        border:
                            Border.all(color: Colors.blueAccent, width: 5.0),
                        color: Colors.redAccent,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        // crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          for (int i = 0; i < randomItemCount; i++)
                            Text("Tile Index $i"),
                        ],
                      ));
                });
                screenshotController
                    .captureFromLongWidget(
                  InheritedTheme.captureAll(
                      context, Material(child: container)),
                  delay: Duration(milliseconds: 100),
                  context: context,
                )
                    .then((capturedImage) {
                  ShowCapturedWidget(context, capturedImage);
                });
              },
            ),
          ],
        ),
      ),
    );
  }

  Future<dynamic> ShowCapturedWidget(
      BuildContext context, Uint8List capturedImage) {
    return showDialog(
      useSafeArea: false,
      context: context,
      builder: (context) => Scaffold(
        appBar: AppBar(
          title: Text("Captured widget screenshot"),
        ),
        body: Center(child: Image.memory(capturedImage)),
      ),
    );
  }

  // _saved(File image) async {
  //   // final result = await ImageGallerySaver.save(image.readAsBytesSync());
  //   print("File Saved to Gallery");
  // }
}