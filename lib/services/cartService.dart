import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hovastore/models/productModel.dart';
import 'package:hovastore/provider/product_provider.dart';

void addToCart(WidgetRef ref, Product product) {
  ref.read(cartProvider.notifier).update((state) => [...state, product]);
}

void removeFromCart(WidgetRef ref, Product product) {
  ref
      .read(cartProvider.notifier)
      .update((state) => state.where((item) => item.id != product.id).toList());
}

void clearCart(WidgetRef ref) {
  ref.read(cartProvider.notifier).state = [];
}

double getCartTotal(WidgetRef ref) {
  double total = 0;
  ref.watch(cartProvider).forEach((product) {
    total += double.parse(product.price!.toString());
  });
  return total;
}

// amount to pay for tax 18% per each product
int getCartTotalTax(WidgetRef ref) {
  double total = 0;
  ref.watch(cartProvider).forEach((product) {
    // calculate tax for each product
    double tax = double.parse(product.price!.toString()) * 0.18;
    total += tax;
  });
  return (total).toInt();
}

double getCartTotalAmount(WidgetRef ref) {
  double total = 0;
  ref.watch(cartProvider).forEach((product) {
    total += double.parse(product.price!.toString());
  });
  return total + (total * 0.18);
}
