import 'package:flutter/material.dart';
import 'dart:async';

class SearchTextField extends StatefulWidget {
  final Function(String) onSearchChanged;
  final String hintText;

  const SearchTextField({
    Key? key,
    required this.onSearchChanged,
    this.hintText = 'Search...',
  }) : super(key: key);

  @override
  SearchTextFieldState createState() => SearchTextFieldState();
}

class SearchTextFieldState extends State<SearchTextField> {
  TextEditingController searchController = TextEditingController();
  Timer? _debounceTimer;

  @override
  void dispose() {
    _debounceTimer?.cancel();
    super.dispose();
  }

  void _onSearchChanged(String value) {
    _debounceTimer?.cancel();
    _debounceTimer = Timer(const Duration(milliseconds: 500), () {
      widget.onSearchChanged(value);
    });
  }

  void _clearSearch() {
    searchController.clear();
    widget.onSearchChanged('');
    FocusScope.of(context).unfocus();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: searchController,
      decoration: InputDecoration(
        hintText: widget.hintText,
        suffixIcon: searchController.text.isNotEmpty
            ? IconButton(
                icon: const Icon(Icons.clear),
                onPressed: _clearSearch,
              )
            : const Icon(Icons.search),
        border: InputBorder.none,
      ),
      onChanged: _onSearchChanged,
    );
  }
}
