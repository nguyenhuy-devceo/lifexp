import 'package:flutter/material.dart';
import '../models/achievement.dart';



class AchievementCard extends StatelessWidget {


  final Achievement achievement;



  const AchievementCard({

    super.key,

    required this.achievement,

  });



  @override
  Widget build(BuildContext context) {


    return Card(


      elevation: 3,


      child: ListTile(


        leading: Icon(

          achievement.unlocked

              ? Icons.emoji_events

              : Icons.lock,


          size: 35,

        ),



        title: Text(

          achievement.title,

          style: const TextStyle(

            fontWeight: FontWeight.bold,

          ),

        ),



        subtitle: Text(

          achievement.description,

        ),



      ),


    );


  }


}