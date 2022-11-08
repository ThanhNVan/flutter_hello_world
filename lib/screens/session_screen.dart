import 'package:flutter/material.dart';
import '../data/sp_helper.dart';
import '../data/session.dart';

class SessionScreen extends StatefulWidget {
  const SessionScreen({super.key});

  @override
  State<SessionScreen> createState() => _SessionScreenState();
}

class _SessionScreenState extends State<SessionScreen> {
  List<Session> sessions = [];

  final TextEditingController txtDescription = TextEditingController();
  final TextEditingController txtDuration = TextEditingController();
  final SPHelper helper = SPHelper();

  @override
  void initState() {
    helper.init().then((value) {
      updateScreen();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal[50],
      appBar: AppBar(
        title: Text(
          'Your Training Sessions',
          textAlign: TextAlign.center,
        ),
      ),
      body: ListView(
        children: getContent(),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          showSessionDialog(context);
        },
      ),
    );
  }

  Future<dynamic> showSessionDialog(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(
              "Insert Training Session",
              style: TextStyle(backgroundColor: Colors.teal[100]),
            ),
            content: SingleChildScrollView(
                child: Column(
              children: [
                TextField(
                    controller: txtDescription,
                    decoration: InputDecoration(
                      hintText: 'Description',
                    )),
                TextField(
                  controller: txtDuration,
                  decoration: InputDecoration(
                    hintText: 'Duration',
                  ),
                )
              ],
            )),
            actions: [
              TextButton(
                onPressed: () {
                  txtDescription.text = '';
                  txtDuration.text = '';

                  Navigator.pop(context);
                },
                child: Text('Cancel'),
              ),
              ElevatedButton(onPressed: saveSession, child: Text('Save'))
            ],
          );
        });
  }

  Future saveSession() async {
    DateTime now = DateTime.now();
    String today = '${now.year} - ${now.month} - ${now.day}';
    int id = helper.getCounter() + 1;
    Session newSession = Session(
        id, today, txtDescription.text, int.tryParse(txtDuration.text) ?? 0);

    helper.writeSession(newSession).then((_) {
      this.updateScreen();
      helper.setCounter();
    });
    txtDescription.text = '';
    txtDuration.text = '';

    Navigator.pop(context);
  }

  List<Widget> getContent() {
    List<Widget> titles = [];
    sessions.forEach((session) {
      titles.add(Dismissible(
        key: UniqueKey(),
        onDismissed: (_) {
          helper.removeSession(session.id);
        },
        child: ListTile(
          title: Text(session.description),
          subtitle:
              Text('${session.date} - Duration: ${session.duration} minute(s)'),
        ),
      ));
    });
    return titles;
  }

  void updateScreen() {
    sessions = helper.getSession();
    setState(() {});
  }
}
