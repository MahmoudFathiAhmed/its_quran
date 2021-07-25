import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:its_quran/models/book_model.dart';
import 'package:its_quran/models/books_model.dart';

class BooksApi {
  Future<List<Book>> fetchBooks() async {
    try {
      http.Response response = await http.get(Uri.parse(
          'https://cloudelib.midadedev.com/api/api-json/items/all/books?page_number=2&per_page=30&author=1&sort=title'));
      if (response.statusCode == 200) {
        String data = response.body;
        var jsonData = jsonDecode(data);
        Books books = Books.fromJson(jsonData);
        List<Book> booksList =
            books.books.map((e) => Book.fromJson(e)).toList();
        return booksList;
      } else {
        print('status code = ${response.statusCode}');
      }
    } catch (ex) {
      print(ex);
    }
  }
}
//latest & mostpopular
