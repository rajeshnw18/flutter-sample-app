import 'menu_page.dart';
import 'package:flutter/material.dart';
import 'zoom_scaffold.dart';
import 'package:provider/provider.dart';
//import 'package:flutter_login_ui/ActiveUser.dart';
import 'package:flutter_login_ui/calculator.dart';
import 'todayTask.dart';
import 'ActiveUser.dart';
import 'package:flutter_login_ui/todayBooking.dart';
import 'package:flutter_login_ui/rgCalculator.dart';
import 'package:flutter_login_ui/screens/note_list.dart';
void main() => runApp(new Home());

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SHELL',
      theme: new ThemeData(
        primarySwatch: Colors.lightBlue,
      ),
      home: new MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  MenuController menuController;
  @override
  void initState() {
    super.initState();

    menuController = new MenuController(
      vsync: this,
    )..addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    menuController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      builder: (context) => menuController,
      child: ZoomScaffold(
        menuScreen: MenuScreen(),
        contentScreen: Layout(
            contentBuilder: (cc) => Container(
                  color: Colors.red[200],
                  child: Container(
                    color: Colors.lightBlue,//Home Page Layout
                    child: GridView.count(
          crossAxisCount: 2,
          padding: EdgeInsets.all(3.0),
          children: <Widget>[
            
            makeDashboardItem("Today Deal (10)", 
            Icons.book,context,
            
            
            ),
            makeDashboardItem("Today Booking (5)", Icons.verified_user,context),
            makeDashboardItem("Channel Revenue", Icons.video_library,context),
            makeDashboardItem("Region Revenue",Icons.image,context ),
            makeDashboardItem("Active User", Icons.settings_applications,context),
            makeDashboardItem("Calculator", Icons.settings_backup_restore,context)
          ],
        ),
                  ),
                )),
      ),
    );
  }
}




Card makeDashboardItem(String title, IconData icon,BuildContext context) {
    return Card(
        elevation: 1.0,
        margin: new EdgeInsets.all(4.0),
        child: Container(
          decoration: BoxDecoration(color: Color.fromRGBO(220, 220, 220, 1.0)
        
          ),
          child: new InkWell(
            onTap: () {
             if(title=='Today Deal (10)')
               {
                   Navigator.push(context,MaterialPageRoute(builder: (context) => TodayTaskReport()));
                 
               }
               if(title=='Today Booking (5)')
               {
                  Navigator.push(context, MaterialPageRoute(builder: (context)
                  {
                    return TodayBookingReport();
                  }));
                 
               }
               if(title=='Channel Revenue')
               {
                  Navigator.push(context,MaterialPageRoute(builder: (context) 
                  => UserDetails()));
                 
               }
               if(title=='Active User')
               {
                  Navigator.push(context,MaterialPageRoute(builder: (context) => MyCalCalculator()));
                   
               }
                if(title=='Region Revenue')
               { 
                 Navigator.push(context,MaterialPageRoute(builder: (context) => NoteList()));
                 
                 
               }
                if(title=='Calculator')
               {
                  Navigator.push(context,MaterialPageRoute(builder: (context) => CalculatorApp()));
                  
               }

            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              verticalDirection: VerticalDirection.down,
              children: <Widget>[
                SizedBox(height: 40.0),
                Center(
                    child: Icon(
                  icon,
                  size: 40.0,
                  color: Colors.red,
                )),
                SizedBox(height: 19.0),
                new Center(
                  child: new Text(title,
                      style:
                          new TextStyle(fontSize: 18.0, color: Colors.black)),
                )
              ],
            ),
          ),
        ));
  }
