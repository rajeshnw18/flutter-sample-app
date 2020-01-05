//import 'circular_image.dart';
import 'zoom_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_login_ui/main.dart';
import 'package:flutter_login_ui/dash1.dart';
class MenuScreen extends StatelessWidget {
  final String imageUrl ="";
  final List<MenuItem> options = [
    MenuItem(Icons.image, 'Demo1',
    
    ),
    MenuItem(Icons.shopping_basket, 'Demo1'),
    MenuItem(Icons.favorite, 'Demo1'),
    MenuItem(Icons.code, 'Demo1'),
    MenuItem(Icons.format_list_bulleted, 'Demo1'),
  ];

Widget getImageAsset() {
		AssetImage assetImage = AssetImage('assets/logos/jai.jpg');
		Image image = Image(image: assetImage, width: 50.0, height: 50.0,);
		return Container(child: image, margin: EdgeInsets.all(10.0 * 1),);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onPanUpdate: (details) {
        //on swiping left
        if (details.delta.dx < -6) {
          Provider.of<MenuController>(context, listen: true).toggle();
        }
      },
      child: Container(
        padding: EdgeInsets.only(
            top: 62,
            left: 32,
            bottom: 8,
            right: MediaQuery.of(context).size.width / 2.9),
            color:Color(0xff454dff),
        
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(right: 16),
                  child: 
                  getImageAsset()
                  //CircularImage(
                    //NetworkImage(imageUrl),
                  //),
                ),
                Text(
                  'Rajesh Gupta',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                  ),
                )
              ],
            ),
            Spacer(),
            Column(
              children: options.map((item) {
                return ListTile(
                  leading: Icon(
                    item.icon,
                    color: Colors.white,
                    size: 20,
                  ),
                  title: Text(
                    item.title,
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                );
              }).toList(),
            ),
            Spacer(),
            ListTile(
              onTap: () {
                Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (BuildContext context)=>DashboardOnePage()));
              },
              leading: Icon(
                Icons.settings,
                color: Colors.white,
                size: 20,
              ),
              title: Text('Settings',
                  style: TextStyle(fontSize: 14, color: Colors.white)),
            ),
            ListTile(
              onTap: () {
                Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (BuildContext context)=>MyApp()));
              },
              leading: Icon(
                Icons.language,
                color: Colors.white,
                size: 20,
              ),
              title: Text('LogOut',
                  style: TextStyle(fontSize: 14, color: Colors.white)),
                 
            ),
          ],
        ),
      ),
    );
  }
}

class MenuItem {
  String title;
  IconData icon;
  MenuItem(this.icon, this.title);
}
