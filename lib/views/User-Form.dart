import 'package:flutter/material.dart';

class UserForm extends StatelessWidget {

  final _form = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
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
                validator: (value){
                  if(value == null || value.isEmpty){
                    return 'Include your name';
                  }

                  if (value.trim().length < 3){
                    return 'Name too small';
                  }
                },
                onSaved: (value){
                  print(value);
                },
                decoration: InputDecoration(labelText: 'Name'),
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'e-mail'),
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Avatar URL'),
              ),
            ],
          )
        ),
      ),
      
    );
  }
}