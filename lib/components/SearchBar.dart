import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {

  const SearchBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextField(
        decoration:InputDecoration(
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide.none
            ),
            fillColor: Colors.grey.shade200,
            filled: true,
            labelText: 'Search Food',
            floatingLabelBehavior: FloatingLabelBehavior.never,
            prefixIcon: Icon(Icons.search)
        ),
      ),
    );
  }
}