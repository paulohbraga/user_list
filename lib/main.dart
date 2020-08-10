import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:user_list/provider/Users.dart';
import 'package:user_list/routes/AppRoutes.dart';
import 'package:user_list/views/User-Form.dart';
import 'package:user_list/views/UserList.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => Users()
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.teal,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        routes: {
          AppRoutes.HOME: (_) => UserList(),
          AppRoutes.USER_HOME: (_) => UserForm(),
        },
      ),
    );
  }
}
