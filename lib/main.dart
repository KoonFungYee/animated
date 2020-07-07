import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Animate(),
    );
  }
}

class Animate extends StatefulWidget {
  Animate({Key key}) : super(key: key);

  @override
  _AnimateState createState() => _AnimateState();
}

class _AnimateState extends State<Animate> with SingleTickerProviderStateMixin {
  Animation animation;
  // , transformationAnim;
  AnimationController animationController;

  @override
  void initState() {
    animationController =
        AnimationController(duration: Duration(milliseconds: 500), vsync: this);
    animation = Tween(begin: 0, end: -0.15).animate(
        CurvedAnimation(parent: animationController, curve: Curves.ease));
    // transformationAnim = BorderRadiusTween(
    //         begin: BorderRadius.circular(150), end: BorderRadius.circular(0))
    //     .animate(
    //         CurvedAnimation(parent: animationController, curve: Curves.ease));
    // animationController.forward();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text('Material App Bar'),
      ),
      body: AnimatedBuilder(
          animation: animationController,
          builder: (BuildContext context, Widget child) {
            return Container(
              child: Center(
                child: Stack(
                  children: <Widget>[
                    Center(
                      child: Container(
                        padding: EdgeInsets.all(10),
                        width: 350,
                        height: 200,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15)),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RaisedButton(
                                child: Text('Buy'),
                                elevation: 7,
                                color: Colors.blue,
                                textColor: Colors.white,
                                onPressed: () {}),
                            RaisedButton(
                                child: Text('Buy'),
                                elevation: 7,
                                color: Colors.blue,
                                textColor: Colors.white,
                                onPressed: () {})
                          ],
                        ),
                      ),
                    ),
                    Center(
                      child: GestureDetector(
                        child: Container(
                          alignment: Alignment.bottomCenter,
                          width: 350,
                          height: 200,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              image: DecorationImage(
                                  image: AssetImage("assets/images/img1.jpg"),
                                  fit: BoxFit.cover)),
                          transform: Matrix4.translationValues(
                              0, animation.value * width, 0),
                        ),
                        onTap: () {
                          animationController.forward();
                        },
                        onDoubleTap: () {
                          animationController.reverse();
                        },
                      ),
                    )
                  ],
                ),
              ),
            );
          }),
    );
  }
}
