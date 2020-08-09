import 'package:flutter/material.dart';
import 'package:user_list/data/dummy_users.dart';
import 'package:user_list/models/User.dart';

class Users with ChangeNotifier{
  final Map<String, User> _items  = {... DUMMY_USERS};

  List<User> get all {
    return [..._items.values];
  }

  int get count {
    return _items.length;
  }
}