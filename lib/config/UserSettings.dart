import 'package:flutter/material.dart';

import '../preferences/UserPreferences.dart';
import 'LoadResult.dart';

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
  String? dropdownValue = null;
  String enteredUser = '';
  String shownUser = '';

  List<String> spinnerItems = [];

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
        if (!spinnerItems.contains(enteredUser)) {
          setState(() {
            spinnerItems.add(enteredUser);
            dropdownValue = enteredUser;
          });
          UserPreferences.saveUserList(spinnerItems);
        }
        UserPreferences.saveUser(enteredUser);
        Navigator.of(context).pop();
      },
    );

    AlertDialog alert = AlertDialog(
      title: Text("Enter username"),
      content: TextField(
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

  Future<LoadResult> loadSavedData() async {
    var loadedUsersList = await UserPreferences.loadUserList();
    var loadedUser = await UserPreferences.loadUser();
    return LoadResult(loadedUsersList, loadedUser);
  }

  void initDropdownButton(LoadResult loadResult) {
    if (loadResult.loadedUsersList != null) {
      spinnerItems = loadResult.loadedUsersList!;
    }
    else {
      spinnerItems = [];
    }

    if (loadResult.loadedUser != null) {
      dropdownValue = loadResult.loadedUser!;
    }
    else {
      dropdownValue = null;
    }
  }

  Widget build(BuildContext context) {
    Future<LoadResult> _loadUsersFuture = loadSavedData();

    return Scaffold(
        body: Center(
            child: FutureBuilder(
                future: _loadUsersFuture,
                builder: (BuildContext context, AsyncSnapshot<LoadResult> snapshot) {
                  if (!snapshot.hasData || snapshot.data == null) {
                    spinnerItems = [];
                    dropdownValue = null;
                  } else {
                    var loadResult = snapshot.data!;
                    initDropdownButton(loadResult);
                  }
                  if (spinnerItems.isEmpty) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.center, // horizontale Ausrichtung innerhalb der Column
                      mainAxisSize: MainAxisSize.min, // vertikale Ausrichtung
                      children: <Widget>[
                        const Text('No users available'),
                        ElevatedButton(
                          onPressed: () async => await onPressed(context),
                          child: const Text('Create user'),
                        ),
                      ],
                    );
                  }
                  else {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.center, // horizontale Ausrichtung innerhalb der Column
                      mainAxisSize: MainAxisSize.min, // vertikale Ausrichtung
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
                              UserPreferences.saveUser(dropdownValue!);
                            });
                          },
                          items: spinnerItems.map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                        ElevatedButton(
                          onPressed: () async => await onPressed(context),
                          child: const Text('Create user'),
                        ),
                      ],
                    );
                  }
                }
            )
        )
    );
  }
}
