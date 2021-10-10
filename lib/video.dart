import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:video_player/video_player.dart';

class Video extends StatefulWidget {
  String videoURL;
  Function showNext;
  int position;
  GlobalKey<ScaffoldMessengerState> globalKey;

  Video(this.videoURL, this.showNext, this.position, this.globalKey);

  @override
  _VideoState createState() => _VideoState();
}

class _VideoState extends State<Video> {
  late VideoPlayerController _controller;

  void showSnackbar(String title, {String actionLabel = ""}) {
    widget.globalKey.currentState!.showSnackBar(SnackBar(
      backgroundColor: Colors.green[400],
      content: Text(title),
      action: SnackBarAction(
        label: actionLabel,
        textColor: Colors.white,
        onPressed: () {},
      ),
    ));
  }

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset(widget.videoURL)
      ..initialize().then((_) {
        setState(() {});
        _controller.play();

        _controller.addListener(() {
          if (_controller.value.position == _controller.value.duration) {
            widget.showNext(widget.position + 1);
          }
        });
      });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(
            child: _controller.value.isInitialized
                ? SizedBox(
                    child: VideoPlayer(_controller),
                  )
                : Center(
                    child: CircularProgressIndicator(
                      color: Colors.pink,
                    ),
                  )),
        Align(
            alignment: Alignment.bottomRight,
            child: Container(
                height: 370,
                width: 90,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    FloatingActionButton(
                      backgroundColor: Colors.black,
                      onPressed: () => {
                        showSnackbar("Oba! Que bom que você curtiu!",
                            actionLabel: "Desfazer")
                      },
                      child: Icon(
                        AntDesign.like2,
                        size: 20,
                      ),
                    ),
                    FloatingActionButton(
                      backgroundColor: Colors.black,
                      onPressed: () => {
                        showSnackbar("Que pena! Não exibiremos mais o video!",
                            actionLabel: "Desfazer")
                      },
                      child: Icon(
                        AntDesign.dislike2,
                        size: 20,
                      ),
                    ),
                    FloatingActionButton(
                      backgroundColor: Colors.black,
                      onPressed: () => {showSnackbar("Abrindo chat!")},
                      child: Icon(
                        AntDesign.message1,
                        size: 20,
                      ),
                    ),
                    FloatingActionButton(
                      backgroundColor: Colors.black,
                      onPressed: () =>
                          {showSnackbar("Compartilhe com o mundo!")},
                      child: Icon(
                        MaterialCommunityIcons.share,
                        size: 20,
                      ),
                    ),
                  ],
                )))
      ],
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
