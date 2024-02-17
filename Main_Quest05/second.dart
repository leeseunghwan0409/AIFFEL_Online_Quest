import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String result = "";
  TextEditingController urlController = TextEditingController();

  Future<void> prediction(String url) async {
    try {
      final response = await http.get(
        Uri.parse(urlController.text + url),
        headers: {
          'Content-Type': 'application/json',
          'ngrok-skip-browser-warning': '69420',
        },
      );
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        setState(() {
          result =
          "predicted_label: ${data['predicted_label']}\nprediction_score: ${data['prediction_score']}";
        });
        print(result);
      } else {
        setState(() {
          result = "Failed to fetch data. Status Code: ${response.statusCode}";
        });
      }
    } catch (e) {
      setState(() {
        result = "Error: $e";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 20),
            // 결과 표시
            Text(
              result,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18),
            ),
            // 이미지를 표시할 컨테이너
            SizedBox(height: 20),
            Container(
              width: 300,
              height: 300,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.blueAccent),
              ),
              child: Container(
                width: 400, // Container의 너비를 300으로 설정
                height: 400, // Container의 높이를 300으로 설정
                child: Image.network(
                  "https://cdn.pixabay.com/photo/2011/03/25/08/27/liquor-5884_1280.jpg", // 이미지 URL
                  fit: BoxFit.fill,
                ),
              ),
            ),
            SizedBox(height: 80),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FloatingActionButton(
                  onPressed: () => Navigator.pop(context), // 예측 결과를 가져오는 URL
                  child: Text("Home"),
                ),
                FloatingActionButton(
                  onPressed: () => prediction('https://16b1-34-145-103-97.ngrok-free.app/sample'), // 예측 확률을 가져오는 URL
                  child: Icon(Icons.send),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}