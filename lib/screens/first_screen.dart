import 'package:animation_2/screens/screen_animation_helper.dart';
import 'package:animation_2/screens/second_screen.dart';
import 'package:flutter/material.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({ Key? key }) : super(key: key);

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> with TickerProviderStateMixin {

  late AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 20,),
      ) .. repeat();

    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("First Animation"),
        centerTitle: true,
      ),
      body: Container(
        color: Colors.black,
        child: Column(
        children:[
          RotationTransition(
            turns: _controller,
            alignment: Alignment.center,
            child:Image.asset('images/earth.webp')),
          const SizedBox(height: 20.0,),
          ElevatedButton(
            onPressed: () {
              Navigator.push(context, SliderRoute(widget: const SecondScreen()));
            },
            child: const Text('Next Animation'),
            )
        ]
        
      ),),
    );
  }
}