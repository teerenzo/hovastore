import 'package:flutter/material.dart';

import '../utils/colors.dart';

class MenuItem extends StatelessWidget {
  void Function()? onTap;
  bool isSelected = false;
  String label;
  IconData icon;
  IconData? iconSelected;
  void Function(bool)? onHover;
  bool? isHover = false;

  MenuItem(
      {required this.isSelected,
      required this.label,
      required this.icon,
      this.iconSelected,
      this.onHover,
      this.isHover,
      this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      onHover: onHover,
      child: Container(
        decoration: BoxDecoration(
          color: isHover != null && isHover!
              ? blackColor
              : isSelected
                  ? blackColor
                  : Colors.transparent,
          border: Border(
            bottom: BorderSide(
              color: greyColor,
              width: 1,
            ),
          ),
        ),
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.all(6),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: 8),
              Icon(
                isSelected ? iconSelected : icon,
                color: isSelected ? whiteColor : greyColor,
              ),
              SizedBox(height: 8),
              Text(
                label,
                style: TextStyle(
                  color: isSelected ? whiteColor : greyColor,
                  fontSize: 14,
                ),
              ),
              SizedBox(height: 8)
            ],
          ),
        ),
      ),
    );
  }
}
