import 'package:flutter/material.dart';
import 'profile_results.dart';
import 'profile.dart';

class ResultView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ResultViewState();
  }
}

class _ResultViewState extends State<ResultView> {
  List<Profile> _profiles = [];


  @override
  void initState() {
    super.initState();
    _profiles.add(new Profile(
      'Nootan Ghimire',
      ['Cooking Food', 'Flutter'],
      'Stupidest Guy ever',
      'The Iconic',
      ['@donotfollowme'],
      ['t1', 't2']
    ));
    _profiles.add(new Profile(
        'Nootan Ghimire 2',
        ['Cooking Food', 'Flutter'],
        'Stupidest Guy ever',
        'The Iconic',
        ['@donotfollowme'],
        ['t1', 't2']
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Results"),
      ),
      body: Center(
        child: ProfileResults(_profiles)
      )
    );
  }
}