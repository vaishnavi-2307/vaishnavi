import 'package:flutter/material.dart';
import 'package:metabizserv/core/constants/styles.dart';

class PageDivider extends StatelessWidget {
  const PageDivider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => const Divider(
        thickness: 1,
        height: 0,
        color: Styles.borderColor,
      );
}
