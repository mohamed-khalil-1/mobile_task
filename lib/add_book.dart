import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/model.dart';

class AddBookPage extends StatefulWidget {
  final Function(Book) addBook;

  AddBookPage({required this.addBook});

  @override
  _AddBookPageState createState() => _AddBookPageState();
}

class _AddBookPageState extends State<AddBookPage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  String selectedGenre = 'si_fi';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Book',
            style: TextStyle(color: Color.fromARGB(255, 255, 255, 255))),
        backgroundColor: Color.fromARGB(255, 40, 40, 240),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(labelText: 'Book Name'),
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              controller: priceController,
              decoration: InputDecoration(labelText: 'price'),
            ),
            SizedBox(
              height: 20,
            ),
            DropdownButton<String>(
              value: selectedGenre,
              onChanged: (String? newValue) {
                setState(() {
                  selectedGenre = newValue!;
                });
              },
              items: <String>['manga', 'comics', 'History', 'si_fi', 'romance']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                widget.addBook(Book(nameController.text, selectedGenre,
                    name: nameController.text,
                    genra: selectedGenre,
                    price: priceController.text));
                Navigator.of(context).pop();
              },
              child: Text('Add Book'),
            ),
          ],
        ),
      ),
    );
  }
}
