import 'package:flutter/material.dart';
import 'second.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  bool _classifier = true;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Navigator(
        pages: [
          MaterialPage(child: Classifierpage()),
          if (_classifier) MaterialPage(child: HomePage())
        ],
        onPopPage: (route, result) => route.didPop(result),
      )
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('쓰레기를 분류하자!'),
        centerTitle: true,
        leading: Icon(Icons.delete_sweep, size: 40),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Image.asset(
                      'images/big.jpeg',
                      width: 300,
                      height: 300,
                    ),
                  ),
                  SizedBox(height: 20),
                  FloatingActionButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Classifierpage()),
                        );
                      },
                      child: Text('Next')
                  ),
                ],
            )
          )
        ],
      ),
    );
  }
}



class Classifierpage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('쓰레기를 분류하자!'),
          centerTitle: true,
          leading: Icon(Icons.delete_sweep, size: 40),
        ),
        body: MyHomePage(),
      );
  }
}