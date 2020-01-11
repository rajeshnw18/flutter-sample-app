import 'package:flutter/material.dart';
import 'oval-right-clipper.dart';
import 'package:flutter_login_ui/assets.dart';
import 'channelRevenue.dart';
import 'RegionRevenue.dart';
import 'booking.dart';
import 'todayReport.dart';
//import 'monthlyReport.dart';
//import 'yearlyReport.dart';
import 'profile.dart';
import 'deal.dart';
import 'ActiveUser.dart';
import 'package:flutter_login_ui/screens/note_list.dart';
//import 'main.dart';
import 'calculator.dart';
import 'rgCalculator.dart';
import 'package:flutter_login_ui/mailBox.dart';
import 'video.dart';
//import 'package:flutter_login_ui/userImage.dart';
import 'package:flutter_login_ui/sqllite/task.dart';
import 'test.dart';
import 'main.dart';

class Home extends StatelessWidget {
  final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();
  final Color primary = Colors.white;
  final Color active = Colors.grey.shade800;
  final Color divider = Colors.grey.shade600;
  final String avatar = avatars[5];
  final TextStyle whiteText = TextStyle(color: Colors.white);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      appBar: AppBar(
        title: Text('Shell V3.0'),
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {
            _key.currentState.openDrawer();
          },
        ),
      ),
      drawer: _buildDrawer(context),
      body: _buildBody(context),
      bottomNavigationBar: _buildBottomBar(context),
    );
  }

  Widget _buildBottomBar(BuildContext context) {
    return BottomNavigationBar(
      selectedItemColor: Colors.grey.shade800,
      unselectedItemColor: Colors.grey,
      currentIndex: 0,
      onTap: (i) {
        if(i==0)
        {
         Navigator.push(context,MaterialPageRoute(builder: (context) => Deal()));
                 
        }
        if(i==1)
        {
         Navigator.push(context,MaterialPageRoute(builder: (context) => Profile()));
                 
        }
        if(i==2)
        {
         Navigator.push(context,MaterialPageRoute(builder: (context) => NoteList()));
                 
        }
        if(i==3)
        {
         Navigator.push(context,MaterialPageRoute(builder: (context) => ActiveUser()));
                 
        }
      },
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          title: Text("Home"),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person_add),
          title: Text("Refer"),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.library_books),
          title: Text("History"),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person_outline),
          title: Text("Profile"),
        ),
      ],
    );
  }

  Widget _buildBody(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _buildHeader(),
          const SizedBox(height: 15.0),
          Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: Text(
              "Today Status",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
            ),
          ),
          Card(
            elevation: 4.0,
            color: Colors.white,
            margin: const EdgeInsets.all(16.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ListTile(
                    leading: Container(
                      alignment: Alignment.bottomCenter,
                      width: 45.0,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[
                          Container(
                            height: 20,
                            width: 8.0,
                            color: Colors.grey.shade300,
                          ),
                          const SizedBox(width: 4.0),
                          Container(
                            height: 25,
                            width: 8.0,
                            color: Colors.grey.shade300,
                          ),
                          const SizedBox(width: 4.0),
                          Container(
                            height: 40,
                            width: 8.0,
                            color: Colors.blue,
                          ),
                          const SizedBox(width: 4.0),
                          Container(
                            height: 30,
                            width: 8.0,
                            color: Colors.grey.shade300,
                          ),
                        ],
                      ),
                    ),
                    title: Text("Deal"),
                    subtitle: Text("Total-18"),
                    onTap: ()
                    {
                     Navigator.push(context,MaterialPageRoute(builder: (context) => Deal())); 
                    },
                  ),
                  
                ),
                VerticalDivider(),
                Expanded(
                  child: ListTile(
                    leading: Container(
                      alignment: Alignment.bottomCenter,
                      width: 45.0,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[
                          Container(
                            height: 20,
                            width: 8.0,
                            color: Colors.grey.shade300,
                          ),
                          const SizedBox(width: 4.0),
                          Container(
                            height: 25,
                            width: 8.0,
                            color: Colors.grey.shade300,
                          ),
                          const SizedBox(width: 4.0),
                          Container(
                            height: 40,
                            width: 8.0,
                            color: Colors.red,
                          ),
                          const SizedBox(width: 4.0),
                          Container(
                            height: 30,
                            width: 8.0,
                            color: Colors.grey.shade300,
                          ),
                        ],
                      ),
                    ),
                    title: Text("Booking"),
                    subtitle: Text("Total-20"),
                     onTap: ()
                    {
                     Navigator.push(context,MaterialPageRoute(builder: (context) => Deal())); 
                    },
                  ),
                ),
              ],
            ),
          ),
          
            
          const SizedBox(height: 5.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: _buildTile(
                    color: Colors.green,
                    icon: Icons.favorite,
                    title: "Channel Revenue",
                    data: "864000.90",
                    context:context
                  ),
                 
                ),
                const SizedBox(width: 5.0),
                Expanded(
                  child: _buildTile(
                    color: Colors.pink,
                    icon: Icons.portrait,
                    title: "Region Revenue",
                    data: "10999.00",
                    context:context
                  ),
                ),
                const SizedBox(width: 5.0),
                Expanded(
                  child: _buildTile(
                    color: Colors.blue,
                    icon: Icons.favorite,
                    title: "Culster Revenue",
                    data: "18989.80",
                    context:context
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10.0),

          const SizedBox(height: 5.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: _buildTile(
                    color: Colors.green,
                    icon: Icons.label_important,
                    title: "Today Report",
                    data: "124000.90",
                    context:context
                  ),
                ),
                const SizedBox(width: 5.0),
                Expanded(
                  child: _buildTile(
                    color: Colors.pink,
                    icon: Icons.line_weight,
                    title: "Monthly Report",
                    data: "30999.00",
                    context:context
                  ),
                ),
                const SizedBox(width: 5.0),
                Expanded(
                  child: _buildTile(
                    color: Colors.blue,
                    icon: Icons.library_books,
                    title: "Yearly Report",
                    data: "18989.80",
                    context:context
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10.0),
        ],
      ),
    );
  }

  Container _buildHeader() {
    return Container(
      padding: const EdgeInsets.fromLTRB(0, 0.0, 0, 0.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(25.0),
          bottomRight: Radius.circular(25.0),
        ),
        color: Colors.blue,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          ListTile(
            title: Text(
              "Rajesh Gupta",
              style: whiteText.copyWith(
                  fontWeight: FontWeight.bold, fontSize: 20.0),
            ),
            trailing:ClipOval(
     child: Image.asset(
      'assets/logos/rajesh.jpg',
       fit: BoxFit.contain,
       matchTextDirection: true,
       height: 90,
       
   ))
          ),
          const SizedBox(height: 1.0),
          Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: Text(
              "Software Engg.",
              style: whiteText.copyWith(
                fontSize: 18.0,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          const SizedBox(height: 5.0),
          Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: Text(
              "Date:07-Jan-2020, Noida",
              style: whiteText,
            ),
          ),
        ],
      ),
    );
  }

  Container _buildTile(
      {
        Color color, IconData icon, String title, String data,BuildContext context})
        
      {
    return Container(
      padding: const EdgeInsets.all(8.0),
      height: 150.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4.0),
        color: color,
      ),
      child: new InkWell(
            onTap: () {
             if(title=='Channel Revenue')
               {
                   Navigator.push(context,MaterialPageRoute(builder: (context) => ChannelRegionReport()));
                 
               }
               if(title=='Region Revenue')
               {
                   Navigator.push(context,MaterialPageRoute(builder: (context) => RegionRevenueReport()));
 
               }
               if(title=='Culster Revenue')
               {
                   Navigator.push(context,MaterialPageRoute(builder: (context) => Booking()));
                 
                 
               }
               if(title=='Today Report')
               {
                
                Navigator.push(context,MaterialPageRoute(builder: (context) => TodayReport()));
                   
               }
                if(title=='Monthly Report')
               { 
                  Navigator.push(context,MaterialPageRoute(builder: (context) => MyCalCalculator()));
                 
                 
               }
                if(title=='Yearly Report')
               {
                 Navigator.push(context,MaterialPageRoute(builder: (context) => CalculatorApp()));
                  
               }

            },
          
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Icon(
            icon,
            color: Colors.white,
            
          ),
          Text(
            title,
            style: whiteText.copyWith(fontWeight: FontWeight.bold),
          ),
          Text(
            data,
            style:
                whiteText.copyWith(fontWeight: FontWeight.bold, fontSize: 20.0),
          ),
        ],
      ),
    ));
  }



  _buildDrawer(BuildContext context) {
    //final String image = images[0];
    return ClipPath(
      clipper: OvalRightBorderClipper(),
      child: Drawer(
        child: Container(
          padding: const EdgeInsets.only(left: 16.0, right: 40),
          decoration: BoxDecoration(
              color: primary, boxShadow: [BoxShadow(color: Colors.black45)]),
          width: 300,
          child: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Container(
                    alignment: Alignment.centerRight,
                    child: IconButton(
                      icon: Icon(
                        Icons.power_settings_new,
                        color: active,
                      ),
                      onPressed: () {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (BuildContext context)=>MainApp()));
                      },
                    ),
                  ),
                  Container(
                    height: 90,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: LinearGradient(
                            colors: [Colors.white, Colors.white])),
                    child: ClipOval(
     child: Image.asset(
      'assets/logos/rajesh.jpg',
       fit: BoxFit.contain,
       matchTextDirection: true,
       height: 90,
       
   ))
                  ),
                  SizedBox(height: 5.0),
                  Text(
                    "Rajesh Gupta",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 18.0,
                        fontWeight: FontWeight.w600),
                  ),
                  Text(
                    "Software Engg.",
                    style: TextStyle(color: active, fontSize: 16.0),
                  ),
                  SizedBox(height: 30.0),
                  _buildRow(context, Icons.home, "Home",
                  
                  
                  )
                  
                  
                  
                  ,
                  _buildDivider(),
                  _buildRow(context,Icons.person_pin, "My profile"),
                  _buildDivider(),
                  _buildRow(context,Icons.message, "Mail(10)", showBadge: true),
                  _buildDivider(),
                  _buildRow(context,Icons.notifications, "Task", showBadge: true),
                  _buildDivider(),
                  _buildRow(context,Icons.settings, "Calculator"),
                  _buildDivider(),
                  _buildRow(context,Icons.email, "Service"),
                  _buildDivider(),
                  _buildRow(context,Icons.info_outline, "setting"),
                  _buildDivider(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Divider _buildDivider() {
    return Divider(
      color: divider,
      
    );
  }

  Widget _buildRow(BuildContext context, IconData icon, String title, {bool showBadge = false}) {
    final TextStyle tStyle = TextStyle(color: active, fontSize: 16.0);
    return 
    Container(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child:InkWell(
      onTap: () {
       if(title=="Home")
                      {
                      Navigator.push(context,MaterialPageRoute(builder: (context) => Home()));
                      }
                      if(title=="My profile")
                      {
                      Navigator.push(context,MaterialPageRoute(builder: (context) => Profile()));
                      }
                      if(title=="Mail(10)")
                      {
                      Navigator.push(context,MaterialPageRoute(builder: (context) => Inbox()));
                      }
                      if(title=="Task")
                      {
                      Navigator.push(context,MaterialPageRoute(builder: (context) =>Task()));
                      }
                      if(title=="Service")
                      {
                      Navigator.push(context,MaterialPageRoute(builder: (context) => VideoApp()));
                      }
                      if(title=="setting")
                      {
                      Navigator.push(context,MaterialPageRoute(builder: (context) => Test()));
                      }

      }, 
      child:
      Row
      (children:
       [Icon(icon,color: active,
       
       ),
        SizedBox(width: 10.0),
        Text(
          title,
          style: tStyle,
        ),
        Spacer(),
        
      ]),
    ));
  }
}
