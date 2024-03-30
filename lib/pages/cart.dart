import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gsheets/gsheets.dart';
import 'package:storey/book_details.dart';
import 'package:storey/book_model.dart';

import '../spreadsheet_data.dart';

List<BookData> booksList = [];

void showBookDetails(BuildContext context, BookData book) {
  Navigator.of(context).push(
    CupertinoPageRoute(
      builder: (context) => BookDetailsPage(
        book: book,
      ),
    ),
  );
}

class CartPage extends StatefulWidget {
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  bool isLoading = true;

  List<List<dynamic>>? columns;
  @override
  void initState() {
    super.initState();
    _fetchSheetData();
  }

  Future<void> _fetchSheetData() async {
    final gsheets = GSheets(credentials);
    final ss = await gsheets.spreadsheet(spreadsheetId);
    var sheet = ss.worksheetByTitle("Cart");

    try {
      columns = await sheet!.values.allColumns();
      debugPrint('Got ${columns!.length} columns from the sheet');

      for (var i = 1; i < columns![0].length; i++) {
        String name = i < columns![0].length ? columns![0][i] : '';
        String author = i < columns![1].length ? columns![1][i] : '';
        String image = i < columns![2].length ? columns![2][i] : '';
        String description = i < columns![3].length ? columns![3][i] : '';

        var bookData = BookData(
          name,
          author,
          image,
          description,
        );

        booksList.add(bookData);
      }

      isLoading = false;
      setState(() {});
    } catch (e) {
      debugPrint('Error getting columns from the sheet: $e');
    }
  }

  @override
  void dispose() {
    booksList.clear();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Cart',
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
      ),
      body: Column(
        children: [
          BooksHomeGridView(
            isLoading: isLoading,
          )
        ],
      ),
    );
  }
}

class BooksHomeGridView extends StatefulWidget {
  BooksHomeGridView({super.key, required this.isLoading});
  final bool isLoading;

  @override
  State<BooksHomeGridView> createState() => _BooksHomeGridViewState();
}

class _BooksHomeGridViewState extends State<BooksHomeGridView> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Stack(
        children: [
          if (widget.isLoading)
            const Center(
              child: CircularProgressIndicator(),
            ),
          if (booksList.isEmpty) Center(child: Text('Cart is empty')),
          if (!widget.isLoading)
            GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 1 / 2,
              ),
              itemCount: booksList.length,
              itemBuilder: (BuildContext context, int index) {
                BookData book = booksList[index];
                return GestureDetector(
                  onTap: () {
                    showBookDetails(context, book);
                  },
                  child: Card(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Flexible(
                          fit: FlexFit.loose,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.network(
                              book.image,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            book.name,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
        ],
      ),
    );
  }
}
