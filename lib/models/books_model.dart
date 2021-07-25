import 'book_model.dart';
class Books {
  final List<dynamic> books;
  Books({this.books});
  factory Books.fromJson(Map<String, dynamic> jsonData) {
    return Books(
      books: jsonData['books']
      //may be data not books.
      );
  }
}