class Passive{

  String name;
  String description;
  String imageFull;

   fromJson(Map<String,dynamic> json){
    this.name = json['name'];
    this.description = json['description']
    .replaceAll(RegExp(r'<br>'), '\n').replaceAll(RegExp(r"<font color='.......'>"),'').replaceAll(RegExp(r'</font>'),'')
    .replaceAll(RegExp(r'<physicalDamage>'),'').replaceAll(RegExp(r'</physicalDamage>'),'');
    this.imageFull = json['image']['full'];
  }
}