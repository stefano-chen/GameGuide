
import 'package:gameguide/champion/passive.dart';
import 'package:gameguide/champion/spell.dart';
import 'package:gameguide/champion/statistic.dart';

class Champion{

  String id = '';
  String name = '';
  String title = '';
  String imageFull = '';
  String imageSprite = '';
  List<int> skins = List<int>();
  String description = '';
  List<String> type = List<String>();
  Stats stats = Stats();
  List<Spell> spells = List<Spell>();
  Passive passive = Passive();

  void fromJson(Map<String,dynamic> json){
    this.id = json['id'];
    this.name = json['name'];
    this.title = json['title'];
    this.imageFull = json['image']['full'];
    this.imageSprite = json['image']['sprite'];
    this.description = json['lore'];
    this.stats.fromJson(json['stats']);
    json['skins'].forEach((i){
      skins.add(i['num']);
    });
    json['spells'].forEach((index){
      spells.add(Spell().fromJson(index));
    });
    passive.fromJson(json['passive']);
  }

}