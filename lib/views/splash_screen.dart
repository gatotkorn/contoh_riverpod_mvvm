import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:video_player/video_player.dart';

import '../utils/page_transitions.dart';
import 'home_screen.dart';
// import 'home_screen1.dart';


class VideoSplashScreen extends StatefulWidget {
  const VideoSplashScreen({super.key});

  @override
  State<VideoSplashScreen> createState() => _VideoSplashScreenState();
}

class _VideoSplashScreenState extends State<VideoSplashScreen> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);

    _controller = VideoPlayerController.asset('assets/videos/splash_screen.mp4');

    _controller.initialize().then((_) {
      setState(() {});
      _controller.play();
      _controller.setVolume(0.0);
      _controller.setLooping(false);
    });

    _controller.addListener(() {
      if (_controller.value.position >= _controller.value.duration) {
        // Navigator.of(context).pushReplacement(
        //   MaterialPageRoute(builder: (_) => const HomeScreen()),
        // );
        Navigator.of(context).pushReplacement(slideTransitionPageRoute(page: const HomeScreen()));
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: Colors.white,
        child: Center(
          child: _controller.value.isInitialized
              ? AspectRatio(
            aspectRatio: _controller.value.aspectRatio,
            child: VideoPlayer(_controller),
          )
              : const CircularProgressIndicator(color: Colors.white),
        ),
      ),
    );
  }
}