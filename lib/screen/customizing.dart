import 'package:chat_app1/main.dart';
import 'package:chat_app1/screen/register.dart';
import 'package:flutter/material.dart';

import 'MainPage.dart';


class Custom extends StatelessWidget {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Find Me',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        // primarySwatch: Colors.green,
      ),
      home: CustomPage(),
    );
  }
}

class CustomPage extends StatefulWidget {

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  // final String title;

  @override
  State<CustomPage> createState() => _CustomPageState();
}

class _CustomPageState extends State<CustomPage> {
  Color _counter = Colors.black54;
  BoxShape Shape = BoxShape.rectangle;
  double TopMargin = 50;
  double shapeHeight = 220;
  bool IsShapeVisible = true;
  bool IsColorVisible = false;
  bool IsFontSizeVisible = false;
  double TextPadding = 75;
  double FontSize = 60;
  double TextSize = 2;

  // void _incrementCounter() {
  //   setState(() {
  //     // This call to setState tells the Flutter framework that something has
  //     // changed in this State, which causes it to rerun the build method below
  //     // so that the display can reflect the updated values. If we changed
  //     // _counter without calling setState(), then the build method would not be
  //     // called again, and so nothing would appear to happen.
  //     _counter++;
  //   });
  // }

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
        title: Text('Modify sticker'),
        backgroundColor: Colors.lightGreen,
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MainPage()
                    )
                );
                // saveText();
              },
              icon: Icon(Icons.check)
          )
        ],
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Container(
              color: Colors.black12,
              width: 500,
              height: 330,
              child: Center(
                child: Column(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(top: TopMargin),
                      child: Text(registerId, textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: FontSize, fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),),padding: EdgeInsets.only(top:TextPadding),
                      width: 220,
                      height: shapeHeight,
                      decoration: BoxDecoration(
                        color: _counter,
                        shape: Shape,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              color: Colors.black38,
              height: 65,
              child: Row(
                children: [
                  IconButton(onPressed: ()=> setState(() {
                    IsShapeVisible= true;
                    IsColorVisible= false;
                    IsFontSizeVisible = false;
                  }), icon: Icon(Icons.cached_outlined),color:Colors.white,iconSize: 45,padding: EdgeInsets.only(left:80)),
                  IconButton(onPressed: ()=> setState(() {
                    IsShapeVisible= false;
                    IsColorVisible= true;
                    IsFontSizeVisible = false;
                  }), icon: Icon(Icons.palette),iconSize: 45,color:Colors.amber,padding: EdgeInsets.only(left:70)),
                  IconButton(onPressed: ()=> setState(() {
                    IsShapeVisible= false;
                    IsColorVisible= false;
                    IsFontSizeVisible = true;
                  }), icon: Icon(Icons.one_x_mobiledata_sharp),color:Colors.white,iconSize: 45,padding: EdgeInsets.only(left:70))
                ],
              ),
            ),
            Container(
              child: Center(
                  child: Row(children: <Widget>[
                    Visibility(
                      visible: IsShapeVisible,
                      child: Row(
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: 30, top: 40),
                            width: 100,
                            height: 100,
                            child: ElevatedButton(
                              child: null,
                              onPressed: () => setState(() {
                                shapeHeight = 220;
                                TopMargin = 50;
                                Shape = BoxShape.rectangle;
                                TextPadding = 75;
                              }),
                              style: ElevatedButton.styleFrom(
                                primary: Colors.black54,
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 30, top: 40),
                            width: 100,
                            height: 100,
                            child: ElevatedButton(
                              child: null,
                              onPressed: () => setState(() {
                                shapeHeight = 220;
                                TopMargin = 50;
                                Shape = BoxShape.circle;
                                TextPadding = 75;
                              }),
                              style: ElevatedButton.styleFrom(
                                primary: Colors.black54,
                                shape: CircleBorder(side: BorderSide(width: 0)),
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 30, top: 40),
                            width: 100,
                            height: 60,
                            child: ElevatedButton(
                              child: null,
                              onPressed: () => setState(() {
                                shapeHeight = 70;
                                TopMargin = 140;
                                Shape = BoxShape.rectangle;
                                TextPadding = TextSize * 3;
                              }),
                              style: ElevatedButton.styleFrom(
                                primary: Colors.black54,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Visibility(
                      visible: IsColorVisible,
                      child: Row(
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: 30, top: 40),
                            width: 100,
                            height: 100,
                            child: IconButton(
                              onPressed: () => setState(() {
                                _counter = Colors.red;
                              }),
                              icon: Image.asset('assets/red.png'
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 30, top: 40),
                            width: 100,
                            height: 100,
                            child: IconButton(
                              onPressed: () => setState(() {
                                _counter = Colors.blue;
                              }),
                              icon: Image.asset('assets/blue.png'
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 30, top: 40),
                            width: 100,
                            height: 100,
                            child: IconButton(
                              onPressed: () => setState(() {
                                _counter = Colors.greenAccent;
                              }),
                              icon: Image.asset('assets/green.png'),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Visibility(
                      visible: IsFontSizeVisible,
                      child: Row(
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: 30, top: 40),
                            width: 100,
                            height: 100,
                            child: TextButton(
                              onPressed: () => setState(() {
                                TextPadding = 75;
                                if(shapeHeight > 70) {
                                  TextPadding = 75;
                                }
                                else
                                {
                                  TextSize = 0;
                                  TextPadding = TextSize * 3;
                                }
                                FontSize = 60;
                              }),
                              child: Text("크게", textScaleFactor: 3, style: TextStyle(fontSize: 15, color: Colors.grey[700])),
                            ),
                          ),

                          Container(
                            margin: EdgeInsets.only(left: 30, top: 40),
                            width: 100,
                            height: 100,
                            child: TextButton(
                              onPressed: () => setState(() {
                                TextPadding = 75;
                                if(shapeHeight > 70) {
                                  TextPadding = 75;
                                }
                                else
                                {
                                  TextSize = 2;
                                  TextPadding = TextSize * 3;
                                }
                                FontSize = 50;
                              }),
                              child: Text("표준", textScaleFactor: 3, style: TextStyle(fontSize: 13, color: Colors.grey[700])),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 30, top: 40),
                            width: 100,
                            height: 100,
                            child: TextButton(
                              onPressed: () => setState(() {
                                if(shapeHeight > 70) {
                                  TextPadding = 85;
                                }
                                else
                                {
                                  TextSize = 3;
                                  TextPadding = TextSize * 3;
                                }
                                FontSize = 40;
                              }),
                              child: Text("작게", textScaleFactor: 3, style: TextStyle(fontSize: 10, color: Colors.grey[700])),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ])),
            ), // const Text(

            //   'You have pushed the button this many times:',
            // ),
            // Text(
            //   '$_counter',
            //   style: Theme.of(context).textTheme.headlineMedium,
            // ),
          ],
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
