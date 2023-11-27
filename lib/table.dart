import 'package:flutter/material.dart';
import 'package:flutter_application_1/home_screen.dart';
import 'package:flutter_application_1/nav.dart';
import 'package:flutter_application_1/profil.dart';
import 'input.dart';

class CustomListItem {
  final String imagePath;
  final String title;
  final String price;

  CustomListItem({
    required this.imagePath,
    required this.title,
    required this.price,
  });
}

class TablePage extends StatefulWidget {
  @override
  _TablePageState createState() => _TablePageState();
}

class _TablePageState extends State<TablePage> {
  final List<CustomListItem> items = [
    CustomListItem(imagePath: 'images/burger.jpeg', title: 'burger original', price: '30.000'),
    CustomListItem(imagePath: 'images/teh.jpeg', title: 'teh', price: '15.000'),
    CustomListItem(imagePath: 'images/burger.jpeg', title: 'cheese burger', price: '20.000'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        actions: <Widget>[
          // Back
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  spreadRadius: 3,
                  blurRadius: 5,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
            child: CircleAvatar(
              child: IconButton(
                icon: Icon(Icons.arrow_back_ios),
                color: Colors.red.shade900,
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return Nav();
                      },
                    ),
                  );
                },
              ),
              backgroundColor: Colors.white,
            ),
          ),
          // End Back

          // Profile
          Spacer(),
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  spreadRadius: 3,
                  blurRadius: 5,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
            child: CircleAvatar(
              child: IconButton(
                icon: Icon(Icons.person),
                color: Colors.black,
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return ProfilePage();
                      },
                    ),
                  );
                },
              ),
              backgroundColor: Colors.white,
            ),
          ),
          // End Profile
        ],
      ),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return InputForm();
                  },
                ),
              );
            },
            child: Text("Add"),
          ),
          DataTable(
            columns: [
              DataColumn(label: Text('Image')),
              DataColumn(label: Text('Title')),
              DataColumn(label: Text('Price')),
              DataColumn(label: Text('Actions')),
            ],
            rows: items.map(
              (item) => DataRow(
                cells: [
                  DataCell(Image.asset(item.imagePath, width: 50.0, height: 50.0)),
                  DataCell(Text(item.title)),
                  DataCell(Text(item.price)),
                  DataCell(Icon(Icons.restore_from_trash, color: Colors.red.shade900)),
                ],
              ),
            ).toList(),
            dataRowHeight: 100.0,
          ),
        ],
      ),
    );
  }
}
