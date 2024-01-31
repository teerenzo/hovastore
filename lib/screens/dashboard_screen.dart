import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:hovastore/components/Header.dart';
import 'package:hovastore/components/productList.dart';
import 'package:hovastore/components/sidebar.dart';
import 'package:hovastore/models/productModel.dart';
import 'package:hovastore/components/TransactionMobile.dart';
import 'package:hovastore/components/cart.dart';
import 'package:hovastore/components/cartScreen.dart';
import 'package:hovastore/utils/colors.dart';
import 'package:hovastore/widgets/MenuItem.dart';
import 'package:hovastore/widgets/cartItem.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    int _selectedIndex = 1;

    List<Widget> _widgetOptions = <Widget>[
      Text('Home Page',
          style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
      Text('Transactions Page',
          style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
      Text('Inventory Page',
          style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
      Text('Profile Page',
          style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
    ];

    void _onItemTapped(int index) {
      setState(() {
        _selectedIndex = index;
      });
    }

    final List<Product> products = [
      // Add more products as needed
    ];
    return Scaffold(
        body: screenSize.width > 600
            ? Row(
                children: [
                  SideMenu(),
                  Expanded(
                    child: Column(
                      children: [
                        Header(),
                        Expanded(
                          child: Container(
                            color: secondaryColor,
                            child: Row(
                              children: [ProductListUi(), Cart()],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              )
            : Transaction());
  }
}
