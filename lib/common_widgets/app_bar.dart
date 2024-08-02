import 'package:flutter/material.dart';
import 'package:qibla_finder/constants/sizes.dart';

class XAppBar extends StatelessWidget implements PreferredSizeWidget {
  const XAppBar({
    super.key,
    required this.appBarTitle,
  });

  final String appBarTitle;
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(appBarTitle),
      // actions: [Padding(
      //   padding: const EdgeInsets.only(right: XSizes.md),
      //   child: IconButton(
      //     onPressed: (){},
      //     icon: const Icon(Icons.more_horiz), 
      //     iconSize: XSizes.iconLg, 
      //     color: Colors.white,
      //     ),
      // )],
      backgroundColor: Colors.transparent,
      foregroundColor: Colors.white,
      elevation: 0,
    );
  }
}