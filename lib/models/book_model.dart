import 'package:flutter/foundation.dart';
import 'package:its_quran/models/books_data.dart';

class Book {
  final String title;
  final String small_thumbnail;
  final String medium_thumbnail;
  final String big_thumbnail;
  final BooksData book;
  // final Books attachments; //item in a map  inside a map

  Book({
    this.title,
    this.small_thumbnail,
    this.medium_thumbnail,
    this.big_thumbnail,
    this.book,
    // this.attachments
  });
  factory Book.fromJson(Map<String, dynamic> jsonData) {
    return Book(
      title: jsonData["title"],
      small_thumbnail: jsonData["small_thumbnail"],
      medium_thumbnail: jsonData["medium_thumbnail"],
      big_thumbnail: jsonData["big_thumbnail"],
      book: BooksData.fromJson(jsonData['book']),
      // attachments: Books.fromJson(jsonData)["attachments"],
    );
  }
  @override
  String toString() {
    return 'Title: $title Small Thumbnail: $small_thumbnail Medium Thumbnail: $medium_thumbnail Big Thumbnail: $big_thumbnail book:${book.toString()}';
  }
}

// import 'package:flutter/foundation.dart';

// class Book {
//   final String title;
//   final String small_thumbnail;
//   final String medium_thumbnail;
//   final String big_thumbnail;
//   final String books_url;
//   final String attachments;

//   Book(
//       {this.title,
//       this.small_thumbnail,
//       this.medium_thumbnail,
//       this.big_thumbnail,
//       this.books_url,
//       this.attachments});
//   factory Book.fromJson(Map<String, dynamic> jsonData) {
//     return Book(
//       title: jsonData["title"],
//       small_thumbnail: jsonData["small_thumbnail"],
//       medium_thumbnail: jsonData["medium_thumbnail"],
//       big_thumbnail: jsonData["big_thumbnail"],
//       books_url: jsonData["books_url"],
//       attachments: jsonData["attachments"],
//     );
//   }
// }
