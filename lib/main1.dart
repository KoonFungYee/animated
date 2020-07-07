import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  Animation animation;
  AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController =
        AnimationController(duration: Duration(seconds: 10), vsync: this);

    animation = IntTween(begin: 10, end: 0).animate(animationController);

    animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: animationController,
        builder: (BuildContext context, Widget child) {
          return new Scaffold(
              body: new Center(
                  child: Container(
                      child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('Loading...'),
              Text(
                animation.value.toString(),
                style: TextStyle(fontSize: 52.0),
              )
            ],
          ))));
        });
  }
}
