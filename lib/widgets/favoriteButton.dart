import 'package:flutter/material.dart';

class FavoriteButton extends StatefulWidget {
  @override
  _FavoriteButtonState createState() => _FavoriteButtonState();
}

class _FavoriteButtonState extends State<FavoriteButton> {

  bool favorite = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        favorite = !favorite;
      },
      child: Icon((!favorite) ? Icons.favorite_border : Icons.favorite),
    );
  }
}