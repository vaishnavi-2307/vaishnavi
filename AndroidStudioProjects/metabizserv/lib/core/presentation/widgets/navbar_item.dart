import 'package:flutter/material.dart';
import 'package:metabizserv/core/constants/styles.dart';

class NavbarItem extends StatelessWidget {
  const NavbarItem({
    Key? key,
    required this.svgIconPath,
    required this.text,
    this.onTap,
    this.iconSize = 20,
    required this.isSelected,
    required this.icons,
  }) : super(key: key);
  final String svgIconPath;
  final String text;
  final VoidCallback? onTap;
  final bool isSelected;
  final double iconSize;
  final IconData icons;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 8),
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        decoration: BoxDecoration(
          color: isSelected ? Styles.darkGreyColor : null,
        ),
        child: Row(children: [
          Icon(
            icons,
            color: Colors.white,
          ),
          const SizedBox(
            width: 16,
          ),
          Text(
            text,
            style: TextStyle(
                fontSize: 14,
                fontWeight: isSelected ? FontWeight.w600 : null,
                color: Colors.white),
          ),
        ]),
      ),
    );
  }
}
