import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../models/player.dart';
import '../models/quest.dart';

class StorageService {

  // ==========================
  // SAVE GAME
  // ==========================

  static Future<void> saveGame(
    Player player,
    List<Quest> quests,
  ) async {

    final prefs = await SharedPreferences.getInstance();

    // Player
    await prefs.setString(
      "player",
      jsonEncode(player.toMap()),
    );

    // Quest
    List<Map<String, dynamic>> questList =
        quests.map((q) => q.toMap()).toList();

    await prefs.setString(
      "quests",
      jsonEncode(questList),
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

    if (data == null) return;

    List list = jsonDecode(data);

    for (int i = 0; i < quests.length && i < list.length; i++) {

      quests[i].completed = list[i]["completed"] ?? false;

    }

    print("LOAD QUEST SUCCESS");
  }

}