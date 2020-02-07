class Passive{

  String name;
  String description;
  String imageFull;

   fromJson(Map<String,dynamic> json){
    this.name = json['name'];
    this.description = json['description'];
    this.imageFull = json['image']['full'];
  }
}