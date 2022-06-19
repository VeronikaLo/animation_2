import 'package:flutter/material.dart';

class ThirdScreen extends StatelessWidget {
  const ThirdScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Venus'),
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          color: Colors.black,
          height: double.infinity,
          width: double.infinity,
          child: Hero(
            tag: 'venus',
            child: Image.asset('images/venus3.jpg', ),
          ),
        ),
      ),
    );
  }
}