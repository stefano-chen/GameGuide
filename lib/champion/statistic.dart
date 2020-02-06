class Stats {
  dynamic hp; //hp
  dynamic hplevel; //hp per level
  dynamic mp; //mana
  dynamic mplevel; //mana per level
  dynamic movespeed; //velocità di movimento
  dynamic arm; //armatura
  dynamic armlevel; //Armor per Level
  dynamic spellblock; //Resistenza Magica
  dynamic spellblocklevel; //Resistenza Magica Per Level
  dynamic attackrange;
  dynamic hpregen;
  dynamic hpregenlevel;
  dynamic mpregen;
  dynamic mpregenlevel;
  dynamic crit;
  dynamic critlevel;
  dynamic attackdamage; //Attacco fisico
  dynamic attackdamagelevel;
  dynamic attackspeed;
  dynamic attackspeedlevel;

  Stats(
      {this.hp,this.hplevel,this.mp,this.mplevel,
      this.movespeed,this.arm,this.armlevel,
      this.spellblock,this.spellblocklevel,this.attackrange,
      this.hpregen,this.hpregenlevel,this.crit,this.critlevel,
      this.attackdamage,this.attackdamagelevel,
      this.attackspeed,this.attackspeedlevel,this.mpregen,this.mpregenlevel}
  );

  Stats fromJson(Map<String,dynamic> json){
      this.hp = json['hp'];
      this.hplevel= json['hpperlevel'];
      this.mp= json['mp'];
      this.mplevel= json['mpperlevel'];
      this.movespeed= json['movespeed'];
      this.arm = json['armor'];
      this.armlevel= json['armorperlevel'];
      this.spellblock=json['spellblock'];
      this.spellblocklevel=json['spellblockperlevel'];
      this.attackrange= json['attackrange'];
      this.hpregen=json['hpregen'];
      this.hpregenlevel= json['hpregenperlevel'];
      this.mpregen= json['mpregen'];
      this.mpregenlevel= json['mpregenperlevel'];
      this.crit= json['crit'];
      this.critlevel= json['critperlevel'];
      this.attackdamage= json['attackdamage'];
      this.attackdamagelevel= json['attackdamageperlevel'];
      this.attackspeed= json['attackspeed'];
      this.attackspeedlevel= json['attackspeedperlevel'];
      return this;
  }
}
