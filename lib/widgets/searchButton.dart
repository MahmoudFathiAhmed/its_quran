import 'package:flutter/material.dart';
import 'package:its_quran/screens/search_screen.dart';
class SearchButon extends StatelessWidget {
  const SearchButon({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Image.asset('assets/search.png'),
      onTap: () => Navigator.of(context).pushNamed(SearchScreen.routeName),
    );
  }
}