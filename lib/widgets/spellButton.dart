import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:gameguide/champion/spell.dart';

class SpellButton extends StatelessWidget {
  final Spell spell;
  SpellButton(this.spell);

  void _showDialog(BuildContext context){
    showDialog(context: context,
      builder: (cont){
        return AlertDialog(
          title: Text(spell.name,style: TextStyle(
            fontFamily: 'Monteserrat',
            color: Colors.orange[400],
          ),),
          content: SingleChildScrollView(
                      child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text("Cooldown(seconds): ${spell.cooldown}"),
                Text("Cost: ${spell.cost}"),
                Text("Range: ${spell.range}"),
                SizedBox(height:30.0),
                Text(spell.description,style: TextStyle(
                  fontFamily: 'Monteserrat',
                ),),
              ],
            ),
          ),
          shape:RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0)
          )
        );
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _showDialog(context),
        child: CachedNetworkImage(
      height: 50.0,
      width: 50.0,
      imageUrl:
          'http://ddragon.leagueoflegends.com/cdn/10.3.1/img/spell/${spell.imageFull}',
      placeholder: (context, url) => SpinKitCircle(
        color: Colors.black,
      ),
    ));
  }
}
