import 'package:flutter/material.dart';
import '../constants/colors.dart';

class Message {
  final String content;
  final bool sentByUser;

  Message({required this.content, required this.sentByUser});
}

class CommunicationPage extends StatefulWidget {
  final String person;
  final String imagePath;

  CommunicationPage({Key? key, required this.person, required this.imagePath}) : super(key: key);

  @override
  _CommunicationPageState createState() => _CommunicationPageState();
}

class _CommunicationPageState extends State<CommunicationPage> {
  final myController = TextEditingController();
  List<Message> messages = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: tdBGColor,
        elevation: 0,
        title: Row(
          children: [
            CircleAvatar(
              radius: 20,
              backgroundImage: AssetImage(widget.imagePath),
            ),
            SizedBox(width: 10),
            Text(
              widget.person,
              style: TextStyle(fontSize: 22, color: tdBlack),
            ),
          ],
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                reverse: true,
                itemCount: messages.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.symmetric(vertical: 10),
                    child: Row(
                      mainAxisAlignment:
                      messages[index].sentByUser ? MainAxisAlignment.end : MainAxisAlignment.start,
                      children: [
                        if (!messages[index].sentByUser)
                          CircleAvatar(
                            radius: 20,
                            backgroundImage: AssetImage(widget.imagePath),
                          ),
                        SizedBox(width: 10),
                        Flexible(
                          child: Container(
                            padding: EdgeInsets.all(15),
                            decoration: BoxDecoration(
                              color: messages[index].sentByUser ? tdBlue : Colors.grey[200],
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Text(
                              messages[index].content,
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                        ),
                        SizedBox(width: 10),
                        if (messages[index].sentByUser)
                          CircleAvatar(
                            radius: 20,
                            backgroundImage: AssetImage('assets/images/avatar.jpeg'),
                          ),
                      ],
                    ),
                  );
                },
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: myController,
                    decoration: InputDecoration(
                      hintText: 'Type your message here',
                      filled: true,
                      fillColor: Colors.grey[200],
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send),
                  onPressed: () {
                    setState(() {
                      messages.insert(0, Message(content: myController.text, sentByUser: true));
                      myController.clear();
                    });
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
