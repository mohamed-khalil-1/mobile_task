import 'package:flutter/material.dart';
import 'package:flutter_application_1/add_book.dart';
import 'package:flutter_application_1/details_widget.dart';
import 'package:flutter_application_1/model/model.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Book> books = [];

  void addBook(Book book) {
    if (!books.any((b) => b.name == book.name)) {
      setState(() {
        books.add(book);
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Duplicate book!"),
      ));
    }
  }

  void deleteBook(int index) {
    setState(() {
      books.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Library Management system',
          style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
        ),
        backgroundColor: Color.fromARGB(255, 40, 40, 240),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => AddBookPage(addBook: addBook)));
        },
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('Total Books: ${books.length}'),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: books.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(
                    books[index].name,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(books[index].genra),
                      SizedBox(
                        height: 5,
                      ),
                      Text(books[index].price),
                    ],
                  ),
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => DetailsPage(book: books[index])));
                  },
                  onLongPress: () => deleteBook(index),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
