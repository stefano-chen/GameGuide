import 'package:draggable_scrollbar/draggable_scrollbar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:gameguide/services/saveManager.dart';
import 'package:gameguide/widgets/championTile.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Champions extends StatefulWidget {
  @override
  _ChampionsState createState() => _ChampionsState();
}

class _ChampionsState extends State<Champions> {
  List<ChampionTile> champions = List<ChampionTile>();

  ScrollController _controller = ScrollController();

  Future _getChampions() async {
    FirebaseUser user = await FirebaseAuth.instance.currentUser();
    SaveManager.setUid(user.uid);
    http.Response result = await http.get(
        "http://ddragon.leagueoflegends.com/cdn/10.2.1/data/en_US/champion.json");
    if (result.statusCode == 200) {
      Map decode = json.decode(result.body);
      SaveManager.champions = decode;
      decode['data'].forEach((k, v) {
        champions.add(ChampionTile(
          id: v['id'],
          imageFull: v['image']['full'],
          name: v['name'],
          title: v['title'],
        ));
      });
      try {
        setState(() {});
      } catch (e) {}
    }
  }

  @override
  void initState() {
    super.initState();
    _getChampions();
  }

  @override
  Widget build(BuildContext context) {
    return (champions.length > 0)
        ? DraggableScrollbar.rrect(
            controller: _controller,
            child: ListView(
              controller: _controller,
              children: champions,
            ),
            backgroundColor: Colors.grey[400],
            heightScrollThumb: 40.0,
          )
        : SpinKitCircle(
            color: Colors.black,
          );
  }
}
