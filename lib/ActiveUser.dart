import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';

class UserDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'TEST',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new MyHomePage(
        title: 'Users List'
        
      ),
      
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Future<List<User>> _getUsers() async {
    var data = await http.get("https://reqres.in/api/users?page=2");
    List<User> users = [];
    if(data.statusCode==200){
    var jsonData = json.decode(data.body.toString());
    for(var u in jsonData["data"] as List){
      User user = User(u["id"], u["email"], u["first_name"], u["last_name"], u["avatar"]);
      users.add(user);
    }
    }
    print(users.length);
    return users;
  
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      body: Container(
          child: FutureBuilder(
            future: _getUsers(),
            builder: (BuildContext context, AsyncSnapshot snapshot){
              print(snapshot.data);
              if(snapshot.data == null){
                return Container(
                  child: Center(
                    child: Text("Loading...")
                  )
                );
              } else {
                return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage(
                          snapshot.data[index].avatar
                        ),
                      ),
                      title: Text(snapshot.data[index].firstname),
                      subtitle: Text(snapshot.data[index].email),
                      
                      onTap: (){
                        Navigator.push(context,MaterialPageRoute(builder: (context) => DetailPage(snapshot.data[index])));
                        //Navigator.push(context, 
                         // new MaterialPageRoute(builder: (context) => DetailPage(snapshot.data[index]))
                        //);

                      },
                    );
                  },
                );
              }
            },
          ),
        ),
      );
  }
}

class DetailPage extends StatelessWidget {
  final User user;
  DetailPage(this.user);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(user.firstname),
        )
    );
  }
}

class User {
  final int id;
  final String email;
  final String firstname;
  final String lastname;
  final String avatar;
  User(this.id, this.email, this.firstname, this.lastname, this.avatar);

}