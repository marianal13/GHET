import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'pages/home.dart';
import 'pages/grocery.dart';
import 'pages/favorite.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GHET.',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const MyHomePage(title: 'GHET.'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> { 
  int sIndex = 0;

  List<Widget> pages = <Widget>[
    HomePage(title:'Home Paage'),
    FavoritePage(title: 'Favorite Page'),
    GroceryPage(title: 'Grocery Page',),
  ];

  @override
  Widget build(BuildContext context) {
      return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.fromLTRB(30,8,8,8),
          child: Image.asset(
            "images/ghetlogo2.png",
            width: 185,
          ),
        ),
        elevation: 13,
        toolbarHeight: 100,
        backgroundColor: const Color.fromARGB(255, 105, 174, 135),
        leading: Builder(
          builder: (BuildContext context){
            return IconButton(
              icon: const Icon(Icons.menu),
              color: Colors.black,
              iconSize: 45,
              onPressed: (){
                Scaffold.of(context).openDrawer();
              },
            );
          }
        )
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 105, 174, 135),
              ),
              child: Padding(
                padding: EdgeInsets.fromLTRB(20,45,20,20),
                child: Text(
                  'Meal Options:',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 35,
                  ),
                ),
              ),
              ),
            ListTile(
              title: const Text(
                'Breakfast ',
                style: TextStyle(
                  fontSize: 20,
                )),
              onTap: () {
                // Handle item 1 tap
              },
            ),
            ListTile(
              title: const Text(
                'Lunch ',
                style: TextStyle(
                  fontSize: 20,
                )),
              onTap: () {
                // Handle item 2 tap
              },
            ),
            ListTile(
              title: const Text(
                'Dinner ',
                style: TextStyle(
                  fontSize: 20,
                )),
              onTap: () {
                // Handle item 2 tap
              },
            ),
            ListTile(
              title: const Text(
                'Drinks',
                style: TextStyle(
                  fontSize: 20,
                )),
              onTap: () {
                // Handle item 2 tap
              },
            ),
            ListTile(
              title: const Text(
                'Desserts',
                style: TextStyle(
                  fontSize: 20,
                )),
              onTap: () {
                // Handle item 2 tap
              },
            ),
          ]
        ),
      ),
      body: Center(
        child:pages.elementAt(sIndex),
      ),
      
        bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 233, 233, 233),
          boxShadow: [
            BoxShadow(
              blurRadius: 13,
              color: Colors.black.withOpacity(.4),
            )
          ],
        ),
      child:Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 15),
        child: GNav(
          hoverColor: Colors.grey,
          activeColor: Colors.white,
          iconSize: 37,
          gap: 10,
          padding:const EdgeInsets.symmetric(horizontal: 25,vertical:12.5),
          tabBackgroundColor: Color(0xFF69AE87),
          color: Colors.black,
          tabBorderRadius: 30,
          
          tabs: const [
            GButton(
              icon: Icons.home,
              text: 'Home',
              ),
            GButton(
              icon: Icons.favorite,
              text: 'Favorites',
              ),
            GButton(
              icon: Icons.shopping_basket,
              text: 'Groceries',
              ),
          ],
          selectedIndex: sIndex,
          onTabChange: (index) {
            setState(() {
                sIndex = index;
              });
            },
        ),
      ),
      ),
    );
  }
}


