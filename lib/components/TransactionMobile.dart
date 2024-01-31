import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hovastore/components/productList.dart';
import 'package:hovastore/provider/product_provider.dart';
import 'package:hovastore/components/cartScreen.dart';
import 'package:hovastore/utils/colors.dart';

class Transaction extends ConsumerStatefulWidget {
  const Transaction({super.key});

  @override
  ConsumerState<Transaction> createState() => _TransactionState();
}

class _TransactionState extends ConsumerState<Transaction> {
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

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, child) {
      final cartData = ref.watch(cartProvider);
      return Scaffold(
          appBar: AppBar(
            backgroundColor: primaryColor,
            elevation: 0,
            title: Text(
              "NEW TRANSACTION",
              style: TextStyle(
                  fontSize: 16, fontWeight: FontWeight.bold, color: whiteColor),
            ),
            actions: [
              Container(
                padding:
                    EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
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
                            MaterialPageRoute(
                                builder: (context) => CartScreen()),
                          );
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
            color: primaryColor,
            child: Column(
              children: [
                Container(
                  height: 20,
                  decoration: BoxDecoration(
                    color: lightGreyColor,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                    border: Border(
                      bottom: BorderSide(
                        color: lightGreyColor,
                        width: 1,
                      ),
                    ),
                  ),
                  child: null,
                ),
                Container(
                  height: MediaQuery.of(context).size.height - 133,
                  color: lightGreyColor,
                  child: ProductListUi(),
                ),
              ],
            ),
          ),
          bottomNavigationBar: BottomNavigationBar(
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.business),
                label: 'Transactions',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.inventory),
                label: 'Inventory',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.person,
                ),
                label: 'Profile',
              ),
            ],
            currentIndex: _selectedIndex,
            selectedItemColor: primaryColor,
            unselectedItemColor: greyColor,
            showUnselectedLabels: true,
            onTap: _onItemTapped,
          ));
    });
  }
}
