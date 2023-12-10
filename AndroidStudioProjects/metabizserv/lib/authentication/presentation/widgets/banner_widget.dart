import 'package:flutter/material.dart';
import 'package:metabizserv/core/constants/images.dart';

class BannerWidget extends StatelessWidget {
  const BannerWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      AppImages.login,
      height: double.infinity,
      fit: BoxFit.cover,
    );
  }
}
