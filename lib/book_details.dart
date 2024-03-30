import 'package:flutter/material.dart';
import 'package:storey/book_model.dart';

class BookDetailsPage extends StatefulWidget {
  BookDetailsPage({
    super.key,
    required this.book,
  });

  BookData book;

  @override
  State<BookDetailsPage> createState() => _BookDetailsPageState();
}

class _BookDetailsPageState extends State<BookDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.book.name)),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network(widget.book.image),
            Text(widget.book.description),
          ],
        ),
      ),
    );
  }
}
