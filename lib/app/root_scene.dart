import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mine_sold/home/home_scene.dart';
import 'package:mine_sold/mine/mine_scene.dart';

class RootScene extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => RootSceneState();
}

class RootSceneState extends State<RootScene> {

  int _tabIndex = 0;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: IndexedStack(
        children: <Widget>[
          HomeScene(),
          MineScene()
        ],
        index: _tabIndex,
      ),
      bottomNavigationBar: CupertinoTabBar(
        backgroundColor: Colors.white,
        activeColor: Colors.red,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Image.asset('img/tab_me_n.png'), title: Text('书架')),
          BottomNavigationBarItem(icon: Image.asset('img/tab_me_p.png'), title: Text('我的')),
        ],
        currentIndex: _tabIndex,
        onTap: (index) {
          setState(() {
            _tabIndex = index;
          });
        },
      ),
    );
  }
  


}