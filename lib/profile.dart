import 'dart:convert';

class Profile {
  String name;
  List<String> skills;
  String biography;
  String company;
  List<String> contactDetails;
  List<String> portfolio;
  String imageURL;

  Profile(
    this.name,
    this.skills,
    this.biography,
    this.company,
    this.contactDetails,
    this.portfolio,
    this.imageURL,
  );

  Profile.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        skills = json['skills'],
        biography = json['biography'],
        company = json['company'],
        contactDetails = json['contactDetails'],
        portfolio = json['portfolio'],
        imageURL = json['imageURL'];

  Map<String, dynamic> toJson() => {
        //return jsonEncode(profile);
        'name': name,
        'skills': skills,
        'biography': biography,
        'company': company,
        'contactDetails': contactDetails,
        'portfolio': portfolio,
        'imageURL': imageURL,
      };
}

// Example code
void jsonEncodeDecodeExample() {
  final jsonString = """{
        name: 'Mark',
        skills: ['Programing', 'Statistics'],
        biography: 'My life history',
        company: 'CBA',
        contactDetails: ['Phone: 0438 605 232', 'Email: certifiedwaif@gmail.com'],
        portfolio: ['https://github.com/certifiedwaif/'],
        imageURL: 'https://avatars1.githubusercontent.com/u/2517845?s=460&v=4'
    }""";
  Map profileMap = jsonDecode(jsonString);
  var profile = Profile.fromJson(profileMap);

  print('Hi, ${profile.name}!');
  print('Your skills are ${profile.skills}.');

  String json = jsonEncode(profile);
}
