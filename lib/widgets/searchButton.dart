import 'package:flutter/material.dart';
class SearchButon extends StatelessWidget {
  const SearchButon({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Image.asset('assets/search.png'),
      onTap: () => Navigator.of(context).pushNamed('/test'),
    );
  }
}