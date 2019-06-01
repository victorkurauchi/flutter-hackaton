import 'package:flutter/material.dart';
import 'dart:convert';
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

  String profileMark = """{
        "name": "Mark",
        "skills": ["Programing", "Statistics"],
        "biography": "My life history",
        "company": "CBA",
        "contactDetails": ["Phone: 0438 605 232", "Email: certifiedwaif@gmail.com"],
        "portfolio": ["https://github.com/certifiedwaif/"],
        "imageURL": "https://avatars1.githubusercontent.com/u/2517845?s=460&v=4"
    }""";

  String profileNootan =  """{
        "name": "Nootan",
        "skills": ["Android Developer", "Android"],
        "biography": "Frontend",
        "company": "The Iconic",
        "contactDetails": ["Phone: 1300 DOZEOFF", "Website: wat.dafuq.is/website"],
        "portfolio": ["https://github.com/nootanghimire"],
        "imageURL": "https://s.gravatar.com/avatar/3f9633df26b72c47c0680a2f82c7c1be?s=320"
    }""";

  String profileElmira = """{
        "name": "Elmira",
        "skills": ["sleeping"],
        "biography": "Slep is life",
        "company": "The Iconic",
        "contactDetails": ["Phone: 1300 NOFOLLOW", "Website: nofollow"],
        "portfolio": ["Awesome Android Project"],
        "imageURL": "https://via.placeholder.com/80"
  }""";

  String profileIryna = """{
        "name": "Iryna",
        "skills": ["Cooking Food", "Developing Stuff"],
        "biography": "Software Engineer",
        "company": "The Iconic",
        "contactDetails": ["Phone: 1300 NOFOLLOW", "Website: nofollow"],
        "portfolio": ["Awesome Android Project 2"],
        "imageURL": "https://via.placeholder.com/80"
  }""";

  @override
  void initState() {
    super.initState();
    _profiles.add(Profile.fromJson(jsonDecode(this.profileMark)));
    _profiles.add(Profile.fromJson(jsonDecode(this.profileNootan)));
    _profiles.add(Profile.fromJson(jsonDecode(this.profileElmira)));
    _profiles.add(Profile.fromJson(jsonDecode(this.profileIryna)));
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