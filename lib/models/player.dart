class Player {

  int level;
  int xp;
  int maxXp;
  int hp;
  int coin;


  Player({

    this.level = 1,
    this.xp = 0,
    this.maxXp = 100,
    this.hp = 100,
    this.coin = 0,

  });



  Map<String, dynamic> toMap() {

    return {

      "level": level,
      "xp": xp,
      "maxXp": maxXp,
      "hp": hp,
      "coin": coin,

    };

  }



  factory Player.fromMap(Map data) {

    return Player(

      level: data["level"],
      xp: data["xp"],
      maxXp: data["maxXp"],
      hp: data["hp"],
      coin: data["coin"],

    );

  }

}