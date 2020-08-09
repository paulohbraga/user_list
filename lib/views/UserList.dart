import 'package:flutter/material.dart';
import 'package:user_list/components/UserTile.dart';
import 'package:user_list/data/dummy_users.dart';

class UserList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final users = {...DUMMY_USERS};

    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[IconButton(icon: Icon(Icons.add), onPressed: null)],
        title: Text('User list management'),
      ),
      body: ListView.builder(
        itemBuilder: (context, i) => UserTile(users.values.elementAt(i)),
        itemCount: users.length,
      ),
    );
  }
}
