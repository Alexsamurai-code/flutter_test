import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Test Application'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Color _color = const Color.fromRGBO(255, 255, 255, 1);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Center(child: Text(widget.title)),
        ),
        body: SizedBox(
          height: double.infinity,
          child: GestureDetector(
            onTap: () {
              setState(() {
                final random = Random();

                _color = Color.fromRGBO(
                  random.nextInt(256),
                  random.nextInt(256),
                  random.nextInt(256),
                  1,
                );
                // print(_color);
              });
            },
            child: AnimatedContainer(
              decoration: BoxDecoration(
                color: _color,
              ),
              duration: const Duration(seconds: 1),
              curve: Curves.fastOutSlowIn,
              child: const SizedBox(
                width: double.infinity,
                child: Center(
                    child: Text(
                  'Hey there',
                  style: TextStyle(fontSize: 40),
                )),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
