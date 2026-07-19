import 'package:flutter/material.dart';

import '../models/player.dart';
import 'xp_bar.dart';


class PlayerCard extends StatelessWidget {

  final Player player;


  const PlayerCard({
    super.key,
    required this.player,
  });



  String getRank(){

    if(player.level >= 10){
      return "🏆 Legend";
    }

    if(player.level >= 5){
      return "⚔️ Warrior";
    }

    if(player.level >= 3){
      return "🔥 Challenger";
    }

    return "🌱 Beginner";

  }



  @override
  Widget build(BuildContext context) {


    return Card(

      elevation: 10,

      shape: RoundedRectangleBorder(

        borderRadius: BorderRadius.circular(25),

      ),


      child: Padding(

        padding: const EdgeInsets.all(20),


        child: Column(

          crossAxisAlignment: CrossAxisAlignment.start,


          children: [


            Row(

              children: [


                const CircleAvatar(

                  radius: 35,

                  child: Icon(

                    Icons.person,

                    size: 40,

                  ),

                ),



                const SizedBox(width: 15),



                Column(

                  crossAxisAlignment: CrossAxisAlignment.start,


                  children: [


                    const Text(

                      "Huy",

                      style: TextStyle(

                        fontSize: 26,

                        fontWeight: FontWeight.bold,

                      ),

                    ),



                    Text(

                      "⭐ Level ${player.level}",

                      style: const TextStyle(

                        fontSize: 18,

                      ),

                    ),



                    Text(

                      getRank(),

                      style: const TextStyle(

                        fontSize: 16,

                      ),

                    ),



                  ],

                ),


              ],

            ),



            const SizedBox(height: 25),



            Row(

              mainAxisAlignment: MainAxisAlignment.spaceAround,


              children: [


                stat(

                  "❤️",

                  "${player.hp}",

                ),



                stat(

                  "🪙",

                  "${player.coin}",

                ),



                stat(

                  "⚡",

                  "${player.xp}/${player.maxXp}",

                ),


              ],


            ),



            const SizedBox(height: 25),



            XpBar(

              xp: player.xp,

              maxXp: player.maxXp,

            ),



          ],


        ),

      ),

    );


  }



  Widget stat(String icon, String value){


    return Column(

      children: [


        Text(

          icon,

          style: const TextStyle(

            fontSize: 25,

          ),

        ),



        Text(

          value,

          style: const TextStyle(

            fontSize: 18,

            fontWeight: FontWeight.bold,

          ),

        ),


      ],

    );


  }


}