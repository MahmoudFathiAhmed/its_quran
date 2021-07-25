
import 'package:flutter/cupertino.dart';



class HomeProvider extends ChangeNotifier {




String author="";

changeAuthor({@required author}){
this.author=author;


  notifyListeners();
}







}

