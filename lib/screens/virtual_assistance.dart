import 'package:flutter/material.dart';
import '../constants/colors.dart';

class VirtualAssistantPage extends StatefulWidget {
  @override
  _VirtualAssistantPageState createState() => _VirtualAssistantPageState();
}

class _VirtualAssistantPageState extends State<VirtualAssistantPage> {
  List<String> _interactions = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: tdBGColor,
      appBar: _buildAppBar(),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: _interactions.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(
                      _interactions[index],
                      style: TextStyle(
                          fontSize: 18,
                          color: tdGrey
                      ),
                    ),
                  );
                },
              ),
            ),
            GestureDetector(
              onLongPress: () {
                // Start listening to the user
              },
              onLongPressUp: () {
                // Stop listening to the user
              },
              child: Container(
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: tdBlue,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Center(
                  child: Text(
                    "Hold to Speak",
                    style: TextStyle(
                      color: tdBlack,
                      fontSize: 24,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ),
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
              child: Image.asset('assets/images/avatar.jpeg'),
            ),
          ),
        ],
      ),
    );
  }
}
