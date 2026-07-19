import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../models/player.dart';
import '../models/quest.dart';
import '../models/achievement.dart';


class StorageService {


  // ==========================
  // SAVE GAME
  // ==========================

  static Future<void> saveGame(
    Player player,
    List<Quest> quests,
    List<Achievement> achievements,
  ) async {


    final prefs = await SharedPreferences.getInstance();



    // SAVE PLAYER

    await prefs.setString(
      "player",
      jsonEncode(player.toMap()),
    );



    // SAVE QUEST

    List<Map<String, dynamic>> questData =
        quests.map((q) => q.toMap()).toList();


    await prefs.setString(
      "quests",
      jsonEncode(questData),
    );



    // SAVE ACHIEVEMENT

    List<Map<String, dynamic>> achievementData =
        achievements.map((a) => a.toMap()).toList();


    await prefs.setString(
      "achievements",
      jsonEncode(achievementData),
    );



    print("SAVE GAME SUCCESS");

  }





  // ==========================
  // LOAD PLAYER
  // ==========================


  static Future<Player> loadPlayer() async {


    final prefs = await SharedPreferences.getInstance();


    String? data = prefs.getString("player");

if (data == null) {
  print("NEW PLAYER");
  return Player();
}

return Player.fromMap(
  jsonDecode(data),
);
  }






  // ==========================
  // LOAD QUEST
  // ==========================


  static Future<void> loadQuest(
    List<Quest> quests,
  ) async {


    final prefs = await SharedPreferences.getInstance();


    String? data = prefs.getString("quests");



    if(data == null){

      return;

    }



    List list = jsonDecode(data);



    for(int i = 0;
        i < quests.length && i < list.length;
        i++){

      quests[i].completed =
          list[i]["completed"] ?? false;

    }



    print("LOAD QUEST SUCCESS");

  }






  // ==========================
  // LOAD ACHIEVEMENT
  // ==========================


  static Future<void> loadAchievement(
    List<Achievement> achievements,
  ) async {


    final prefs = await SharedPreferences.getInstance();


    String? data =
        prefs.getString("achievements");



    if(data == null){

      return;

    }



    List list = jsonDecode(data);



    for(int i = 0;
        i < achievements.length && i < list.length;
        i++){


      achievements[i].unlocked =
          list[i]["unlocked"] ?? false;


    }



    print("LOAD ACHIEVEMENT SUCCESS");

  }


}