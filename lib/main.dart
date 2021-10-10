import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:widgets/rells.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final _messageKey = GlobalKey<ScaffoldMessengerState>();
  double _iconSize = 35.0;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      scaffoldMessengerKey: _messageKey,
      title: 'My Reels',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        bottomNavigationBar: Theme(
          data: Theme.of(context).copyWith(
              canvasColor: Colors.black,
              primaryColor: Colors.red,
              textTheme: Theme.of(context)
                  .textTheme
                  .copyWith(caption: new TextStyle(color: Colors.white))),
          child: BottomNavigationBar(
              backgroundColor: Colors.black,
              selectedItemColor: Colors.amber[800],
              items: <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  backgroundColor: Colors.black,
                  icon: Icon(
                    AntDesign.home,
                    size: _iconSize,
                  ),
                  label: '',
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    AntDesign.search1,
                    size: _iconSize,
                  ),
                  label: '',
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    AntDesign.youtube,
                    size: _iconSize,
                    color: Colors.white,
                  ),
                  label: '',
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    AntDesign.heart,
                    size: _iconSize - 2,
                  ),
                  label: 'Likes',
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    AntDesign.user,
                    size: _iconSize,
                  ),
                  label: '',
                ),
              ],
              currentIndex: 2,
              onTap: (int) => {}),
        ),
        body: Stack(
          children: [
            Rells(_messageKey),
            Padding(
              padding: EdgeInsets.only(top: 40),
              child: Align(
                alignment: Alignment.topCenter,
                child: Text(
                  "my reels",
                  style: TextStyle(
                      fontSize: 36,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
