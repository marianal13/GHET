import 'package:flutter/material.dart';

class HomePage extends StatefulWidget{
  const HomePage({super.key, required this.title});
  final String title;

  @override
  State<HomePage> createState() => _HomePageState();

}

class _HomePageState extends State<HomePage>{
@override
Widget build (BuildContext context){
  return const Scaffold(
    body: Column(
      children: [
        Padding(
          padding: EdgeInsets.fromLTRB(105,20,0,0),
          child: Text('Home Page:', style: TextStyle(fontSize: 30),),
        ),
    ],)

  );
}
}