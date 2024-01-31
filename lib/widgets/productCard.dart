import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hovastore/models/productModel.dart';
import 'package:hovastore/services/cartService.dart';
import 'package:hovastore/utils/colors.dart';

class ProductCard extends ConsumerWidget {
  final Product product;

  ProductCard({required this.product});

  @override
  Widget build(BuildContext context, ref) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: secondaryColor,
          width: 0.5,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 2,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                        // padding: EdgeInsets.all(10),
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          color: lightGreyColor,
                          borderRadius: BorderRadius.circular(100),
                          border: Border.all(
                            color: product.quantity! > 5
                                ? greenColor
                                : product.quantity == 0
                                    ? redColor
                                    : Colors.orange,
                            width: 0.5,
                          ),
                        ),
                        child: Center(
                          child: Text(
                            '${product.quantity}',
                            style: TextStyle(
                              fontSize: 10,
                              color: product.quantity! > 5
                                  ? greenColor
                                  : product.quantity == 0
                                      ? redColor
                                      : Colors.orange,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        )),
                    SizedBox(width: 8),
                    Text(
                      product.name!,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Spacer(),
                Container(
                  // padding: EdgeInsets.all(10),
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: lightGreyColor,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: primaryColor,
                      width: 0.5,
                    ),
                  ),
                  child: Center(
                      child: Icon(
                    Icons.more_horiz,
                    color: primaryColor,
                  )),
                )
              ],
            ),
          ),
          SizedBox(height: 8),
          Divider(),
          SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                "${product.price}",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: blackColor,
                ),
              ),
              SizedBox(height: 8),
              ElevatedButton(
                onPressed: () {
                  addToCart(ref, product);
                },
                child: Text('ADD TO CART'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: primaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 8),
        ],
      ),
    );
  }
}
