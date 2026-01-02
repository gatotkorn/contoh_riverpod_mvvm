// import 'package:flutter/material.dart';
// import 'package:video_player/video_player.dart';
// import 'contact_list_screen.dart';
//
// class SplashScreen extends StatefulWidget {
//   @override
//   _SplashScreenState createState() => _SplashScreenState();
// }
//
// class _SplashScreenState extends State<SplashScreen> {
//   late VideoPlayerController _controller;
//
//   @override
//   void initState() {
//     super.initState();
//     _controller = VideoPlayerController.asset('assets/videos/splash_screen.mp4')
//       ..initialize().then((_) {
//         setState(() {});
//         _controller.play();
//         _controller.setLooping(false);
//         _controller.addListener(() {
//           if (_controller.value.position == _controller.value.duration) {
//             Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => ContactListScreen()));
//           }
//         });
//       });
//   }
//
//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: _controller.value.isInitialized
//             ? AspectRatio(
//           aspectRatio: _controller.value.aspectRatio,
//           child: VideoPlayer(_controller),
//         )
//             : CircularProgressIndicator(),
//       ),
//     );
//   }
// }