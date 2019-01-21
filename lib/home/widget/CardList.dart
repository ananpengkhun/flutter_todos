import 'package:flutter/material.dart';

class CardList extends StatelessWidget {
  final String avatartUrl;
  final String name;
  final String followersUrl;

  CardList(this.avatartUrl, this.name, this.followersUrl);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Card(
      margin: EdgeInsets.all(10.0),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(10.0),
                child: Image.network(avatartUrl, width: 50.0),
              ),
              Text(name)
            ],
          ),
          Text(followersUrl),
          Divider()
        ],
      ),
    );
  }
}
