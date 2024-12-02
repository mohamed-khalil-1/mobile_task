import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/model.dart';

class DetailsPage extends StatelessWidget {
  final Book book;

  DetailsPage({required this.book});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(book.name,
            style: TextStyle(color: Color.fromARGB(255, 255, 255, 255))),
        backgroundColor: Color.fromARGB(255, 40, 40, 240),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text('Genre: ${book.genra}'),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text('price: ${book.price}'),
          ),
        ],
      ),
    );
  }
}
