import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';



class PlayVideo extends StatefulWidget {
  // This widget is the root of your application.
  final String videoURL;
  PlayVideo({Key key, this.videoURL}) : super(key: key);
  @override
  _MyHomePageState createState() => _MyHomePageState(videoURL);

}



class _MyHomePageState extends State<PlayVideo> {
  final String videoURL;
  _MyHomePageState( this.videoURL);

  VideoPlayerController _controller;
  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(
        videoURL )
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {});
      });
  }
  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return MaterialApp(
      title: 'Video Demo',
      home: Scaffold(
        appBar: AppBar(
          title: Text("Video"),
          actions: <Widget>[
        // action button
            IconButton(
              icon: Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.pop(context);
                },
            ),

          ],
        ),
        body: Center(
          child: _controller.value.initialized
              ? AspectRatio(
            aspectRatio: _controller.value.aspectRatio,
            child: VideoPlayer(_controller),
          )
              : Container(),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              _controller.value.isPlaying
                  ? _controller.pause()
                  : _controller.play();
            });
          },
          child: Icon(
            _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
          ),
        ),
      ),
    );
  }
}
