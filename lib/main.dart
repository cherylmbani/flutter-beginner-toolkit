import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HelloFlutterPage(),
    );
  }
}

class HelloFlutterPage extends StatefulWidget {
  const HelloFlutterPage({super.key});

  @override
  State<HelloFlutterPage> createState() => _HelloFlutterPageState();
}

class _HelloFlutterPageState extends State<HelloFlutterPage> {
  String text = "Hello Flutter!";
  bool changed = false;

  void changeText() {
    setState(() {
      if (changed) {
        text = "Hello Flutter!";
      } else {
        text = "Flutter is interactive!";
      }
      changed = !changed;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Hello Flutter App")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text,
              style: TextStyle(
                fontSize: changed ? 32 : 24,
                color: changed ? Colors.blue : Colors.black,
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: changeText,
              child: const Text("Press Me"),
            ),
          ],
        ),
      ),
    );
  }
}
