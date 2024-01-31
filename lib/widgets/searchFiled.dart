import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hovastore/provider/product_provider.dart';
import 'package:hovastore/services/productService.dart';
import 'package:hovastore/utils/colors.dart';

class SearchField extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ref) {
    final search = ref.watch(searchProvider);
    return TextFormField(
      onChanged: (String value) {
        // Handle search logic when the user changes the search term
        changeSearchQuery(ref, value);
      },
      decoration: InputDecoration(
        labelText: 'Search by name / barcode',
        prefixIcon: Icon(Icons.search),
        labelStyle: TextStyle(
          color: Colors.grey,
        ),

        prefixIconColor: greenColor,

        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: Colors.grey,
            width: 1,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: Colors.grey,
            width: 1,
          ),
        ),

        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: Colors.grey,
            width: 1,
          ),
        ),
        // Optionally, you could add a suffix icon, padding, etc.
      ),
      keyboardType: TextInputType.text,
    );
  }
}
