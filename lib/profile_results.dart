import 'package:flutter/material.dart';
import 'profile.dart';
import 'profile_details.dart';

class ProfileResults extends StatelessWidget {
  final List<Profile> profiles;

  ProfileResults(this.profiles);

  Widget _buildProfileItem(BuildContext context, int index) {
    return InkWell(
      onTap: (){
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ProfileDetails()),
        );
      },
      child: Card(
        child: Column(
          children: <Widget>[
            Text(profiles[index].name),
            Text(profiles[index].biography)
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: _buildProfileItem,
      itemCount: profiles.length,
    );
  }

}