import 'package:flutter/material.dart';
import 'package:hovastore/utils/colors.dart';
import 'package:hovastore/widgets/MenuItem.dart';

class SideMenu extends StatefulWidget {
  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  int _currentSelected = 1;
  int? _currentHover;
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
