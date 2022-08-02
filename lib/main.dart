import 'dart:async';
import 'dart:developer';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_trainning/main_page.dart';
import 'package:flutter_trainning/movie_ui.dart';
import 'package:flutter_trainning/slide_show.dart';

StreamController _controller = StreamController();
Stream _stream = _controller.stream;
late StreamSubscription sub;
void main() async {
  DateTime _time = DateTime.now();
  //Future=======
  // log("FUture delay started");
  // await Future.delayed(const Duration(seconds: 3));
  // log("Future Time ${_time.toIso8601String()}");

  runApp(const MyApp());
}

Stream<int> streamExample() async* {
//Stream ========
  log("Stream started");
  Timer.periodic(Duration(seconds: 5), (timer) {});
  await Future.delayed(const Duration(seconds: 3));
  log("future delayed elapsed");
  yield math.Random().nextInt(100);
  log("passed the data");
  streamExample();
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SliddeShow(),
    );
  }
}
