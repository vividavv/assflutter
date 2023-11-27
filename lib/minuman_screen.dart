import 'package:flutter/material.dart';

class CartItem {
  final String imagePath;
  final String label;
  final String price;

  CartItem({required this.imagePath, required this.label, required this.price});
}

class MinumanScreen extends StatelessWidget {
  final List<CartItem> items = [
    CartItem(imagePath: 'images/teh.jpeg', label: 'Teh', price: '15.000'),
    CartItem(imagePath: 'images/teh.jpeg', label: 'Teh', price: '15.000'),
    CartItem(imagePath: 'images/teh.jpeg', label: 'Teh', price: '15.000'),

    // Tambahkan item lain sesuai kebutuhan
  ];

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Text("Minuman"),
        ),
        SizedBox(height: 16.0),
        GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 8.0,
            mainAxisSpacing: 8.0,
          ),
          itemCount: items.length,
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                // Aksi yang ingin dilakukan saat item ditekan
                print('Item $index ditekan!');
              },
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(5.0),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Image.asset(
                      items[index].imagePath,
                      width: 120.0,
                      height: 120.0,
                    ),
                    SizedBox(height: 8.0),
                    Text(
                      items[index].label,
                      style: TextStyle(fontSize: 20.0),
                    ),
                    Text(
                      items[index].price,
                      style: TextStyle(fontSize: 16.0),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
