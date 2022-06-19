import 'package:animation_2/screens/screen_animation_helper.dart';
import 'package:animation_2/screens/third_screen.dart';
import 'package:flutter/material.dart';

class SecondScreen extends StatefulWidget {
  const SecondScreen({ Key? key }) : super(key: key);

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> with TickerProviderStateMixin {

  late  AnimationController _controller;   //controller
  late  Animation<double> _animationCard;  // animation for a dropdown Card
  late  Animation<double> _rotation;       // animation for an icon rotation

  bool show = false;   // dropdown Card is shown?

  @override
  void initState() {
    
    // controller initialization 
    _controller = AnimationController(
        vsync: this,
        duration: const Duration(seconds: 1)
    );

    // animation initialization
    _animationCard = Tween(begin: 0.0, end: 1.0).animate(_controller);
    _rotation = Tween(begin: 0.0, end: -0.5).animate(_controller);  //0.5 = 0.5 of a circle =180 grad

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
        title: const Text("Hero Animation"),
        centerTitle: true,),
      body: Container(
        padding: const EdgeInsets.only(top: 30, left: 15,right: 15),

        child:Column(
          children: [
            Card(
                  elevation: 5,
                  shadowColor: const Color(0xFFFF7F50),
                  child: SizedBox(
                    height: 200,
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Row(
                        children: [
                          
                          Hero(
                                tag: 'venus',
                                child: Image.asset('images/venus.jpg', scale: 2,)
                            ),
                          const SizedBox(width: 60.0,),
                        
                          ElevatedButton(
                            onPressed: () {
                              Navigator.push(context, SliderRoute(widget: const ThirdScreen()));
                            },
                            child: const Text('More Venus'),
                          )
                        ],
                      ),
                    ),
                  ),
                ),

              const  SizedBox( height: 30,),

              // Dropdown Card
              Card(
                elevation: 5,
                shadowColor: const Color(0xFFFF7F50),
                child: ListTile(
                  title: const Text("Wow-Facts about Venus", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18 ),),
                  trailing: RotationTransition(
                    turns: _rotation,
                    child: IconButton(
                      icon: const Icon(Icons.arrow_downward, size: 36, color: Colors.teal,), 
                      onPressed:(){
                        if(show == false){
                          _controller.forward();
                          show = true;
                          
                        } else if(show==true){
                          _controller.reverse();
                          show = false;
                          
                        }
                      },
                    ),
                  ),
                  ),
              ),
              const SizedBox(height: 10,),
              SizeTransition(
                sizeFactor: _animationCard,
                axis: Axis.vertical,
                axisAlignment: -1,
                child:  Card(
                  elevation: 5,
                  shadowColor: const Color(0xFFFF7F50),
                  child: SizedBox(
                    height: 180,
                    width: double.maxFinite,
                    child: ListTile(
                      title: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: const[
                          Text("1. A day on Venus is longer than a year."), 
                          Text("2. Venus is hotter than Mercury – despite being further away from the Sun."), 
                          Text("3. Venus is the second brightest natural object in the night sky after the Moon")],),
                    ),
                  ),
                ) ,
                )
          ],
        ),),
    );
  }
}