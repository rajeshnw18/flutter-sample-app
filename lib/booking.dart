import 'package:flutter/material.dart';




class Booking extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Booking'),
          bottom: TabBar(
            tabs: <Widget>[
              Tab(
               // text: 'Tab 1',
               icon: Icon(Icons.call),
              ),
              Tab(
               // text: 'Tab 2',
                icon: Icon(Icons.video_call),
              ),
              Tab(
                //text: 'Tab 3',
                icon: Icon(Icons.textsms),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            Center(child: Text('Tab 1 Content', style: TextStyle(fontSize: 20),)), 
            Image.network('https://images.pexels.com/photos/2150/sky-space-dark-galaxy.jpg'),
            Text('Tab 3 Content'),
            ],
        ),

        // bottomNavigationBar: TabBar(
        //   labelColor: Colors.blueAccent,
        //   unselectedLabelColor: Colors.grey,
        //     tabs: <Widget>[
        //       Tab(
        //        // text: 'Tab 1',
        //        icon: Icon(Icons.call),
        //       ),
        //       Tab(
        //        // text: 'Tab 2',
        //         icon: Icon(Icons.video_call),
        //       ),
        //       Tab(
        //         //text: 'Tab 3',
        //         icon: Icon(Icons.textsms),
        //       ),
        //     ],
        //   ),
      ),
    );
  }
}
