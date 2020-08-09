import 'package:flutter/material.dart';
import 'package:user_list/models/User.dart';

class UserTile extends StatelessWidget {
  final User user;

  const UserTile(this.user);

  @override
  Widget build(BuildContext context) {
    final avatar = user.avatarUrl == null || user.avatarUrl.isEmpty
        ? CircleAvatar(child: Icon(Icons.person))
        : CircleAvatar(backgroundImage: NetworkImage(user.avatarUrl));
    return ListTile(
      leading: avatar,
      title: Text(user.name),
      subtitle: Text(user.email),
      trailing: Container(
        width: 100,
        child: Row(
          children: <Widget>[
            IconButton(
                icon: Icon(
                  Icons.edit, 
                  color: Colors.blue),
                  onPressed: null),
            IconButton(
                icon: Icon(
                  Icons.delete,
                  color: Colors.red,),
                onPressed: null),
          ],
        ),
      ),
    );
  }
}
