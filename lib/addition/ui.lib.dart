import 'package:flutter/material.dart';

class UI {
  static Future<String> prompt(BuildContext context, String title, String body, String placeholder, { bool isPass = false }) {
      String data = '';
      bool isOk = true;
      
      return showDialog(
        context: context,
        builder: (BuildContext context) {
          return SimpleDialog(
            title: Text(title),
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(left: 25, right: 25, bottom: 10),
                child: Text(body)
              ),
              Padding(
                padding: EdgeInsets.only(left: 25, right: 25, bottom: 25),
                child: TextField(
                  obscureText: isPass,
                  autofocus: true,
                  decoration: InputDecoration(
                    // labelText: body,
                    hintText: placeholder,
                  ),
                  onChanged: (text) {
                    data = text;
                  }
                )
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  FlatButton(
                    child: Text('OK'),
                    onPressed: () {
                      isOk = true;
                      Navigator.of(context).pop();
                    }
                  ),
                  FlatButton(
                    child: Text('Cancel'),
                    onPressed: () {
                      isOk = false;
                      Navigator.of(context).pop();
                    }
                  )
                ]
              )
            ]
          );
        }
      ).then((val) {
        if(isOk) {
          return data;
        }

        if(isOk == false) {
          throw Exception('Typed nothing');
        }
      });
    }

    static showAlert(
      String body, 
      BuildContext context, 
      { String title, String btnName, VoidCallback onResolve, bool showCancel = false, VoidCallback onDismiss }
    ) {

      bool clicked = false;

      if(title == null || title.isEmpty) {
        title = 'Alert';
      }

      if(btnName == null || btnName.isEmpty) {
        btnName = 'OK';
      }

      print('title is: $title');
      print('btnName is: $btnName');

      AlertDialog dialog = new AlertDialog(
        title: new Text(title), 
        content: new Text(body),
        actions: <Widget>[
          FlatButton(child: new Text(btnName), onPressed: () {
            Navigator.of(context).pop(); // Hides the Alert
            clicked = true;
            
            if(onResolve != null) {
              onResolve();
            }
          }),
          showCancel ? 
            FlatButton(child: new Text('Cancel'), onPressed: () {
              Navigator.of(context).pop(); // Hides the Alert
              clicked = true;
              
              if(onDismiss != null){
                onDismiss();
              }
            })
          :
            SizedBox()
        ]
      );

      showDialog(context: context, builder: (BuildContext context) => dialog).then((val) {
        if(!clicked) {
          print('clicked outside');
          
          if(onDismiss != null){
            onDismiss();
          }
        }
      });
    }
  }