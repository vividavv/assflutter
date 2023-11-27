import 'package:flutter/material.dart';
import 'package:flutter_application_1/home_screen.dart';
import 'package:flutter_application_1/nav.dart';
import 'package:flutter_application_1/profil.dart';

class CustomListItem {
  final String imagePath;
  final String title;
  final String price;
  int quantity; // Add quantity property

  CustomListItem({
    required this.imagePath,
    required this.title,
    required this.price,
    this.quantity = 1, // Set default quantity to 1
  });
}

class MyList extends StatefulWidget {
  @override
  _MyListState createState() => _MyListState();
}

class _MyListState extends State<MyList> {
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
                  offset: Offset(0, 3),
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
                  offset: Offset(0, 3),
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
          Expanded(
            child: ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    ListTile(
                      contentPadding: EdgeInsets.all(0),
                      title: Row(
                        children: [
                          Container(
                            alignment: Alignment.centerLeft,
                            child: Image.asset(
                              items[index].imagePath,
                              width: 60.0,
                              height: 60.0,
                            ),
                          ),
                          SizedBox(width: 15.0),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  items[index].title,
                                  style: TextStyle(fontSize: 16.0),
                                ),
                                SizedBox(height: 8.0),
                                Text(
                                  items[index].price,
                                  style: TextStyle(fontSize: 16.0),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(width: 10.0),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.2),
                                      spreadRadius: 3,
                                      blurRadius: 5,
                                      offset: Offset(0, 3),
                                    ),
                                  ],
                                ),
                                child: CircleAvatar(
                                  child: IconButton(
                                    icon: Icon(Icons.remove),
                                    onPressed: () {
                                      setState(() {
                                        items[index].quantity = items[index].quantity > 1
                                            ? items[index].quantity - 1
                                            : 1;
                                      });
                                    },
                                  ),
                                ),
                              ),
                              SizedBox(height: 8.0),
                              Text(
                                '${items[index].quantity}',
                                style: TextStyle(fontSize: 18.0),
                              ),
                              SizedBox(height: 8.0),
                              Container(
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.2),
                                      spreadRadius: 3,
                                      blurRadius: 5,
                                      offset: Offset(0, 3),
                                    ),
                                  ],
                                ),
                                child: CircleAvatar(
                                  child: IconButton(
                                    icon: Icon(Icons.add),
                                    onPressed: () {
                                      setState(() {
                                        items[index].quantity++;
                                      });
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20.0),
                  ],
                );
              },
            ),
          ),
          // Summary of shopping list
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Ringkasan Pembelanjaan',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8.0),
                Text('Total Quantity: 300.000.00'),
                Text('Total Price: 350.000.00'),
              ],
            ),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            child: const Text('Submit'),
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('ringkasan belanja'),
                        Text('harganya 350.000.00'),
                        Text('pajak 50.000.00'),
                      ],
                    ),
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
