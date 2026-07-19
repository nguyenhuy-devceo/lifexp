import 'package:flutter/material.dart';

import '../models/player.dart';
import '../models/quest.dart';
import '../models/achievement.dart';

import '../widgets/player_card.dart';
import '../widgets/quest_card.dart';
import '../widgets/achievement_card.dart';

import '../services/storage_service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Player player = Player();

  bool loading = true;

  int completedQuest = 0;

  final List<Quest> quests = [
    Quest(title: "Học Flutter 1 giờ", xpReward: 20),
    Quest(title: "Chạy bộ 30 phút", xpReward: 15),
    Quest(title: "Uống đủ nước", xpReward: 5),
    Quest(title: "Học Toán", xpReward: 30),
    Quest(title: "Học Vật Lý", xpReward: 25),
    Quest(title: "Học Hóa", xpReward: 25),
    Quest(title: "Tập Gym", xpReward: 20),
    Quest(title: "Đọc sách", xpReward: 10),
    Quest(title: "Ngủ đúng giờ", xpReward: 15),
    Quest(title: "Luyện Code", xpReward: 30),
  ];

  final List<Achievement> achievements = [
    Achievement(
      title: "Người mới",
      description: "Hoàn thành nhiệm vụ đầu tiên",
    ),
    Achievement(
      title: "Chăm chỉ",
      description: "Hoàn thành 10 nhiệm vụ",
    ),
    Achievement(
      title: "Level Master",
      description: "Đạt Level 10",
    ),
  ];

  @override
  void initState() {
    super.initState();
    loadGame();
  }

  Future<void> loadGame() async {
    player = await StorageService.loadPlayer();

    await StorageService.loadQuest(quests);
    await StorageService.loadAchievement(achievements);
    completedQuest =
        quests.where((q) => q.completed).length;

    achievements[0].unlocked = completedQuest >= 1;
    achievements[1].unlocked = completedQuest >= 10;
    achievements[2].unlocked = player.level >= 10;

    setState(() {
      loading = false;
    });
  }

  Future<void> completeQuest(Quest quest) async {
    setState(() {
      if (!quest.completed) {
        quest.completed = true;
        completedQuest++;

        player.xp += quest.xpReward;
        player.coin += 5;
      } else {
        quest.completed = false;
        completedQuest--;

        player.xp -= quest.xpReward;
        player.coin -= 5;

        if (player.xp < 0) {
          player.xp = 0;
        }

        if (player.coin < 0) {
          player.coin = 0;
        }
      }

      while (player.xp >= player.maxXp) {

  player.level++;

  player.xp -= player.maxXp;

  // mỗi level sau cần thêm 50 XP
  player.maxXp += 50;


  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        "🎉 LEVEL UP! Level ${player.level}",
      ),
    ),
  );

}

      achievements[0].unlocked = completedQuest >= 1;
      achievements[1].unlocked = completedQuest >= 10;
      achievements[2].unlocked = player.level >= 10;
    });

    await StorageService.saveGame(
      player,
      quests,
      achievements,
    );
  }
    @override
  Widget build(BuildContext context) {
    if (loading) {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("LifeXP"),
        centerTitle: true,
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),

        child: ListView(
          children: [

            PlayerCard(
              player: player,
            ),

            const SizedBox(height: 25),

            const Text(
              "🎯 Daily Quest",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            ...quests.map((quest) {
              return QuestCard(
                quest: quest,
                onComplete: () {
                  completeQuest(quest);
                },
              );
            }),

            const SizedBox(height: 25),

            const Text(
              "🏆 Achievement",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            ...achievements.map((achievement) {
              return AchievementCard(
                achievement: achievement,
              );
            }),

          ],
        ),
      ),
    );
  }
}