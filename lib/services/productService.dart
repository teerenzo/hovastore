import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hovastore/models/productModel.dart';
import 'package:hovastore/provider/product_provider.dart';

// change search query
void changeSearchQuery(WidgetRef ref, String query) {
  ref.read(searchProvider.notifier).state = query;
}
