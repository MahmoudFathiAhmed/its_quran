import 'attachments.dart';

class BooksData {
  Attachments books_data;
  BooksData({this.books_data});
  factory BooksData.fromJson(Map<String, dynamic> jsonData) {
    return BooksData(books_data: Attachments.fromJson(jsonData['books_data']));
  }
  @override
  String toString() {
    // TODO: implement toString
    return 'books data: ${books_data.toString()}';
  }
}

// class Books {
//   final List<dynamic> books;
//   Books({this.books});
//   factory Books.fromJson(Map<String, dynamic> jsonData) {
//     return Books(
//       books: jsonData['books']
//       //may be data not books.
//       );
//   }
// }
