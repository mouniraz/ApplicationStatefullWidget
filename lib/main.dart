import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var _heartIcon = Icon(
    Icons.favorite_border,
    color: Colors.white,
  );
  bool _like = false;

  int _selectedIndex = 0;

  var _display = 'Home Selected';
  @override
  Widget build(BuildContext context) {
    return (Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Colors.indigoAccent,
        actions: <Widget>[IconButton(onPressed: _setLiked, icon: _heartIcon)],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '$_display',
              style: TextStyle(color: Colors.indigoAccent, fontSize: 40),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: _setLiked,
          backgroundColor: Colors.indigoAccent,
          child: _heartIcon),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              label: 'Home', icon: Icon(Icons.home, color: Colors.white)),
          BottomNavigationBarItem(
              label: 'Settings',
              icon: Icon(Icons.settings, color: Colors.white)),
          BottomNavigationBarItem(
              label: 'Account',
              icon: Icon(Icons.account_circle, color: Colors.white))
        ],
        backgroundColor: Colors.indigoAccent,
        currentIndex: _selectedIndex,
        onTap: _setDisplayed,
      ),
    ));
  }

  void _setLiked() {
    setState(() {
      if (_like) {
        _like = false;
        _heartIcon = Icon(
          Icons.favorite_border,
          color: Colors.white,
        );
      } else {
        _like = true;
        _heartIcon = Icon(
          Icons.favorite,
          color: Colors.white,
        );
      }
    });
  }

  void _setDisplayed(int index) {
    setState(() {
      switch (index) {
        case 0:
          {
            _selectedIndex = 0;
            _display = 'Home Selected';
          }
          break;
        case 1:
          {
            _selectedIndex = 1;
            _display = 'Setting Selected';
          }
          break;
        case 2:
         {
            _selectedIndex = 0;
            _display = 'Account Selected';
          }
          break;
      }
    });
  }
}
