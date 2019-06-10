import 'package:flutter/material.dart';
import 'package:assets_audio_player/assets_audio_player.dart';

class HomeRoute extends StatefulWidget {
  @override
  _HomeRouteState createState() => _HomeRouteState();
}

class _HomeRouteState extends State<HomeRoute> {
  final ScrollController _scrollController = ScrollController();
  final AssetsAudioPlayer _elevator = AssetsAudioPlayer();
  final AssetsAudioPlayer _ding = AssetsAudioPlayer();

  double _ppos = 0;
  bool _elevating = false;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      double pos = _scrollController.offset;
      double vel = pos - _ppos;
      _ppos = pos;
      if (!_elevating) return;
      if (vel > 0) {
        _elevator.stop();
        _elevating = false;
      }
      if (pos == 0) {
        _elevator.stop();
        _playDing();
        _elevating = false;
      }
    });
  }

  void _playElevator() {
    _elevator.open(
      AssetsAudio(
        asset: "elevator.mp3",
        folder: "assets/sounds/",
      ),
    );
    _elevating = true;
  }

  void _playDing() {
    _ding.open(
      AssetsAudio(
        asset: "ding.mp3",
        folder: "assets/sounds/",
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    const Widget seperator = SizedBox(height: 116.0);

    Widget buildPart(String text) {
      return Column(
        children: <Widget>[
          seperator,
          Text(
            text,
            style: Theme.of(context).textTheme.headline,
            textAlign: TextAlign.center,
          ),
          seperator,
          Icon(
            Icons.arrow_downward,
            size: 72.0,
          ),
        ],
      );
    }

    Widget end = Column(
      children: <Widget>[
        seperator,
        Text(
          "Congratulations! You reached the end! Press this button to see what it does",
          style: Theme.of(context).textTheme.headline,
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 22.0),
        RaisedButton(
          onPressed: () {
            _scrollController.animateTo(
              0,
              curve: Curves.easeIn,
              duration: Duration(seconds: 15),
            );
            _playElevator();
          },
          color: Theme.of(context).accentColor,
          child: Text(
            "A Rare Button",
            style: Theme.of(context).textTheme.button,
          ),
        ),
        seperator,
      ],
    );

    return Scaffold(
      appBar: AppBar(
        title: Text("An Important App"),
      ),
      body: ListView(
        controller: _scrollController,
        padding: EdgeInsets.symmetric(
          horizontal: 16.0,
          vertical: 32.0,
        ),
        children: <Widget>[
          buildPart("This app does absolutely nothing"),
          buildPart("There is nothing waiting for you at the end"),
          buildPart("Why are you still scrolling?"),
          buildPart("Is this what your life has come to?"),
          buildPart("Seriously, why are you still scrolling?"),
          buildPart("You should seriously reconsider your life choices"),
          buildPart("What is waiting for you at the bottom will shock you!"),
          buildPart("Haha, just kidding! You were fooled by my clickbait"),
          buildPart(
              "I said you were fooled! I got you! Why are you still scrolling?"),
          buildPart(
              "I told you allready! There is nothing waiting for you at the end!"),
          buildPart("..."),
          buildPart("This is a total waste of time"),
          buildPart("..."),
          buildPart(
              "Turn off your phone and do something productive for once!"),
          buildPart("Do you not find this boring?"),
          end
        ],
      ),
    );
  }
}
