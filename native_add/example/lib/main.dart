import 'package:flutter/material.dart';
import 'dart:async';

import 'package:native_add/native_add.dart' as native_add;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late int sumResult;
  late Future<int> sumAsyncResult;

  @override
  void initState() {
    super.initState();
    sumResult = native_add.sum(1, 2);
    sumAsyncResult = native_add.sumAsync(3, 4);
  }

  @override
  Widget build(BuildContext context) {
    const textStyle = TextStyle(fontSize: 25);
    const spacerSmall = SizedBox(height: 10);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.blueGrey,
          title: const Text('Native Packages'),
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(10),
            child: Center(
              child: Column(
                children: [
                  const Text(
                    'Flutter ile FFI denemeleri',
                    style: TextStyle(color: Colors.red, fontSize: 24),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  spacerSmall,
                  Text(
                    'sum(1, 2) = $sumResult',
                    style: textStyle,
                    textAlign: TextAlign.center,
                  ),
                  spacerSmall,
                  FutureBuilder<int>(
                    future: sumAsyncResult,
                    builder: (BuildContext context, AsyncSnapshot<int> value) {
                      final displayValue =
                          (value.hasData) ? value.data : 'loading';
                      return Text(
                        'sumAsync(3, 4) = $displayValue',
                        style: textStyle,
                        textAlign: TextAlign.center,
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
