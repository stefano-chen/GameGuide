import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:gameguide/champion/champion.dart';
import 'package:gameguide/services/saveManager.dart';
import 'package:gameguide/widgets/championSkin.dart';
import 'package:gameguide/widgets/passiveButton.dart';
import 'package:gameguide/widgets/spellButton.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class ChampionPage extends StatefulWidget {
  final String id;
  ChampionPage({this.id});

  @override
  _ChampionPageState createState() => _ChampionPageState();
}

class _ChampionPageState extends State<ChampionPage> {
  List<ChampionSkin> skins = List<ChampionSkin>();
  Champion champion = Champion();
  bool loading = true;
  bool favorite = false;

  void _getSkins() {
    champion.skins.forEach((index) {
      skins.add(ChampionSkin(
          'http://ddragon.leagueoflegends.com/cdn/img/champion/splash/${champion.id}_$index.jpg'));
    });
  }

  Future _getChampionInfo() async {
    http.Response result = await http.get(
        "http://ddragon.leagueoflegends.com/cdn/10.2.1/data/en_US/champion/${widget.id}.json");
    if (result.statusCode == 200) {
      Map decode = json.decode(result.body);
      champion.fromJson(decode['data'][widget.id]);
      setState(() {
        _getSkins();
        loading = false;
        favorite = SaveManager.favorites.contains(champion.id);
      });
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
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(champion.name),
        actions: <Widget>[
          IconButton(
              icon: Icon((favorite) ? Icons.favorite : Icons.favorite_border),
              onPressed: () async{
                favorite = !favorite;
                  if(favorite)
                    await SaveManager.addFavorite(champion.id);
                  else
                    await SaveManager.removeFavorite(champion.id);
                setState((){}); 
              })
        ],
      ),
      body: (!loading)
          ? SingleChildScrollView(
                      child: Column(
                children: <Widget>[
                  CarouselSlider(
                    items: skins,
                    pauseAutoPlayOnTouch: Duration(seconds: 4),
                    autoPlay: true,
                    autoPlayInterval: Duration(seconds: 3),
                  ),
                  Text('Spells',style:TextStyle(fontFamily: 'Montaserrat',fontSize:30)),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children:[
                      PassiveButton(champion.passive),
                      SpellButton(champion.spells[0]),
                      SpellButton(champion.spells[1]),
                      SpellButton(champion.spells[2]),
                      SpellButton(champion.spells[3]),
                    ],
                  ),
                  SizedBox(height: 10),
                  Text("Description",style:TextStyle(fontFamily: 'Montaserrat',fontSize:30)),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Text(champion.description,style:TextStyle(fontFamily: 'Montaserrat')),
                  ),
                ],
              ),
          )
          : SpinKitCircle(
              color: Colors.black,
            ),
    );
  }
}
