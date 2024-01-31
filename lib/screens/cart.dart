import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:hovastore/components/cartItem.dart';
import 'package:hovastore/models/productModel.dart';
import 'package:hovastore/provider/product_provider.dart';
import 'package:hovastore/services/cartService.dart';
import 'package:hovastore/utils/colors.dart';

class Cart extends ConsumerWidget {
  const Cart({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final screenSize = MediaQuery.of(context).size;

    final cartData = ref.watch(cartProvider);

    final List<Product> products = [
      // Add more products as needed
    ];
    return Container(
      width: screenSize.width > 600
          ? MediaQuery.of(context).size.width * 0.35
          : double.infinity,
      color: screenSize.width > 600 ? secondaryColor : whiteColor,
      child: Container(
        padding: const EdgeInsets.all(14),
        color: screenSize.width > 600 ? secondaryColor : whiteColor,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 20,
              ),
              Text(
                "Please review the selected products and the total amount to confirm the transaction..",
                style: TextStyle(
                    color: screenSize.width > 600
                        ? whiteColor
                        : HexColor("545150")),
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  onPressed: () => {clearCart(ref)},
                  child: Text("Clear"),
                  style: ElevatedButton.styleFrom(
                    primary: secondaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                      side: BorderSide(color: whiteColor, width: 0.8),
                    ),
                  )),
              SizedBox(
                height: 20,
              ),
              Container(
                padding: EdgeInsets.only(top: 10),
                // height: 200,
                decoration: BoxDecoration(
                    color: lightGreyColor,
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  children: [
                    Container(
                        padding: EdgeInsets.all(10),
                        // color: primaryColor,
                        child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: cartData.length,
                          itemBuilder: (BuildContext context, int index) {
                            return CartItem(product: cartData[index]);
                          },
                        )),

                    Container(
                      padding: EdgeInsets.only(left: 10, right: 10, bottom: 15),
                      child: Column(children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Before Disc.",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              "RF ${getCartTotal(ref)}",
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Tax (18%)',
                              style: TextStyle(
                                fontSize: 16,
                                // fontWeight: FontWeight.w100,
                              ),
                            ),
                            Text(
                              'RF ${getCartTotalTax(ref)}',
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
                      ]),
                    ),

                    // footer
                    Container(
                      padding: EdgeInsets.only(
                          left: 10, right: 10, top: 15, bottom: 15),
                      decoration: BoxDecoration(
                          color: primaryColor,
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(10),
                              bottomRight: Radius.circular(10))),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "After Disc.",
                            style: TextStyle(
                                fontSize: 16,
                                color: whiteColor,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "RF ${getCartTotalAmount(ref)}",
                            style: TextStyle(
                                fontSize: 16,
                                color: whiteColor,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Container(
                      width: 110,
                      padding: EdgeInsets.only(
                          left: 13, right: 13, top: 5, bottom: 5),
                      decoration: BoxDecoration(
                        border: Border.all(color: primaryColor, width: 0.8),
                        borderRadius: BorderRadius.circular(4),
                        color: whiteColor,
                      ),
                      child: Row(
                        children: [
                          Icon(
                            Icons.add,
                            color: primaryColor,
                            size: 15,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            "CUSTOMER",
                            style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                                color: primaryColor),
                          ),
                        ],
                      )),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                      width: 150,
                      padding: EdgeInsets.only(
                          left: 13, right: 13, top: 5, bottom: 5),
                      decoration: BoxDecoration(
                        border: Border.all(color: primaryColor, width: 0.8),
                        borderRadius: BorderRadius.circular(4),
                        color: whiteColor,
                      ),
                      child: Row(
                        children: [
                          Icon(
                            Icons.add,
                            color: primaryColor,
                            size: 15,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            "PAYMENT METHOD",
                            style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                                color: primaryColor),
                          ),
                        ],
                      )),
                ],
              ),
              SizedBox(
                height: 50,
              ),
              Row(
                children: [
                  Container(
                      padding: EdgeInsets.only(
                          left: 15, right: 15, top: 8, bottom: 8),
                      decoration: BoxDecoration(
                        border: Border.all(color: primaryColor, width: 0.8),
                        borderRadius: BorderRadius.circular(4),
                        color: whiteColor,
                      ),
                      child: Row(
                        children: [
                          Text(
                            "CLEAR",
                            style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                                color: HexColor('E74C3C')),
                          ),
                        ],
                      )),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                      // width: 150,
                      padding: EdgeInsets.only(
                          left: 13, right: 13, top: 5, bottom: 5),
                      decoration: BoxDecoration(
                        border: Border.all(color: whiteColor, width: 0.8),
                        borderRadius: BorderRadius.circular(4),
                        color: primaryColor,
                      ),
                      child: Row(
                        children: [
                          Icon(
                            Icons.add,
                            color: whiteColor,
                            size: 15,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            "CONFIRM TRANSAvvCTION",
                            style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                                color: whiteColor),
                          ),
                        ],
                      )),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
