import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'job.dart';
import 'job_details.dart';

class JobState extends State {
  final _suggestions = <Job>[];
  final _biggerFont = const TextStyle(fontSize: 18.0);
  final Set<Job> _saved = Set<Job>();
  List<Job> jobs;

  JobState({ Key key, @required this.jobs }) : super();

  @override
  Widget build(BuildContext context) {
    // print('jobs in the state ${this.jobs.toString()}');
    return Scaffold(
      appBar: AppBar(
        title: Text('Job results'),
        actions: <Widget>[      // Add 3 lines from here...
          IconButton(icon: Icon(Icons.list), onPressed: _pushSaved),
        ],
      ),
      body: _buildSuggestions(),
    );
  }

  void _pushSaved() {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (BuildContext context) {
          final Iterable<ListTile> tiles = _saved.map(
            (Job pair) {
              return ListTile(
                title: Text(
                  pair.toString(),
                  style: _biggerFont,
                ),
              );
            },
          );
          final List<Widget> divided = ListTile
            .divideTiles(
              context: context,
              tiles: tiles,
            )
            .toList();

          return Scaffold(
            appBar: AppBar(
              title: Text('Saved Jobs'),
            ),
            body: ListView(children: divided),
          );
        },
      ),
    );
  }

  Widget _buildSuggestions() {
    return ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemBuilder: (context, i) {
        if (i.isOdd) return Divider();

        final index = i ~/ 2;

        if (index >= _suggestions.length) {
          _suggestions.addAll(this.jobs);
        }
        return _buildRow(_suggestions[index]);
    });
  }

  Widget _buildRow(Job pair) {
    final bool alreadySaved = _saved.contains(pair);
    
    return ListTile(
      title: Text(
        pair.toString(),
        style: _biggerFont,
      ),
      trailing: Icon(
        alreadySaved ? Icons.favorite : Icons.favorite_border,
        color: alreadySaved ? Colors.red : null,
      ),
      onTap: () {
        setState(() {
          if (alreadySaved) {
            _saved.remove(pair);
          } else { 
            _saved.add(pair); 
          } 
        });
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => JobDetailScreen(job: pair),
          ),
        );
      },
    );
  }
}

class JobResults extends StatefulWidget {
  final List<Job> jobs;

  JobResults({ Key key, @required this.jobs }) :super(key: key);

  @override
  JobState createState() => JobState(jobs: jobs);
}

class JobResultsPage extends StatelessWidget {       
  @override            
  Widget build(BuildContext context) {
    List<Job> jobs = [];
    var names = generateWordPairs().take(10);
    names.forEach((element) => jobs.add(new Job('Flutter Engineer', 'Work at ${element.asPascalCase} doing cool stuff')));

    return Scaffold(            
      body: Center(
        child: JobResults(jobs: jobs),            
      ),
    );
  }
}
