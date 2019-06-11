import 'package:flutter/material.dart';
import 'package:mine_sold/public.dart';

import 'package:mine_sold/home/home_heif_item_view.dart';
import 'package:mine_sold/home/home_heif_header.dart';

class HomeScene extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => HomeSceneState();
}

class HomeSceneState extends State<HomeScene> with RouteAware {
  List<Novel> favoriteNovels = [];
  ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: <Widget>[
          RefreshIndicator(
            onRefresh: fetchData,
            child: ListView(
              padding: EdgeInsets.only(top: 0),
              controller: scrollController,
              children: <Widget>[buildFavoriteView()],
            ),
          )
        ],
      ),
    );
  }

  Widget buildFavoriteView() {
    if (favoriteNovels.length <= 1) {
      return Container();
    }
    List<Widget> children = [];
    var novels = favoriteNovels.sublist(1);
    novels.forEach((novels) {
      children.add(HomeheifItemView(novels));
    });

    var width = (Screen.width - 15 * 2 - 24 * 2) / 3;
    children.add(GestureDetector(
      onTap: () {},
      child: Container(
        color: Color(0xFFF5F5F5),
        width: width,
        height: width / 0.75,
        child: Image.asset('img/bookshelf_add.png'),
      ),
    ));
    return Container(
      padding: EdgeInsets.fromLTRB(15, 20, 15, 15),
      child: Wrap(
        spacing: 23,
        children: children,
      ),
    );
  }

  Future<void> fetchData() async {
    try {
      List<Novel> favoriteNovels = [];
      List<dynamic> favoriteResponse = await Request.get(action: 'bookshelf');
      favoriteResponse.forEach((data) {
        favoriteNovels.add(Novel.fromJson(data));
      });

      setState(() {
        this.favoriteNovels = favoriteNovels;
      });
    } catch (e) {
      Toast.show(e.toString());
    }
  }
}
