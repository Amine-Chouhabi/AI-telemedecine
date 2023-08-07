import 'package:flutter/material.dart';
import './communication.dart';

class PeopleListPage extends StatefulWidget {
  @override
  _PeopleListPageState createState() => _PeopleListPageState();
}

class _PeopleListPageState extends State<PeopleListPage> {
  List<String> people = ["Alice", "Bob", "Charlie"]; // Replace with real people names

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Select a Person'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: people.length,
          itemBuilder: (context, index) {
            return ListTile(
              contentPadding: EdgeInsets.all(10),
              leading: CircleAvatar(
                radius: 30,
                backgroundImage: AssetImage('assets/images/${people[index].toLowerCase()}.jpeg'),  // Assumes you have image files named after each person in your assets
              ),
              title: Text(people[index], style: TextStyle(fontSize: 20)),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CommunicationPage(person: people[index], imagePath: 'assets/images/${people[index].toLowerCase()}.jpeg')),
                );
              },

            );
          },
        ),
      ),
    );
  }
}
