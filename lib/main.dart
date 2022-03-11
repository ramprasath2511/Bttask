import 'package:bttask/Bloc/matches_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'Model/match.dart';
import 'Pages/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
   MyApp({Key? key}) : super(key: key);
Game _match = new Game(filters: Filters(permission: "TIER_ONE", dateFrom: DateFormat("yyyy-MM-dd").parse("2022-03-10"), dateTo: DateFormat("yyyy-MM-dd").parse("2022-03-20")), matches: [], count: 2);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider(
        create: (context) => MatchesBloc(MatchesState(matchElements: _match)),
        child: MyHomePage(title: 'BT FootBall'),
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
