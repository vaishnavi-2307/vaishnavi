import 'package:flutter/material.dart';
import 'package:metabizserv/core/constants/styles.dart';

class PageLoadingIndicator extends StatelessWidget {
  const PageLoadingIndicator({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Expanded(
      child: Center(
        child: SizedBox.square(
          dimension: 16,
          child: CircularProgressIndicator(
            color: Styles.blueColor,
          ),
        ),
      ),
    );
  }
}
