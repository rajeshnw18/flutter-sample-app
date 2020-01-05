import 'package:flutter/material.dart';
import 'home.dart';

class TodayBookingReport extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new MyHomePage(),
      
    );
  }
}


class MyHomePage extends StatefulWidget {
 

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  TextEditingController editingController = TextEditingController();

  final duplicateItems = List<String>.generate(10000, (i) => "Item $i");
  var items = List<String>();

  @override
  void initState() {
    items.addAll(duplicateItems);
    super.initState();
  }

  void filterSearchResults(String query) {
    List<String> dummySearchList = List<String>();
    dummySearchList.addAll(duplicateItems);
    if(query.isNotEmpty) {
      List<String> dummyListData = List<String>();
      dummySearchList.forEach((item) {
        if(item.contains(query)) {
          dummyListData.add(item);
        }
      });
      setState(() {
        items.clear();
        items.addAll(dummyListData);
      });
      return;
    } else {
      setState(() {
        items.clear();
        items.addAll(duplicateItems);
      });
    }

  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        automaticallyImplyLeading: true,
        title: Text('Today Booking'),
        leading: IconButton(icon:Icon(Icons.arrow_back),
          onPressed:() {
             Navigator.push(context,MaterialPageRoute(builder: (context) => Home()));
                 
          }
        )
      ),
      body: Container(
        
        child: Column(
          
          children: <Widget>[
            
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                onChanged: (value) {
                  filterSearchResults(value);
                },
                controller: editingController,
                
                decoration: InputDecoration(
                    labelText: "Search",
                    hintText: "Search",
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(25.0)))),
              ),
            ),
            Expanded(
              child: ListView.builder(
                
                shrinkWrap: true,
                itemCount: items.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    onTap:()
                    {
                    Navigator.push(context,MaterialPageRoute(builder: (context) => DetailPage('${items[index]}')));
                        
                    },
                    title: Text('${items[index]}',
                    //title: Text( 'CNN/MUM/19/' '${index}',
                    style: TextStyle(color: Colors.blueGrey),
                    ),
                    subtitle: Text("01-01-2020                Rajesh               Approved",
                    style: TextStyle(color: Colors.red),
                    ),
                    leading: Icon(
                      Icons.library_books,
                      color: Colors.red,
                    ),
                   
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DetailPage extends StatelessWidget {
  final dealNo="ok";
  DetailPage(String dealNo);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('DealNo'),
        )
    );
  }
}