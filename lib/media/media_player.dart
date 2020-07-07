import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:simpleweather/widget/buttons.dart';
import 'package:simpleweather/widget/intrance_fader.dart';

class Stacking extends StatefulWidget {
  @override
  _StackingState createState() => _StackingState();
}

class _StackingState extends State<Stacking>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation animation;
  Animation animation1;
  int change = 1;

//player function
  all() {
    final player =
        AudioCache(fixedPlayer: AudioPlayer(mode: PlayerMode.MEDIA_PLAYER));
    player.play('Dream$change.mp3');
  }

  int changer = 1;
  IconData icon;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(duration: Duration(seconds: 2), vsync: this);
    animation = ColorTween(begin: Colors.redAccent, end: Colors.grey)
        .animate(controller);
    animation1 =
        ColorTween(begin: Colors.black, end: Colors.red).animate(controller);
    controller.repeat();

    controller.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = Theme.of(context).textTheme.headline5;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.redAccent,
        title: Text(
          'Baby Media player',
          style: textStyle.copyWith(
              fontWeight: FontWeight.bold, color: Colors.grey, fontSize: 30),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Container(
                child: Center(
                  child: CircleAvatar(
                    radius: 120,
                    backgroundColor: animation.value,
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      child: Center(
                          child: Icon(
                        FontAwesomeIcons.child,
                        color: Colors.black,
                        size: 36,
                      )),
                      radius: 50,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 40),
              child: EntranceFader(
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Row(
                    children: <Widget>[
                      Icon(
                        FontAwesomeIcons.child,
                        color: Colors.red,
                        size: 50,
                      ),
                      Text('We play to learn',
                          style: TextStyle(
                              fontSize: 25,
                              fontStyle: FontStyle.italic,
                              color: Colors.purple)
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              color: Colors.redAccent,
              child: Center(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    MediaButtons(
                      icon: FontAwesomeIcons.fastBackward,
                      onPressed: () {
                        setState(() {
                          all();
                          if (change == 1) {
                            change = 1;
                          } else {
                            change--;
                          }
                        });
                      },
                    ),
                    MediaButtons(
                      icon: icon,
                      onPressed: () {
                        if (changer == 1) {
                          setState(() {
                            icon = FontAwesomeIcons.play;
                            changer++;
                          });
                        } else {
                          setState(() {
                            icon = FontAwesomeIcons.pause;
                            changer--;
                          });
                        }
                      },
                    ),
                    MediaButtons(
                      icon: FontAwesomeIcons.fastForward,
                      onPressed: () {
                        setState(() {
                          all();
                          if (change == 6) {
                            change = 6;
                          } else {
                            change++;
                          }
                        });
                      },
                    ),
                  ],
                ),
              ),
              height: MediaQuery.of(context).size.height / 9,
            ),
          ],
        ),
      ),
    );
  }
}
