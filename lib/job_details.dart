import 'package:flutter/material.dart';
import 'job.dart';

class JobDetailScreen extends StatelessWidget {
  final Job job;
  final _biggerFont = const TextStyle(fontSize: 18.0);

  JobDetailScreen({ Key key, @required this.job }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Details for ${job.title}"),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Text(job.description, style: _biggerFont),
      ),
    );
  }
}
