import 'package:flutter/material.dart';
import 'package:flutter_application_1/home_screen.dart';
import 'package:flutter_application_1/nav.dart';
import 'package:flutter_application_1/profil.dart';

class InputForm extends StatefulWidget {
  @override
  _InputFormState createState() => _InputFormState();
}

class _InputFormState extends State<InputForm> {
  String _nama = '';
  String _harga = '';
  String? _kategori = 'Pilihan'; // Set a default value
  String _img = '';

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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Nama Produk
            SizedBox(height: 10),
            TextField(
              decoration: const InputDecoration(
                labelText: 'Nama Produk',
              ),
              onChanged: (String value) {
                setState(() {
                  _nama = value;
                });
              },
            ),

            // Harga
            SizedBox(height: 10),
            TextField(
              decoration: const InputDecoration(
                labelText: 'Harga',
              ),
              onChanged: (String value) {
                setState(() {
                  _harga = value;
                });
              },
            ),

            // Kategori
            SizedBox(height: 10),
            DropdownButton<String>(
              value: _kategori,
              onChanged: (value) {
                setState(() {
                  _kategori = value;
                });
              },
              items: <String>['Pilihan', 'Makanan', 'Minuman', 'Dll']
                  .map<DropdownMenuItem<String>>(
                    (String value) => DropdownMenuItem<String>(
                      child: Text(value),
                      value: value,
                    ),
                  )
                  .toList(),
            ),

            // Image
            SizedBox(height: 10),
            TextField(
              decoration: const InputDecoration(
                labelText: 'Image Link',
              ),
              onChanged: (String link) {
                setState(() {
                  _img = link;
                });
              },
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
                          Text('Nama barang adalah $_nama'),
                          Text('Harganya $_harga'),
                          Text('Kategori $_kategori'),
                          Text('$_img'),
                        ],
                      ),
                    );
                  },
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
