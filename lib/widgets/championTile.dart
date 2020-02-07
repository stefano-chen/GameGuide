import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gameguide/home/pages/championPage.dart';

class ChampionTile extends StatelessWidget {
  final String imageFull;
  final String name;
  final String title;
  final String id;


  ChampionTile({this.imageFull, this.name, this.title,this.id});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      ListTile(
        title: Text(name),
        subtitle: Text(title),
        leading: ClipRRect(
            borderRadius: BorderRadius.circular(16.0),
            child: CachedNetworkImage(
              imageUrl: "http://ddragon.leagueoflegends.com/cdn/10.2.1/img/champion/$imageFull",
              placeholder: (context,url) => CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation(Colors.black),
              ),
            )),
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ChampionPage(
                        id: id,
                      )));
        },
      ),
      Divider(
        height: 0.1,
        color: Colors.grey,
      )
    ]);
  }
}
