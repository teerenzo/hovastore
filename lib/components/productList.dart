import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hovastore/models/productModel.dart';
import 'package:hovastore/provider/product_provider.dart';
import 'package:hovastore/screens/dashboard_screen.dart';
import 'package:hovastore/utils/colors.dart';
import 'package:hovastore/widgets/productCard.dart';
import 'package:hovastore/widgets/searchFiled.dart';

class ProductListUi extends ConsumerWidget {
  ProductListUi({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final screenSize = MediaQuery.of(context).size;

    final productsData = ref.watch(productsProvider);
    final search = ref.watch(searchProvider);

    return Expanded(
        child: productsData.when(
      data: (products) {
        List<Product> productsList = search != ''
            ? products
                .where((element) =>
                    element.name!.toLowerCase().contains(search.toLowerCase()))
                .toList()
            : products;
        return Container(
          color: lightGreyColor,
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              // search bar
              Container(
                padding: EdgeInsets.only(bottom: 12),
                child: Row(
                  children: [
                    Expanded(
                      child: SearchField(),
                    ),
                  ],
                ),
              ),

              Expanded(
                child: productsList.length <= 0
                    ? Center(
                        child: Text(
                          'No products found',
                          style: TextStyle(
                            fontSize: 20,
                            color: primaryColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      )
                    : GridView.builder(
                        itemCount: productsList.length,
                        itemBuilder: (BuildContext context, int index) {
                          return ProductCard(product: productsList[index]);
                        },
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: screenSize.width > 600 ? 2 : 1,
                            crossAxisSpacing: 20,
                            mainAxisSpacing: 20,
                            childAspectRatio: (2 / 1)),
                      ),
              ),
            ],
          ),
        );
      },
      loading: () => const Center(
        child: CircularProgressIndicator(),
      ),
      error: (error, stackTrace) => Center(
        child: Text(error.toString()),
      ),
    ));
  }
}
