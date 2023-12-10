import 'package:flutter/material.dart';
import 'package:metabizserv/core/constants/styles.dart';

class PageIndicator extends StatelessWidget {
  final int pageNo;
  final bool isSelected;
  final VoidCallback onTap;

  const PageIndicator({
    Key? key,
    required this.pageNo,
    required this.isSelected,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(right: 12),
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
        decoration: BoxDecoration(
            color: isSelected ? Styles.blueColor.withOpacity(0.1) : null,
            borderRadius: BorderRadius.circular(8)),
        child: Text(
          '$pageNo',
          style: TextStyle(
              color: Styles.blueColor,
              fontWeight: isSelected ? FontWeight.bold : null),
        ),
      ),
    );
  }
}
