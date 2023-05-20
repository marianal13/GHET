import 'package:flutter/material.dart';

class FavoritePage extends StatefulWidget{
  const FavoritePage({super.key, required this.title});
  final String title;

  @override
  State<FavoritePage> createState() => _FavoritePageState();

}

class _FavoritePageState extends State<FavoritePage>{
@override
Widget build (BuildContext context){
  return Scaffold(
    body: Column(
      children: const [
        Padding(
          padding: EdgeInsets.fromLTRB(85,20,0,0),
          child: Text('Favorite Meals: ', style: TextStyle(fontSize: 30),),
        ),
    ],)
  );
}
}