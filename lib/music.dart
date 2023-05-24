import 'dart:ui';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'start.dart';
import 'dart:math';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {


  bool isPlaying = true;
  int index = Random().nextInt(8);
  double value = 0;
  final player = AudioPlayer();
  Duration? duration = const Duration(seconds: 0);



  title(){
    if (index==0){
      return 'Afreen Afreen';
    }
    else if(index==1){
      return 'Maps';
    }
    else if(index==2){
      return 'Symphony';
    }
    else if(index==3){
      return 'Dynamite';
    }
    else if(index==4){
      return '2002';
    }
    else if(index==5){
      return 'Ghodey Pe Sawaar';
    }
    else if (index==6){
      return 'Akhiyaan';
    }

    else if (index==7){
      return 'Cupid';
    }
  }

  singer(){
    if (index==0){
      return 'Rahat Fateh Ali Khan';
    }
    else if(index==1){
      return 'Maroon 5';
    }
    else if(index==2){
      return 'Clean Bandit';
    }
    else if(index==3){
      return 'BTS';
    }
    else if(index==4){
      return 'Anne Marie';
    }
    else if(index==5){
      return 'Sireesha Bhagavatula';
    }
    else if (index==6){
      return 'Mitraz';
    }

    else if (index==7){
      return 'Fifty Fifty';
    }
  }

  List tracks = ['https://s21.aconvert.com/convert/p3r68-cdx67/gjtz2-kp8rm.mp3',
    'https://s17.aconvert.com/convert/p3r68-cdx67/hvi1n-impse.mp3',
    'https://s27.aconvert.com/convert/p3r68-cdx67/l1jim-c7iaj.mp3',
  'https://s31.aconvert.com/convert/p3r68-cdx67/zoiv8-bjrxu.mp3',
    'https://s31.aconvert.com/convert/p3r68-cdx67/holy6-fao6x.mp3',
    'https://s27.aconvert.com/convert/p3r68-cdx67/dgfo0-cnq5n.mp3',
    'https://s27.aconvert.com/convert/p3r68-cdx67/eyggp-pfcih.mp3',
    'https://s19.aconvert.com/convert/p3r68-cdx67/m16s6-a85az.mp3'
  ];

  List cover = ['https://i1.sndcdn.com/artworks-000190129535-nyf50w-t500x500.jpg',
    'https://i.scdn.co/image/ab67616d0000b273442b53773d50e1b5369bb16c',
  'https://i1.sndcdn.com/artworks-000367581027-gwp41t-t500x500.jpg',
    'https://dailytrojan.com/wp-content/uploads/2020/08/BTS-Photo.jpeg',
    'https://i.scdn.co/image/ab67616d0000b273974b572687bbda042782dd46',
    'https://c.saavncdn.com/440/Qala-Music-From-The-Netflix-Film-Hindi-2022-20221218100455-500x500.jpg',
    'data:image/jpeg;base64,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',
    'https://variety.com/wp-content/uploads/2023/05/FIFTY-FIFTY_NERD-GIRLS_GROUP.jpg?w=1000'
  ];

  playAudioFromUrl() async {
    Source source = UrlSource(tracks[index]);
    duration = await player.getDuration();
    await player.play(source);
  }




  //init the player
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    playAudioFromUrl();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
      ),
      body: Stack(
        children: [
          Container(
            constraints: const BoxConstraints.expand(),
            height: 300.0,
            width: 300.0,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(cover[index]),
                fit: BoxFit.cover,
              ),
            ),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 28, sigmaY: 28),
              child: Container(
                color: Colors.black.withOpacity(0.6),
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
//setting the music cover
              ClipRRect(
                borderRadius: BorderRadius.circular(30.0),
                child: Image.network(cover[index],
                  width: 250.0,
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),

              Text(
                "${title()}",
                style: const TextStyle(
                    color: Colors.white, fontSize: 35, letterSpacing: 1),
              ),

              Text(
                '${singer()}',
                style: (const TextStyle(
                  color: Colors.white54, fontSize: 20, letterSpacing: 3
                )),
              ),

              const SizedBox(
                height: 50.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "${(value / 60).floor()}:${(value % 60).floor()}",
                    style: const TextStyle(color: Colors.white),
                  ),
                  // Slider.adaptive(
                  //
                  //   min: 0.0,
                  //   value: value.clamp(0.0, duration?.inSeconds?.toDouble() ?? 0.0),
                  //   max: duration?.inSeconds?.toDouble() ?? 0.0,
                  //   onChanged: (v) {
                  //     setState(() {
                  //       value = v;
                  //     });
                  //   },
                  //   activeColor: Colors.white,
                  //   onChangeEnd: (newValue) async {
                  //     setState(() {
                  //       value = newValue;
                  //     });
                  //     await player.seek(Duration(seconds: newValue.toInt()));
                  //     await player.resume();
                  //   },
                  // ),
                  // Text(
                  //   "${duration!.inMinutes}:${duration!.inSeconds%60}",
                  //   style: const TextStyle(color: Colors.white),
                  // ),
                ],
              ),
//setting the player controller
              const SizedBox(
                height: 60.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(60.0),
                      color: Colors.black87,
                      border: Border.all(color: Colors.white38),
                    ),
                    width: 50.0,
                    height: 50.0,
                    child: InkWell(
                      onTapDown: (details) {
                        player.setPlaybackRate(0.5);
                      },
                      onTapUp: (details) {
                        player.setPlaybackRate(1);
                      },
                      child: const Center(
                        child: Icon(
                          Icons.fast_rewind_rounded,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(60.0),
                      color: Colors.black87,
                      border: Border.all(color: Colors.pink),
                    ),
                    width: 60.0,
                    height: 60.0,
                    child: InkWell(
                      onTap: () async {
//setting the play function
                        if (isPlaying){
                          await player.pause();
                          setState((){
                            isPlaying = false;
                          });
                        }
                        else{
                          await player.resume();
                          setState((){
                            isPlaying = true;
                          });

                          player.onPositionChanged.listen((position) {
                            setState(() {
                              value = position.inSeconds.toDouble();
                            });
                          });
                        }
                      },
                      child: Center(
                        child: Icon(
                          isPlaying? Icons.pause : Icons.play_arrow,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(60.0),
                      color: Colors.black87,
                      border: Border.all(color: Colors.white38),
                    ),
                    width: 50.0,
                    height: 50.0,
                    child: InkWell(
                      onTapDown: (details) {
                        player.setPlaybackRate(2);
                      },
                      onTapUp: (details) {
                        player.setPlaybackRate(1);
                      },
                      child: const Center(
                        child: Icon(
                          Icons.fast_forward_rounded,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}

