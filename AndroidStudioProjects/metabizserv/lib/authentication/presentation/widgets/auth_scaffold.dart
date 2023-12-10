import 'package:flutter/material.dart';
import 'banner_widget.dart';

class AuthScaffold extends StatelessWidget {
  const AuthScaffold({
    super.key,
    required this.widget,
  });
  final Widget widget;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          const Expanded(
            flex: 2,
            child: BannerWidget(),
          ),
          Expanded(
            flex: 2,
            child: widget,
          ),
        ],
      ),
    );
  }
}
