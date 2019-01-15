import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

import './model/user.dart';
import './UserDetail.dart';

class HomePage extends StatefulWidget {
  HomePage();

  factory HomePage.forDesignTime() {
    // TODO: add arguments
    return new HomePage();
  }

  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: FutureBuilder<List<User>>(
      future: _fetchUser(),
      builder: (context, snap) {
        if (snap.hasData) {
          return ListView.builder(
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                onTap: () => _pressItem(snap.data[index]),
                child: Card(
                  margin: EdgeInsets.all(10.0),
                  child: Column(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Image.network(snap.data[index].avatartUrl,
                                width: 50.0),
                          ),
                          Text(snap.data[index].name)
                        ],
                      ),
                      Text(snap.data[index].followersUrl),
                      Divider()
                    ],
                  ),
                ),
              );
            },
            itemCount: snap.data.length,
          );
        }
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    ));
  }

  Future<List<User>> _fetchUser() async {
//    final response = await http.get('https://api.github.com/users');
//    List responseDecode = json.decode(response.body);
    return _mapObject();
  }

  List<User> _mapObject() {
    List<User> userList = List();
    for (int i = 0; i < 10; i++) {
      User user = User(
          id: i,
          name: "name $i",
          avatartUrl: "avatartUrl $i",
          followersUrl: "followersUrl $i");
      userList.add(user);
    }

    return userList;
  }

  _pressItem(User data) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => UserDetail(name: data.name)),
    );
  }
}
