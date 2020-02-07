import 'package:flutter/material.dart';
import 'package:draggable_scrollbar/draggable_scrollbar.dart';
import 'package:gameguide/services/saveManager.dart';
import 'package:gameguide/widgets/championTile.dart';

class FavoritePage extends StatefulWidget {
  @override
  _FavoritePageState createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  ScrollController _controller = ScrollController();

  List<ChampionTile> _getFavorites() {
    List<ChampionTile> champions = List<ChampionTile>();
    if(SaveManager.favorites.length >0 ){
      SaveManager.champions['data'].forEach((k, v) {
      if (SaveManager.favorites.contains(v['id'])) {
        champions.add(ChampionTile(
          id: v['id'],
          imageFull: v['image']['full'],
          name: v['name'],
          title: v['title'],
        ));
      }
    });
    }
    return champions;
  }

  @override
  Widget build(BuildContext context) {
    return DraggableScrollbar.rrect(
      controller: _controller,
      child: ListView(
        controller: _controller,
        children: _getFavorites(),
      ),
      backgroundColor: Colors.grey[400],
      heightScrollThumb: 40.0,
    );
  }
}
