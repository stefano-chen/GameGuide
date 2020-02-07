class Spell {

  String id;
  String name;
  String description;
  String cooldown;
  String cost;
  String range;
  String imageFull;

  Spell fromJson(Map<String,dynamic> json){
    this.id = json['id'];
    this.name = json['name'];
    this.description = json['description'];
    this.cooldown = json['cooldownBurn'];
    this.cost = json['costBurn'];
    this.range = json['rangeBurn'];
    this.imageFull = json['image']['full'];
    return this;
  }
}