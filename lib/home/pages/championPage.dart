import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:gameguide/champion/champion.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ChampionPage extends StatefulWidget {
  final String name;
  ChampionPage({this.name});

  @override
  _ChampionPageState createState() => _ChampionPageState();
}

class _ChampionPageState extends State<ChampionPage> {
  Champion champion = Champion();

  Future _getChampionInfo() async {
    http.Response result = await http.get(
        "http://ddragon.leagueoflegends.com/cdn/10.2.1/data/en_US/champion/${widget.name}.json");
    if (result.statusCode == 200) {
      Map decode = json.decode(result.body);
      champion.fromJson(decode['data'][widget.name]);
      setState(() {});
    }
  }

  @override
  void initState() {
    super.initState();
    _getChampionInfo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:SafeArea(
        child: CarouselSlider(
          items: <Widget>[
            Icon(Icons.fiber_pin),
            Icon(Icons.fiber_smart_record),
          ],
          autoPlay: true,
          autoPlayInterval: Duration(seconds:2),
        )
      ),
    );
  }
}
