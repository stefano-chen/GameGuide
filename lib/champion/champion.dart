
import 'package:gameguide/champion/statistic.dart';

class Champion{

  String name;
  String title;
  String imageFull;
  String imageSprite;
  List<int> skins = List<int>();
  String description;
  List<String> type = List<String>(); //TODO
  Stats stats = Stats();
  //TODO: continua

  void fromJson(Map<String,dynamic> json){
    this.name = json['name'];
    this.title = json['title'];
    this.imageFull = json['image']['full'];
    this.imageSprite = json['image']['sprite'];
    this.description = json['lore'];
    this.stats.fromJson(json['stats']);
    json['skins'].forEach((i){
      skins.add(i['num']);
    });
  }

}