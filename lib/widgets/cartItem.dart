import 'package:flutter/material.dart';
import 'package:hovastore/models/productModel.dart';
import 'package:hovastore/screens/dashboard_screen.dart';
import 'package:hovastore/utils/colors.dart';

class CartItem extends StatelessWidget {
  Product? product;
  CartItem({super.key, this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              product!.name!,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),

            // Spacer(),

            IconButton(
                onPressed: () => {},
                icon: Icon(
                  Icons.more_horiz,
                  color: primaryColor,
                )),
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'QTY 1 x 1000',
              style: TextStyle(
                fontSize: 16,
                // fontWeight: FontWeight.w100,
              ),
            ),
            Text(
              '${product!.price}',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Divider(
          color: whiteColor,
        ),
      ]),
    );
  }
}
