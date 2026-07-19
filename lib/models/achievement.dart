class Achievement {

  String title;
  String description;
  bool unlocked;


  Achievement({

    required this.title,

    required this.description,

    this.unlocked = false,

  });



  Map<String, dynamic> toMap(){

    return {

      "title": title,

      "description": description,

      "unlocked": unlocked,

    };

  }



  factory Achievement.fromMap(Map data){

    return Achievement(

      title: data["title"] ?? "",

      description: data["description"] ?? "",

      unlocked: data["unlocked"] ?? false,

    );

  }


}