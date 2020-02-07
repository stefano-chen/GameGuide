import 'package:flutter/material.dart';
import 'package:gameguide/home/pages/champions.dart';
import 'package:gameguide/home/pages/favoritePage.dart';
import 'package:gameguide/services/authService.dart';
import 'package:gameguide/services/saveManager.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {


  int _currentIndex = 0;
  AuthService auth = AuthService();

  PageController _pageController = PageController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "GameGuide",
        ),
        actions: <Widget>[
          IconButton(
              icon: Icon(
                Icons.settings,
              ),
              onPressed: () {
                Navigator.pushNamed(context, 'settings');
              })
        ],
      ),
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        children: <Widget>[
          Champions(),
          FavoritePage(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(title: Text('Home'),icon: Icon(Icons.home)),
          //BottomNavigationBarItem(title: Text('Search'),icon: Icon(Icons.search)),
          BottomNavigationBarItem(title: Text('Favorites'),icon: Icon(Icons.favorite))
        ],
        currentIndex: _currentIndex,
        onTap: (index){
          setState(() {
            _currentIndex=index;
            _pageController.jumpToPage(index);
          });
        },
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        iconSize: 25.0,
      ),
    );
  }
}
