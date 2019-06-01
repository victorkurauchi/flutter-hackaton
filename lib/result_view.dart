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
      'React',
      'The Iconic',
      ['@donotfollowme'],
      ['t1', 't2'],
      'https://via.placeholder.com/200'
    ));
    _profiles.add(new Profile(
        'Nootan Ghimire 2',
        ['Cooking Food', 'Flutter'],
        'Frontend',
        'The Iconic',
        ['@donotfollowme'],
        ['t1', 't2'],
      'https://via.placeholder.com/200'
    ));
    _profiles.add(new Profile(
        'Elmira',
        ['Android Developer', 'Abdroid'],
        'Android Developer',
        'The Iconic',
        ['@Elmira'],
        ['t1', 't2'],
        'https://via.placeholder.com/200'
    ));
    _profiles.add(new Profile(
        'Iryna',
        ['Cooking Food', 'Developing stuff'],
        'Software engeneer',
        'The Iconic',
        ['@donotfollowme'],
        ['t1', 't2'],
        'https://via.placeholder.com/200'
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Results"),
      ),
      body: Center(
        child: ProfileResults(_profiles),
      )
    );
  }
}