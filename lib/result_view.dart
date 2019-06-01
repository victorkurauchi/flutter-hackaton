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
        "name": "Mark Greenaway",
        "skills": ["Programing", "Statistics"],
        "biography": "My life history",
        "company": "CBA",
        "contactDetails": ["Phone: 0438 605 232", "Email: certifiedwaif@gmail.com"],
        "portfolio": ["https://github.com/certifiedwaif/"],
        "imageURL": "assets/mark.jpg"
    }""";

  String profileNootan =  """{
        "name": "Nootan Ghimire",
        "skills": ["sleeping"],
        "biography": "Sleep is life",
        "company": "The Iconic",
        "contactDetails": ["Phone: 1300 DOZEOFF", "Website: wat.dafuq.is/website"],
        "portfolio": ["https://github.com/nootanghimire"],
        "imageURL": "assets/nootan.jpg"
    }""";

  String profileVictor =  """{
        "name": "Victor Kurauchi",
        "skills": ["Android Developer", "Android", "Flutter"],
        "biography": "Frontend",
        "company": "The Iconic",
        "contactDetails": ["Phone: 1300 DOZEOFF", "Website: wat.dafuq.is/website"],
        "portfolio": ["https://github.com/nootanghimire"],
        "imageURL": "assets/victor.jpg"
    }""";

  String profileElmira = """{
        "name": "Elmira Asadzadeh",
        "skills": ["Flutter", "Android"],
        "biography": "Coffee is life. Flutter proficient",
        "company": "The Iconic",
        "contactDetails": ["Phone: 1300 NOFOLLOW", "Website: nofollow"],
        "portfolio": ["Awesome Android Project"],
        "imageURL": "assets/elmira.jpg"
  }""";

  String profileIryna = """{
        "name": "Iryna",
        "skills": ["Cooking Food", "Developing Stuff", "Flutter"],
        "biography": "Software Engineer",
        "company": "The Iconic",
        "contactDetails": ["Phone: 1300 NOFOLLOW", "Website: nofollow"],
        "portfolio": ["Awesome Android Project 2"],
        "imageURL": "assets/iryna.jpg"
  }""";

  @override
  void initState() {
    super.initState();
    _profiles.add(Profile.fromJson(jsonDecode(this.profileNootan)));
    _profiles.add(Profile.fromJson(jsonDecode(this.profileMark)));
    _profiles.add(Profile.fromJson(jsonDecode(this.profileElmira)));
    _profiles.add(Profile.fromJson(jsonDecode(this.profileIryna)));
    _profiles.add(Profile.fromJson(jsonDecode(this.profileVictor)));
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