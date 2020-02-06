import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gameguide/home/pages/championPage.dart';

class ChampionTile extends StatelessWidget {
  final String imageFull;
  final String name;
  final String title;


  /*
  Image.network(
              'http://ddragon.leagueoflegends.com/cdn/10.2.1/img/champion/$imageFull',
              width: 40.0,
              height: 40.0,
            )
            */

  ChampionTile({this.imageFull, this.name, this.title});

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
                valueColor: AlwaysStoppedAnimation(Colors.blue),
              ),
            )),
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ChampionPage(
                        name: name,
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
