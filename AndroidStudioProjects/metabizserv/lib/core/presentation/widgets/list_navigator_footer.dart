import 'package:flutter/material.dart';

import 'page_indicator.dart';

class ListNavigatorFooter extends StatelessWidget {
  final VoidCallback? onNextClick;
  final VoidCallback? onPreviousClick;

  const ListNavigatorFooter({
    Key? key,
    required this.onNextClick,
    required this.onPreviousClick,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 16, 24, 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextButton.icon(
            onPressed: onPreviousClick,
            icon: const Icon(
              Icons.west,
              size: 16,
            ),
            label: const Text('Previous'),
          ),
          Row(
            children: [
              PageIndicator(
                pageNo: 1,
                onTap: () {},
                isSelected: false,
              ),
              PageIndicator(
                pageNo: 2,
                onTap: () {},
                isSelected: true,
              ),
              PageIndicator(
                pageNo: 3,
                onTap: () {},
                isSelected: false,
              )
            ],
          ),
          Directionality(
            textDirection: TextDirection.rtl,
            child: TextButton.icon(
              onPressed: onNextClick,
              icon: const Icon(
                Icons.east,
                size: 16,
              ),
              label: const Text('Next'),
            ),
          )
        ],
      ),
    );
  }
}
