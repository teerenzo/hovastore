import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hovastore/provider/product_provider.dart';
import 'package:hovastore/screens/cart.dart';
import 'package:hovastore/utils/colors.dart';

class CartScreen extends ConsumerWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final cartData = ref.watch(cartProvider);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        elevation: 0,
        title: Text(
          "CONFIRM TRANSACTION",
          style: TextStyle(
              fontSize: 16, fontWeight: FontWeight.bold, color: whiteColor),
        ),
        actions: [
          Container(
            padding: EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
            alignment: Alignment.centerLeft,
            child: Container(
              decoration: BoxDecoration(
                color: blackColor,
                borderRadius: BorderRadius.circular(100),
              ),
              child: Stack(
                children: <Widget>[
                  IconButton(
                    icon: Icon(Icons.shopping_cart, color: Colors.white),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => CartScreen()),
                      );
                      // Handle the cart icon functionality here
                    },
                  ),
                  Positioned(
                    right: 11,
                    top: 11,
                    child: Container(
                      padding: EdgeInsets.all(2),
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(6),
                      ),
                      constraints: BoxConstraints(
                        minWidth: 14,
                        minHeight: 14,
                      ),
                      child: Text(
                        '${cartData.length}',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 8,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
      body: Container(
        child: Center(child: Cart()),
      ),
    );
  }
}
