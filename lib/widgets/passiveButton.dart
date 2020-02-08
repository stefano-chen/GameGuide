import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:gameguide/champion/passive.dart';

class PassiveButton extends StatelessWidget {
  final Passive passive;
  PassiveButton(this.passive);

  void _showDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (cont) {
          return AlertDialog(
              title: Text(
                passive.name,
                style: TextStyle(
                  fontFamily: 'Monteserrat',
                  color: Colors.orange[400],
                ),
              ),
              content: SingleChildScrollView(
                child: Text(
                  passive.description,
                  style: TextStyle(
                    fontFamily: 'Monteserrat',
                  ),
                ),
              ),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0)));
        });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => _showDialog(context),
        child: CachedNetworkImage(
          height: 50.0,
          width: 50.0,
          imageUrl:
              'http://ddragon.leagueoflegends.com/cdn/10.3.1/img/passive/${passive.imageFull}',
          placeholder: (context, url) => SpinKitCircle(
            color: Colors.black,
          ),
        ));
  }
}
