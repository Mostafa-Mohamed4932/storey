import 'package:flutter/material.dart';
import 'package:storey/navbar.dart';

// import 'spreadsheet_data.dart';

void main() async {
  // final gsheets = GSheets(credentials);
  // final ss = await gsheets.spreadsheet(spreadsheetId);
  // var sheet = ss.worksheetByTitle('Sheet1');
  // await sheet!.values.insertValue('Mostafa', column: 1, row: 1);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyNavigationBar(),
    );
    // return MainBooksPage();
  }
}
