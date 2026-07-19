import 'package:flutter/material.dart';
import '../models/player.dart';
import 'xp_bar.dart';


class PlayerCard extends StatelessWidget {

  final Player player;


  const PlayerCard({
    super.key,
    required this.player,
  });



  @override
  Widget build(BuildContext context) {


    return Card(

      elevation: 8,


      shape: RoundedRectangleBorder(

        borderRadius: BorderRadius.circular(20),

      ),


      child: Padding(

        padding: const EdgeInsets.all(20),


        child: Column(

          crossAxisAlignment: CrossAxisAlignment.start,


          children: [



            Row(

              children: [


                const CircleAvatar(

                  radius: 30,

                  child: Icon(
                    Icons.person,
                    size: 35,
                  ),

                ),



                const SizedBox(width: 15),



                Column(

                  crossAxisAlignment: CrossAxisAlignment.start,


                  children: [


                    const Text(

                      "Huy",

                      style: TextStyle(

                        fontSize: 25,

                        fontWeight: FontWeight.bold,

                      ),

                    ),



                    Text(

                      "⭐ Level ${player.level}",

                      style: const TextStyle(

                        fontSize: 18,

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



                Column(

                  children: [


                    const Text(
                      "❤️",
                      style: TextStyle(
                        fontSize: 25,
                      ),
                    ),


                    Text(
                      "${player.hp}",
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),


                  ],

                ),



                Column(

                  children: [


                    const Text(
                      "💰",
                      style: TextStyle(
                        fontSize: 25,
                      ),
                    ),


                    Text(
                      "${player.coin}",
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),


                  ],

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

}