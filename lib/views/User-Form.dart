import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:user_list/models/User.dart';
import 'package:user_list/provider/Users.dart';

class UserForm extends StatelessWidget {

  final _form = GlobalKey<FormState>();
  final Map<String, String> _formData = {};

  void _loadFormData(User user){
    _formData['id'] = user.id;
    _formData['name'] = user.name;
    _formData['email'] = user.email;
    _formData['avatarUrl'] = user.avatarUrl;

  }

  @override
  Widget build(BuildContext context) {

    final User user = ModalRoute.of(context).settings.arguments;

    _loadFormData(user);

    return Scaffold(
      appBar: AppBar(
        title: Text("Form user"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () { 
              final isValid = _form.currentState.validate();
              
              if(isValid){
                _form.currentState.save();
                Provider.of<Users>(context, listen: false).put(User(
                  id: _formData['id'],
                  name: _formData['name'],
                  email: _formData['email'],
                  avatarUrl: _formData['avatarUrl'],
                ));
                Navigator.of(context).pop();
              }

            },
          )
        ],
      ),
      body: Padding(padding: EdgeInsets.all(20),
        child: Form(
          key: _form,
          child: Column(
            children: <Widget>[
              TextFormField(
                initialValue: _formData['name'],
                validator: (value){
                  if(value == null || value.isEmpty){
                    return 'Include your name';
                  }

                  if (value.trim().length < 3){
                    return 'Name too small';
                  }
                },
                onSaved: (value) => _formData['name'] = value,
                decoration: InputDecoration(labelText: 'Name'),
              ),
              TextFormField(
                initialValue: _formData['email'],
                onSaved: (value) => _formData['email'] = value,                
                decoration: InputDecoration(labelText: 'e-mail'),
              ),
              TextFormField(
                initialValue: _formData['avatarUrl'],
                onSaved: (value) => _formData['avatarUrl'] = value,
                decoration: InputDecoration(labelText: 'Avatar URL'),
              ),
            ],
          )
        ),
      ),
      
    );
  }
}