import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:hovastore/components/Header.dart';
import 'package:hovastore/components/productList.dart';
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

class CustomAppBarCu extends StatelessWidget {
  const CustomAppBarCu({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class SideMenu extends StatefulWidget {
  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  int _currentSelected = 0;
  int _currentHover = 0;
  void _onHover(int index) {
    setState(() {
      _currentHover = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      color: secondaryColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(color: primaryColor),
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Text(
                'HOVA STORE',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Expanded(
              child: Container(
            child: Column(
              children: [
                MenuItem(
                    onHover: (e) => {
                          _onHover(0),
                        },
                    onTap: () => {
                          print("tapped"),
                          setState(() {
                            _currentSelected = 0;
                          })
                        },
                    isSelected: _currentSelected == 0,
                    isHover: _currentHover == 0,
                    label: "Home",
                    icon: Icons.home,
                    iconSelected: Icons.home_filled),
                MenuItem(
                    onHover: (e) => {
                          _onHover(1),
                        },
                    onTap: () => {
                          print("tapped"),
                          setState(() {
                            _currentSelected = 1;
                          })
                        },
                    isSelected: _currentSelected == 1,
                    label: "Sell",
                    isHover: _currentHover == 1,
                    icon: Icons.home,
                    iconSelected: Icons.home_filled),
                MenuItem(
                    onHover: (e) => {
                          _onHover(2),
                        },
                    onTap: () => {
                          print("tapped"),
                          setState(() {
                            _currentSelected = 2;
                          })
                        },
                    isSelected: _currentSelected == 2,
                    isHover: _currentHover == 2,
                    label: "Transactions",
                    icon: Icons.home,
                    iconSelected: Icons.home_filled),
                MenuItem(
                    onHover: (e) => {
                          _onHover(3),
                        },
                    onTap: () => {
                          print("tapped"),
                          setState(() {
                            _currentSelected = 3;
                          })
                        },
                    isSelected: _currentSelected == 3,
                    isHover: _currentHover == 3,
                    label: "Expenses",
                    icon: Icons.home,
                    iconSelected: Icons.home_filled),
                MenuItem(
                    onHover: (e) => {
                          _onHover(4),
                        },
                    onTap: () => {
                          print("tapped"),
                          setState(() {
                            _currentSelected = 4;
                          })
                        },
                    isSelected: _currentSelected == 4,
                    isHover: _currentHover == 4,
                    label: "Settings",
                    icon: Icons.home,
                    iconSelected: Icons.home_filled),
              ],
            ),
          )),
          Container(
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  Text("Powered by ",
                      style: TextStyle(color: whiteColor, fontSize: 12)),
                  const SizedBox(height: 5),
                  Text(
                    "HOVA AI",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: whiteColor),
                  ),
                ],
              ))
        ],
      ),
    );
  }
}
