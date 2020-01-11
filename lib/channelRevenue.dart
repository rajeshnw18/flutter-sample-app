import 'package:flutter/material.dart';
import 'dart:io';

class ChannelRegionReport extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<ChannelRegionReport> {
  final _formKey = GlobalKey<FormState>();
  final firstnameController = TextEditingController();
  final lastnameController = TextEditingController();
 final emailIDController = TextEditingController();
 final mobileNoController = TextEditingController();
  @override
  void dispose(){
    firstnameController.dispose();
    lastnameController.dispose();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          child: Icon(Platform.isIOS?Icons.image : Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),backgroundColor: Color.fromRGBO(255, 255, 255, .9),
     
      appBar: AppBar(
        title: Text('User'),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: ListView(
            children: <Widget>[
              Column(
                children: <Widget>[
                  TextFormField(
                    decoration: InputDecoration(labelText: 'First Name'),
                    controller: firstnameController,
                    validator: (value){
                      if(value.isEmpty){
                        return 'First Name Should Not Be Empty';
                      }
                      return null;
                    },
                    
                  ),
                  SizedBox(
                    height: 20,
                  ),

                  TextFormField(
                    decoration: InputDecoration(labelText: 'Last Name'),
                    controller: lastnameController,
                    validator: (value){
                      if(value.isEmpty){
                        return 'Last Name Should Not Be Empty';
                      }
                      return null;
                    },
                    
                  ),
                  SizedBox(
                    height: 20,
                  ),
TextFormField(
                    decoration: InputDecoration(labelText: 'EmailID'),
                    controller: emailIDController,
                    validator: (value){
                      if(value.isEmpty){
                        return 'EmailID Should Not Be Empty';
                      }
                      return null;
                    },
                    
                  ),
                  SizedBox(
                    height: 20,
                  ),TextFormField(
                    decoration: InputDecoration(labelText: 'MobileNo'),
                    controller: mobileNoController,
                    validator: (value){
                      if(value.isEmpty){
                        return 'MobileNo Should Not Be Empty';
                      }
                      return null;
                    },
                    
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  RaisedButton(
                    onPressed: () {
                      if(_formKey.currentState.validate()){
                       
                          var firstname = firstnameController.text;
                          var lastname = lastnameController.text;
                           //var EmailID = emailIDController.text;
                           // var MobileNo = mobileNoController.text;

                          print('First Name: $firstname Last Name: $lastname');
                      }
                    },
                    child: Text('Submit'),
                    textColor: Colors.white,
                    color: Colors.blueAccent,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
