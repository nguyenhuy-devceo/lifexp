import 'package:flutter/material.dart';
import '../models/quest.dart';


class QuestCard extends StatelessWidget {

  final Quest quest;
  final VoidCallback onComplete;


  const QuestCard({
    super.key,
    required this.quest,
    required this.onComplete,
  });



  @override
  Widget build(BuildContext context) {


    return Card(

      elevation: 4,


      shape: RoundedRectangleBorder(

        borderRadius: BorderRadius.circular(15),

      ),



      child: Padding(

        padding: const EdgeInsets.all(15),


        child: Row(


          children: [



            Checkbox(

              value: quest.completed,

              onChanged: (value) {

                onComplete();

              },

            ),



            Expanded(

              child: Column(

                crossAxisAlignment: CrossAxisAlignment.start,


                children: [


                  Text(

                    quest.title,

                    style: TextStyle(

                      fontSize: 18,

                      fontWeight: FontWeight.bold,


                      decoration: quest.completed

                          ? TextDecoration.lineThrough

                          : null,

                    ),

                  ),



                  const SizedBox(height: 5),



                  Text(

                    "+${quest.xpReward} XP",

                    style: const TextStyle(

                      fontSize: 16,

                      fontWeight: FontWeight.bold,

                    ),

                  ),



                ],

              ),

            ),



            if (quest.completed)

              const Icon(

                Icons.check_circle,

                size: 30,

              ),



          ],


        ),

      ),

    );


  }

}