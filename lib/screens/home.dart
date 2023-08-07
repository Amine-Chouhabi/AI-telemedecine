import 'package:flutter/material.dart';
import '../constants/colors.dart';
import './todo.dart';
import './virtual_assistance.dart';
import './people.dart';
import './telemedecine.dart';
class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String userName = "Richard";

  @override
  Widget build(BuildContext context) {
    String formattedDate = "01/09/2023";
    String formattedTime = "08:00";

    return Scaffold(
      backgroundColor: tdBGColor,
      appBar: _buildAppBar(),
      body: Stack(
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
              child: Column(
                children: <Widget>[
                  Text('Good Morning, $userName',
                      style: TextStyle(fontSize: 30, color: tdBlack)),
                  SizedBox(height: 10),
                  Text('$formattedDate, $formattedTime',
                      style: TextStyle(fontSize: 24, color: tdGrey)),
                  SizedBox(height: 20),
                  _buildCard(
                    title: 'Alerts',
                    children: [
                      Text('You have a doctor appointment at 3 PM today.',
                          style: TextStyle(fontSize: 18, color: tdGrey)),
                      Text("It's time to take your morning medication.",
                          style: TextStyle(fontSize: 18, color: tdGrey)),
                    ],
                    cardColor: Colors.orange[100]!, // Light Orange Color
                  ),
                  SizedBox(height: 20),
                  _buildCard(
                    title: 'Activities',
                    children: [
                      Text("Today's suggested activity: 20-minute walk.",
                          style: TextStyle(fontSize: 18, color: tdGrey)),
                    ],
                    cardColor: Colors.green[100]!, // Light Green Color
                  ),
                  Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => ToDoPage()),
                          );
                        },
                        child: Text('To-Do List',
                            style: TextStyle(color: tdBlack, fontSize: 24)),
                        style: ElevatedButton.styleFrom(
                          primary: tdBlue,
                          padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => TelemedicinePage()),
                          );
                        },
                        child: Text('Schedule Appointment',
                            style: TextStyle(color: tdBlack, fontSize: 24)),
                        style: ElevatedButton.styleFrom(
                          primary: tdBlue,
                          padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 10,
            right: 10,
            child: FloatingActionButton(
              onPressed: () {
                print("Emergency Button Pressed!"); // For now, it's just printing a statement.
              },
              child: Icon(
                Icons.call,
                color: Colors.white,
                size: 40,
              ),
              backgroundColor: Colors.red,
            ),
          ),
        ],
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => VirtualAssistantPage()),
              );
            },
            child: Icon(
              Icons.mic,
              color: tdBlack,
              size: 30.0,
            ),
            backgroundColor: tdBlue,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
          ),
          SizedBox(height: 20),
          FloatingActionButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => PeopleListPage()),
              );
            },
            child: Icon(
              Icons.chat_bubble,
              color: tdBlack,
              size: 30.0,
            ),
            backgroundColor: tdBlue,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCard({required String title, required List<Widget> children, required Color cardColor}) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      color: cardColor,
      elevation: 5,
      child: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(fontSize: 22, color: tdBlack, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            ...children,
          ],
        ),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: tdBGColor,
      elevation: 0,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(
            Icons.menu,
            color: tdBlack,
            size: 30,
          ),
          Container(
            height: 40,
            width: 40,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset('assets/images/img.png'),
            ),
          ),
        ],
      ),
    );
  }
}
