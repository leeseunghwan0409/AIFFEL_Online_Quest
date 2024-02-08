import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  bool _is_cat = true;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Navigator Test',
      home: Navigator(
        pages: [
          MaterialPage(child: SecondScreen()),
          if (_is_cat) MaterialPage(child: FirstScreen())
        ],
        onPopPage: (route, result) => route.didPop(result),
      ),
    );
  }
}

class FirstScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.pets),
        title: Center(
          child: Text('First page'),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SecondScreen()),
                    );
                  },
                  child: Text('Next'),
                ),
                SizedBox(height: 20),
                Align(
                  alignment: Alignment.center,
                  child: Image.asset(
                    'images/catpic.jpg', // 앱의 asset에 있는 이미지 경로
                    width: 300,
                    height: 300,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.favorite),
        title: Center(child: (Text('Second Page')))
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context); // 이전 화면으로 돌아가기
                  },
                  child: Text('Back'),
                ),
                SizedBox(height: 20), // 버튼과 이미지 사이 공간
                Align(
                  alignment: Alignment.center,
                  child: Image.asset(
                    'images/dogpic.jpg', // 앱의 asset에 있는 이미지 경로
                    width: 300,
                    height: 300,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// 회고
// 이승환
// K
  // 퀘스트에 맞게 작업을 진행하였다.
// P
  // Debug console에 나타나지 않았다.
// T
  // 퇴실 이 후에 책을 참고하여 다시 작업을 해봐야겠다.