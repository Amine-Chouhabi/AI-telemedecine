import 'package:flutter/material.dart';
import '../constants/colors.dart';

class TelemedicinePage extends StatefulWidget {
  @override
  _TelemedicinePageState createState() => _TelemedicinePageState();
}

class _TelemedicinePageState extends State<TelemedicinePage> {
  List<Map<String, dynamic>> appointments = [
    {"title": "Appointment 1", "datetime": "03/08/2023 at 10:30"},
    {"title": "Appointment 2", "datetime": "05/08/2023 at 14:00"},
    {"title": "Appointment 3", "datetime": "07/08/2023 at 09:00"},
    {"title": "Appointment 4", "datetime": "10/08/2023 at 15:30"},
    {"title": "Appointment 5", "datetime": "12/08/2023 at 11:00"},
  ];

  Future<void> _showAddAppointmentDialog() async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now().subtract(Duration(days: 1)),
      lastDate: DateTime.now().add(Duration(days: 365)),
    );

    TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (pickedDate != null && pickedTime != null) {
      String formattedDate = "${pickedDate.day}/${pickedDate.month}/${pickedDate.year}";
      String formattedTime = "${pickedTime.hour}:${pickedTime.minute.toString().padLeft(2, '0')}";
      String newAppointment = "$formattedDate at $formattedTime";

      setState(() {
        appointments.insert(0, {"title": "New Appointment", "datetime": newAppointment});
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: tdBGColor,
      appBar: AppBar(
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
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          children: [
            Text('Your Appointments',
                style: TextStyle(fontSize: 30, color: tdBlack)),
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: appointments.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      leading: Icon(Icons.calendar_today),
                      title: Text(appointments[index]["title"]),
                      subtitle: Text(appointments[index]["datetime"]),
                      trailing: ElevatedButton(
                        onPressed: () {
                          // Add function to join the call
                        },
                        child: Text('Join'),
                        style: ElevatedButton.styleFrom(primary: tdBlue),
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _showAddAppointmentDialog,
              child: Text('Schedule New Appointment',
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
      ),
    );
  }
}
