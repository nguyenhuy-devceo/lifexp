class Quest {

  String title;
  int xpReward;
  bool completed;


  Quest({

    required this.title,
    required this.xpReward,
    this.completed = false,

  });



  Map<String, dynamic> toMap(){

    return {

      "title": title,

      "xpReward": xpReward,

      "completed": completed,

    };

  }



  factory Quest.fromMap(Map data){

    return Quest(

      title: data["title"] ?? "",

      xpReward: data["xpReward"] ?? 0,

      completed: data["completed"] ?? false,

    );

  }


}