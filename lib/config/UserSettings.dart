import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserSettings extends StatelessWidget {
  const UserSettings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User settings'),
      ),
      body: Center(
        child: DropDown()
      ),
    );
  }
}

class DropDown extends StatefulWidget {
  @override
  DropDownWidget createState() => DropDownWidget();
}

class DropDownWidget extends State {
  String dropdownValue = 'Luqman';
  String enteredUser = '';
  String shownUser = '';

  List<String> spinnerItems = [
    'Luqman',
    'Arber',
    'Cris',
    'Romano'
  ];

  Future onPressed(BuildContext context) async {
    Widget cancelButton = TextButton(
      child: const Text("Cancel"),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );

    Widget okButton = TextButton(
      child: const Text("OK"),
      onPressed: () {
        setState(() {
          spinnerItems.add(enteredUser);
          dropdownValue = enteredUser;
        });

        saveUser(enteredUser);
        Navigator.of(context).pop();
      },
    );

    AlertDialog alert = AlertDialog(
      title: Text("Enter username"),
      content: TextField (
        onChanged: (text) {
          enteredUser = text;
        },
      ),
      actions: [
        cancelButton,
        okButton,
      ],
    );

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      }
    );
  }

  Future showUser() async {
    String? loadedUser = await loadUser();
    if (loadedUser != null) {
      setState(() {
        shownUser = loadedUser;
      });
    }
  }

  Future saveUser(String username) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('selectedUser', username);
  }

  Future<String?> loadUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var loadedUser = prefs.getString('selectedUser');
    return loadedUser;
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: <Widget>[
            DropdownButton(
              value: dropdownValue,
              icon: Icon(Icons.arrow_drop_down),
              iconSize: 24,
              elevation: 16,
              style: TextStyle(color: Colors.black, fontSize: 18),
              underline: Container(
                height: 2,
                color: Colors.deepPurpleAccent,
              ),
              onChanged: (data) {
                setState(() {
                  dropdownValue = data!;
                });
              },
              items: spinnerItems.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            Text(
              'Selected Item = ' + '$dropdownValue',
              style: TextStyle(
                fontSize: 22,
                color: Colors.black
              )
            ),
            ElevatedButton(
              onPressed: () async => await onPressed(context),
              child: const Text('Create user'),
            ),
            ElevatedButton(
              onPressed: () async {
                await showUser();
              },
              child: const Text('Show user'),
            ),
            Text(
                'Selected user = ' + shownUser,
                style: TextStyle(
                    fontSize: 22,
                    color: Colors.black
                )
            ),
          ],
        )
      )
    );
  }
}