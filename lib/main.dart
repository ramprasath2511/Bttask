import 'package:bttask/Bloc/matches_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'Model/match.dart';
import 'Pages/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  Game? _match;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BT Task',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider(
        create: (context) => MatchesBloc(MatchesState(matchElements: _match)),
        child: const MyHomePage(title: 'BT FootBall'),
      ),
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
        backgroundColor: const Color(0xFF6E62FF),
      ),
      body: const Center(
        child: MatchListScreen(), //MatchList(),
      ),
    );
  }
}
