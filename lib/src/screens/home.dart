import 'package:flutter/material.dart';
import '../widgets/cat.dart';

class Home extends StatefulWidget {
  HomeState createState() => HomeState();
}

//Note: uses TickerProviderStateMixin to provide handle into our class
// for syncing animations
class HomeState extends State<Home> with TickerProviderStateMixin {
  Animation<double> catAnimation;
  AnimationController catController;

  //lifecycle method
  initState() {
    //call super class initState method
    super.initState();

    //initialize catController - this controlls the animation timing
    catController = AnimationController(
      duration: Duration(seconds: 2),
      vsync: this,
    );
  }

  Widget build(context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Animation!'),
      ),
      body: buildAnimation(),
    );
  }

  Widget buildAnimation() {
    return Cat();
  }
}
