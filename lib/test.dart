import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


class Test extends StatelessWidget {

  void setValues() async {
    SharedPreferences sharedPrefs = await SharedPreferences.getInstance();
    // set values

    sharedPrefs.setString('user_name', 'mayuri24');
    sharedPrefs.setString('user_id', '1087');
    sharedPrefs.setString('notification_prefs', 'on');
    print('Values Set in Shared Prefs!!');
  }
  

  void getValues() async {
    print('Getting Values from shared Preferences');
    SharedPreferences sharedPrefs = await SharedPreferences.getInstance();
    String userName = sharedPrefs.getString('user_name');
     String userId = sharedPrefs.getString('user_id');
     String notificationPrefs = sharedPrefs.getString('notification_prefs');

     print('user_name: $userName');
     print('user_id: $userId');
     print('notification_prefs: $notificationPrefs');
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Shared Prefs Demo'),),
      body: Column(
        children: <Widget>[
          Container(child: RaisedButton(
            child: Text('Set Values'), textColor: Colors.white,color: Colors.blueAccent,
            onPressed: () async{
              setValues();
            },
          ),),

            Container(child: RaisedButton(
            child: Text('Get Values'), textColor: Colors.white,color: Colors.blueAccent,
            onPressed: () async{
              getValues();
            },
          ),),

        ],
      ),
    );
  }
}