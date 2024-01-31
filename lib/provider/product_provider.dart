import 'package:riverpod/riverpod.dart';
import 'package:flutter/material.dart';
import 'package:hovastore/models/productModel.dart';
import 'package:hovastore/services/apiService.dart';

final productsProvider = FutureProvider<List<Product>>((ref) async {
  return ref.watch(apiServiceProvider).getProducts();
});

final searchProvider = StateProvider<String>((ref) {
  return '';
});

final cartProvider = StateProvider<List<Product>>((ref) {
  return [];
});
