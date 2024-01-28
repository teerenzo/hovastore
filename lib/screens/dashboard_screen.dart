import 'package:flutter/material.dart';
import 'package:hovastore/utils/colors.dart';
import 'package:hovastore/widgets/MenuItem.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    final List<Product> products = [
      Product(name: 'Laptop Charger', price: 'RWF 1200'),
      Product(name: 'Phone Charger', price: 'RWF 1000'),
      Product(name: 'Laptop Charger', price: 'RWF 1200'),
      Product(name: 'Phone Charger', price: 'RWF 1000'),
      Product(name: 'Laptop Charger', price: 'RWF 1200'),
      Product(name: 'Phone Charger', price: 'RWF 1000'),
      Product(name: 'Laptop Charger', price: 'RWF 1200'),
      Product(name: 'Phone Charger', price: 'RWF 1000'),
      // Add more products as needed
    ];
    return Scaffold(
        body: Row(
      children: [
        SideMenu(),
        Expanded(
          child: Column(
            children: [
              Header(),
              Expanded(
                child: Container(
                  color: lightGreyColor,
                  child: Row(
                    children: [
                      Expanded(
                          child: Container(
                        // color: Colors.red,
                        padding: EdgeInsets.all(10),
                        child: GridView.builder(
                          itemCount: products.length,
                          itemBuilder: (BuildContext context, int index) {
                            return ProductCard(product: products[index]);
                            ;
                          },
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  crossAxisSpacing: 8,
                                  mainAxisSpacing: 8,
                                  childAspectRatio: (2 / 1)),
                        ),
                      )),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.4,
                        color: secondaryColor,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    ));
  }
}

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

class Product {
  final String name;
  final String price;

  Product({required this.name, required this.price});
}

class ProductCard extends StatelessWidget {
  final Product product;

  ProductCard({required this.product});

  @override
  Widget build(BuildContext context) {
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
                            color: greenColor,
                            width: 0.5,
                          ),
                        ),
                        child: Center(
                          child: Text(
                            '111',
                            style: TextStyle(
                              fontSize: 16,
                              color: greenColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        )),
                    SizedBox(width: 8),
                    Text(
                      product.name,
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
                product.price,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: blackColor,
                ),
              ),
              SizedBox(height: 8),
              ElevatedButton(
                onPressed: () {
                  // Add your add to cart functionality here
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
                  Text("Powered by "),
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
