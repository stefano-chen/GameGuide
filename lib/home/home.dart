import 'package:flutter/material.dart';
import 'package:gameguide/home/pages/champions.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;

  PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF141515),
        title: Text(
          "GameGuide",
          style: TextStyle(color: Colors.white),
        ),
        actions: <Widget>[
          IconButton(
              icon: Icon(
                Icons.settings,
                color: Colors.white,
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
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(title: Text('Home'),icon: Icon(Icons.home)),
          BottomNavigationBarItem(title: Text('Search'),icon: Icon(Icons.search)),
          BottomNavigationBarItem(title: Text('Favorites'),icon: Icon(Icons.favorite))
        ],
        backgroundColor: Color(0xFF141515),
        currentIndex: _currentIndex,
        onTap: (index){
          setState(() {
            _currentIndex=index;
            _pageController.jumpToPage(index);
          });
        },
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        iconSize: 25.0,
      ),
    );
  }
}
