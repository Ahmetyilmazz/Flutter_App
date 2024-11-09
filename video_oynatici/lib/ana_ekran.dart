import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class AnaEkran extends StatefulWidget {
  const AnaEkran({super.key});

  @override
  AnaEkranState createState() => AnaEkranState();
}

class AnaEkranState extends State<AnaEkran> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset('assets/bayraktar.mp4');

    _controller.addListener(() {
      setState(() {});
    });
    _controller.setLooping(true);
    _controller.initialize().then((_) => setState(() {}));
    _controller.play();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("Video Oynatici")),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            const Text('Yerel Dosyadan Video'),
            Container(
              padding: const EdgeInsets.all(20),
              child: AspectRatio(
                aspectRatio: _controller.value.aspectRatio,
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: <Widget>[
                    VideoPlayer(_controller),
                    VideoProgressIndicator(_controller, allowScrubbing: true),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
