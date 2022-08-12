import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  final String label;

  const SearchBar({
    Key? key,
    required this.label,
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
            labelText: label,
            floatingLabelBehavior: FloatingLabelBehavior.never,
            prefixIcon: Icon(Icons.search)
        ),
      ),
    );
  }
}