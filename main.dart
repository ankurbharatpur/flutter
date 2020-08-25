import "package:flutter/material.dart";
//import './flutter_screen/first_screen.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: "state ful widget",
    home: Favcity(),
  )
  );
}


class Favcity extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    debugPrint("in favsirt");

    return _Favcitystate();
  }


}

class _Favcitystate extends State<Favcity> {
  String city = "";

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    debugPrint("in rret");

    return Scaffold(
      appBar: AppBar(
        title: Text("my favourate city"),
      ),
      body: Container(
        margin: EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextField(
              onSubmitted: (String namecity){   //onChanged: is also can be use 
                setState(() {
                  city = namecity;
                  debugPrint("in set");
                });

              },
            ),
            Padding(padding: EdgeInsets.all(20.0),
            child: Text(
              "your fav city is $city",
              style: TextStyle(fontSize: 20.0 ),
            ),)

          ],
        ),
      ),
    );
  }

}


//void main() {
//  runApp(MaterialApp(
//    title: "my first app",
//    home: Scaffold(
//      appBar: AppBar(
//        title: Text("Menu"),
//      ),
//      body: getListView(),
//      floatingActionButton: FloatingActionButton(
//        onPressed: () {},
//        child: Icon(Icons.add),
//        tooltip: "add mess",
//      ),
//    ),
//  ));
//}
//
//void showSnackBar(BuildContext context, String item) {
//  var snackBar = SnackBar(
//      content: Text("your item is $item"),
//          action: SnackBarAction(
//      label: "UNDO",
//      onPressed: (){
//
//      }),
//  );
//  Scaffold.of(context).showSnackBar(snackBar);
//}
//
//
//List<String> getListElement() {
//  var items = List<String>.generate(1000, (counter) => "item $counter");
//  return items;
//}
//
//Widget getListView() {
//  var listitem = getListElement();
//
//  var listview = ListView.builder(itemBuilder: (context, index) {
//    return ListTile(
//      title: Text(listitem[index]),
//       leading: Text("data"),
//      trailing: Icon(Icons.delete_outline),
//      onTap: () {
//        showSnackBar(context, listitem[index]);
//      },
//    );
//  });
//  return listview;
//}

//Widget getListView(){
//	var listView = ListView(
//		children: [
//			ListTile(
//				leading: Icon(Icons.landscape),
//				title: Text("landscape"),
//				subtitle: Text("Beautiful View"),
//				trailing: Icon(Icons.wb_cloudy),
//				onTap: (){
//					debugPrint("LOP");
//				},
//
//			),
//			ListTile(
//				leading: Icon(Icons.photo),
//				title: Text("photo"),
// 				trailing: Icon(Icons.palette),
//
//			onLongPress: (){
//				debugPrint("main");
//			},
//			),
//			ListTile(
//				leading: Icon(Icons.search),
//				title: Text("search"),
//				subtitle: Text("Beautiful View"),
// 			),
//		],
//	);
//			return listView;
//}
