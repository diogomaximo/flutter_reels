import 'package:flutter/material.dart';
import 'package:widgets/video.dart';

class Rells extends StatefulWidget {
  GlobalKey<ScaffoldMessengerState> globalKey;

  Rells(this.globalKey);

  @override
  _RellsState createState() => _RellsState();
}

class _RellsState extends State<Rells> {
  final List<String> videoList = [
    'assets/mengo.mp4',
    'assets/futebol.mp4',
    'assets/futebol2.mp4',
    'assets/tesla.mp4'
  ];
  PageController pageController = PageController(
    initialPage: 0,
    keepPage: true,
  );

  void changeVideo(int nextPosition) {
    int nxPosition = nextPosition >= videoList.length ? 0 : nextPosition;
    pageController.animateToPage(nxPosition,
        duration: Duration(milliseconds: 600), curve: Curves.easeIn);
  }

  @override
  Widget build(BuildContext context) {
    return PageView(
      scrollDirection: Axis.vertical,
      controller: pageController,
      children: videos(),
    );
  }

  List<Widget> videos() {
    List<Widget> videos = [];
    for (var i = 0; i < videoList.length; i++) {
      String videoPath = videoList[i];
      videos.add(Video(videoPath, changeVideo, i, widget.globalKey));
    }
    return videos;
  }
}
