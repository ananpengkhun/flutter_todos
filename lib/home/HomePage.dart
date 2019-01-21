import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

import './model/user.dart';
import './UserDetail.dart';
import './viewmodel/HomeViewModel.dart';
import './widget/CardList.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<HomeViewModel>(
      builder: (context, child, model) {
        return FutureBuilder<List<User>>(
          future: model.user,
          builder: (_, AsyncSnapshot<List<User>> snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
              case ConnectionState.active:
              case ConnectionState.waiting:
                return Center(child: CircularProgressIndicator());
              case ConnectionState.done:
                if (snapshot.hasData) {
                  return ListView.builder(
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                        onTap: () => _pressItem(snapshot.data[index]),
                        child: CardList(
                            snapshot.data[index].avatartUrl,
                            snapshot.data[index].name,
                            snapshot.data[index].followersUrl),
                      );
                    },
                    itemCount: snapshot.data.length,
                  );
                }
            }
          },
        );
      },
    );
  }

  _pressItem(User data) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => UserDetail(name: data.name)),
    );
  }
}
