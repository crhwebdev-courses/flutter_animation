import 'package:flutter/material.dart';
import '../widgets/cat.dart';
import 'dart:math';

class Home extends StatefulWidget {
  HomeState createState() => HomeState();
}

//Note: uses TickerProviderStateMixin to provide handle into our class
// for syncing animations
class HomeState extends State<Home> with TickerProviderStateMixin {
  Animation<double> catAnimation;
  AnimationController catController;
  Animation<double> boxAnimation;
  AnimationController boxController;

  //lifecycle method
  initState() {
    //call super class initState method
    super.initState();

    //initialize catController - this controlls the animation timing
    catController = AnimationController(
      duration: Duration(milliseconds: 200),
      vsync: this,
    );

    //initialize catAnimation with a Tween animation from 0 pixels to 100 pixels
    catAnimation = Tween(begin: -35.0, end: -80.0).animate(
      CurvedAnimation(
        parent: catController,
        curve: Curves.easeIn,
      ),
    );

    // initialize box animation controler and animation
    boxController = AnimationController(
      duration: Duration(seconds: 2),
      vsync: this,
    );

    boxAnimation = Tween(
      begin: 0.0,
      end: 3.14,
    ).animate(
      CurvedAnimation(
        parent: boxController,
        curve: Curves.linear,
      ),
    );
  }

  onTap() {
    if (catController.status == AnimationStatus.completed) {
      catController.reverse();
    } else if (catController.status == AnimationStatus.dismissed) {
      catController.forward();
    }
  }

  Widget build(context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Animation!'),
      ),
      body: GestureDetector(
        child: Center(
          child: Stack(
            overflow: Overflow.visible,
            children: [
              buildCatAnimation(),
              buildBox(),
              buildLeftFlap(),
            ],
          ),
        ),
        onTap: onTap,
      ),
    );
  }

  Widget buildCatAnimation() {
    return AnimatedBuilder(
      animation: catAnimation,
      builder: (context, child) {
        return Positioned(
          child: child,
          top: catAnimation.value,
          right: 0.0,
          left: 0.0,
        );
      },
      child: Cat(),
    );
  }

  Widget buildBox() {
    return Container(
      height: 200.0,
      width: 200.0,
      color: Colors.brown,
    );
  }

  Widget buildLeftFlap() {
    return Positioned(
      left: 3.0,
      child: Transform.rotate(
        alignment: Alignment.topLeft,
        angle: (pi * 0.6),
        child: Container(
          height: 10.0,
          width: 125.0,
          color: Colors.brown,
        ),
      ),
    );
  }
}
