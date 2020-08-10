import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:user_list/components/UserTile.dart';
import 'package:user_list/models/User.dart';
import 'package:user_list/provider/Users.dart';
import 'package:user_list/routes/AppRoutes.dart';

class UserList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
    final Users users = Provider.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('User list management'),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.add),
          onPressed: () { 
            Navigator.of(context).pushNamed(AppRoutes.USER_HOME);
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemBuilder: (context, i) => UserTile(users.byIndex(i)),
        itemCount: users.count,
      ),
    );
  }
}
