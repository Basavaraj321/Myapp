import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(

      
      appBar: AppBar(
        title: MyStatefulWidget(),
        backgroundColor: Colors.white,
        leading: new Icon(Icons.menu,color: Colors.black,),
        titleSpacing: 10.0,
        actions: <Widget>[
          IconButton(onPressed: (){}, icon: Icon(Icons.auto_awesome_mosaic_rounded),
            color: Colors.black,),

          IconButton(onPressed: (){}, icon: Icon(Icons.search),
          color: Colors.black,),

        ],
      ),




      body: ChooseMusic(),
    ),



  ));
}
class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  String dropdownValue = 'Featured';

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      underline: SizedBox(),
      value: dropdownValue,
      icon: const Icon(Icons.arrow_drop_down,color: Colors.black,),
      iconSize: 24,
      elevation: 16,
      style: const TextStyle(color: Colors.black,
      fontWeight: FontWeight.bold,
      fontSize: 20.0),

      onChanged: (String? newValue) {
        setState(() {
          dropdownValue = newValue!;
        });
      },
      items: <String>['Featured', 'Two', 'Free', 'Four']
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}

class ChooseMusic extends StatefulWidget{
  const ChooseMusic({Key? key}) : super(key: key);
  @override
  State<ChooseMusic> createState() => _ChooseMusic();

}

class _ChooseMusic extends State<ChooseMusic>{

  List<Music> musicDetails =[
    Music(likes: '989',playListName: '80 SMASH HITS',singer: 'BASAVARAJ C KORI',singerImage: 'one.jpg',time:'3'),
    Music(likes: '2000',playListName: 'NEWLY ARRIVED',singer: 'AISHWARYA P KORI',singerImage: 'three.jpg',time:'3' ),
    Music(likes: '9898',playListName: '2020 KANNADA',singer: 'VINAYKUMAR C KORI',singerImage: 'two.jpg',time:'3' ),
  ];
  final _listItems = List.generate(200, (i) => "Item $i");

  // Used to generate random integers
  final _random = Random();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: musicDetails.length,
        itemBuilder: (context,index){
          return Container(
            height: 380,
            margin: const EdgeInsets.symmetric(horizontal: 50,vertical: 20),
            decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(30.0)), color: Colors.primaries[_random.nextInt(Colors.primaries.length)]
            [_random.nextInt(9) * 100],boxShadow: [
              BoxShadow(color: Colors.black.withAlpha(100), blurRadius: 10.0),

            ]),
            child: Column(
              children: <Widget>[
                Padding(padding: const EdgeInsets.symmetric(horizontal: 5,vertical: 10),
                  child: Row(
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.red,
                        radius: 25,
                      ),
                      Padding(padding: const EdgeInsets.symmetric(horizontal: 5,vertical: 10),
                        child: Column(
                          children: <Widget>[
                            Text(musicDetails[index].singer,
                              style: TextStyle(
                                letterSpacing: 1,
                                fontSize: 8,
                              ),),
                            Text(musicDetails[index].singer,
                              style: TextStyle(
                                letterSpacing: 1,
                                fontSize: 5,
                              ),),
                          ],
                        ),

                      ),

                      Padding(padding: EdgeInsets.only(left: 70),
                      child: Container(

                        child: IconButton(onPressed: (){}, icon: Icon(Icons.add_circle_outlined),
                          iconSize: 30,
                          color: Colors.black,),
                      ),
                      )

                    ],
                  ),
                ),
                Padding(padding: const EdgeInsets.symmetric(horizontal: 5,vertical: 10),
                child: Column(
                  children: [
                    Text(musicDetails[index].playListName,
                      style: TextStyle(
                        letterSpacing: 1,
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Padding(padding: const EdgeInsets.symmetric(horizontal: 100,vertical: 0),
                      child: Row(
                        children: <Widget>[
                          IconButton(onPressed: (){}, icon:Icon(Icons.thumb_up,
                          size: 10,)
                          ),
                          Text(musicDetails[index].likes,
                            style: TextStyle(
                              letterSpacing: 1,
                              fontSize: 10,
                            ),),
                        ],
                      ),

                    ),
                    Padding(padding: const EdgeInsets.only(top: 1),
                        child: Column(
                          children: <Widget>[
                            Image(image: AssetImage('assests/${musicDetails[index].singerImage}'),
                              width: 150,
                              height: 150,)

                          ],
                        )

                    ),


                  ],
                ),

                ),

                Padding(padding: EdgeInsets.only(left:5,top:0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      IconButton(onPressed: (){}, icon: Icon(Icons.favorite_border)),
                      IconButton(onPressed: (){}, icon: Icon(Icons.block)),
                      Center(
                        child: Padding(padding: EdgeInsets.only(right: 10),
                          child: Row(
                            children: [
                              IconButton(onPressed: (){}, icon: Icon(Icons.play_circle_filled_rounded,
                                size: 50,)),
                            ],
                          ),),
                      ),
                      IconButton(onPressed: (){}, icon: Icon(Icons.thumb_up_alt_outlined)),
                      IconButton(onPressed: (){}, icon: Icon(Icons.volume_off_rounded)),

                    ],
                  ),

                ),










              ],
            )

          );
        });
  }
  

}

class Music {
  late String singer;
  late String singerImage;
  late String playListName;
  late String likes;
  late String time;
  Music({required this.likes,required this.playListName,required this.singer,required this.singerImage,required this.time});
}





