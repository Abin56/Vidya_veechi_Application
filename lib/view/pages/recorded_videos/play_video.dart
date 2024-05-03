// import 'package:chewie/chewie.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:video_player/video_player.dart';

// class Videoplayer extends StatefulWidget {
//   final String videoUrl;

//   const Videoplayer({super.key, required this.videoUrl});

//   @override
//   _VideoplayerState createState() => _VideoplayerState();
// }

// class _VideoplayerState extends State<Videoplayer> {
//   late ChewieController _chewieController;

//   @override
//   void initState() {
//     super.initState();
//     _initializeVideoPlayer();
//   }

//   void _initializeVideoPlayer() {
//     final videoPlayerController = VideoPlayerController.networkUrl(Uri.parse(
//       widget.videoUrl,
//       // 'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4',
//     ));
//     _chewieController = ChewieController(
//       videoPlayerController: videoPlayerController,
//       aspectRatio: 16 / 9,
//       autoPlay: true,
//       looping: true,
//       allowedScreenSleep: false,
//       autoInitialize: true,
//       fullScreenByDefault: false,
//       deviceOrientationsOnEnterFullScreen: [
//         DeviceOrientation.landscapeLeft,
//         DeviceOrientation.landscapeRight,
//         DeviceOrientation.portraitUp
//       ],
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Video Player'),
//       ),
//       body: Center(
//         child: Chewie(
//           controller: _chewieController,
//         ),
//       ),
//     );
//   }

//   @override
//   void dispose() {
//     _chewieController.dispose();
//     _chewieController.videoPlayerController.dispose();
//     super.dispose();
//   }
// }
