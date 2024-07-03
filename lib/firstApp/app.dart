import 'package:flutter/material.dart';
import 'package:testp/firstApp/pages/cart_page.dart';
// import 'package:testp/firstApp/create_input_page.dart';
import 'package:testp/firstApp/pages/favourite_page.dart';
import 'package:testp/firstApp/pages/home_page.dart';
import 'package:testp/firstApp/pages/profile_page.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  int currentindex = 0;
  List pages = [const HomePage(), const FavouritePage(), const ProfilePage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        foregroundColor: Colors.white,
        title: const Text('Shopping App'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => const CartPage()));
              },
              icon: const Icon(
                Icons.shopping_cart_checkout,
                size: 35,
              )),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
                decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.fitWidth,
                      alignment: Alignment.bottomCenter,
                      image: AssetImage('assets/img/shop.png')),
                  color: Colors.blueGrey,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Shopping App',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                      ),
                    ),
                  ],
                )),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Home'),
              onTap: () {
                // Handle the tap event
                Navigator.pop(context); // Close the drawer
              },
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Settings'),
              onTap: () {
                // Handle the tap event
                Navigator.pop(context); // Close the drawer
              },
            ),
          ],
        ),
      ),
      body: pages[currentindex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.purple,
        unselectedItemColor: Colors.grey,
        currentIndex: currentindex,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite), label: 'Favourite'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
        onTap: (value) {
          setState(() {
            currentindex = value;
          });
        },
      ),
    );
  }
}
