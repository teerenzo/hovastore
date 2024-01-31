import 'package:flutter/material.dart';
import 'package:hovastore/utils/colors.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
        padding: EdgeInsets.all(10),
        color: whiteColor,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        color: lightGreyColor,
                        borderRadius: BorderRadius.circular(10)),
                    child: Icon(Icons.store)),
                SizedBox(
                  width: 10,
                ),
                Text(
                  "HOVA STORE LTD",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: secondaryColor),
                ),
              ],
            ),
            Row(
              children: [
                Icon(Icons.account_circle_rounded),
                SizedBox(
                  width: 5,
                ),
                Text("Xavier N.",
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: secondaryColor)),
                SizedBox(
                  width: 20,
                ),

                // logout button
                Container(
                    padding:
                        EdgeInsets.only(left: 13, right: 13, top: 5, bottom: 5),
                    decoration: BoxDecoration(
                        border: Border.all(color: primaryColor, width: 0.8),
                        borderRadius: BorderRadius.circular(16)),
                    child: Row(
                      children: [
                        Icon(
                          Icons.logout,
                          color: primaryColor,
                          size: 15,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          "LOGOUT",
                          style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                              color: primaryColor),
                        ),
                      ],
                    )),
              ],
            )
          ],
        ),
      )
    ]);
  }
}
