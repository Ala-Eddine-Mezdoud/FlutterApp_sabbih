import 'package:flutter/material.dart';
import 'package:sabbih/button.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int nums = 0;

  void add() async {
    setState(() {
      nums += 1;
    });
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt('nums', nums);
  }

  void loadnums() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      nums = prefs.getInt('nums') ?? 0;
    });
  }

  @override
  void initState() {
    super.initState();
    loadnums();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green[900],
          title: Container(
            padding: EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  "سبحة",
                  style: TextStyle(
                      fontSize: 38,
                      color: const Color.fromARGB(255, 255, 255, 255)),
                ),
              ],
            ),
          ),
        ),
        body: Container(
          padding: EdgeInsets.all(20),
          decoration:
              BoxDecoration(color: const Color.fromARGB(255, 33, 30, 30)),
          width: double.infinity,
          height: double.infinity,
          child: Column(
            children: [
              Expanded(
                flex: 9,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'استغفر الله',
                      style: TextStyle(fontSize: 32),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "$nums",
                      style: TextStyle(fontSize: 40),
                    )
                  ],
                ),
              ),
              MyButton(add: add),
            ],
          ),
        ),
      ),
    );
  }
}
