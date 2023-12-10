import 'package:flutter/material.dart';

class PageHeader extends StatelessWidget {
  final String title;
  final List<Widget>? actions;

  const PageHeader({Key? key, required this.title, this.actions})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(24, 0, 24, actions == null ? 18 : 14),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
          ),
          ...?actions
        ],
      ),
    );
  }
}
