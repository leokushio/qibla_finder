import 'package:flutter/material.dart';
import 'package:qibla_finder/constants/colors.dart';
import 'package:qibla_finder/constants/sizes.dart';
import 'package:qibla_finder/theme/custom_themes/text_theme.dart';

class TabBarQuranScreen extends StatelessWidget {
  const TabBarQuranScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: XSizes.lg, right: XSizes.lg),
      child: Container(
        width: MediaQuery.of(context).size.width,
        // color: XColors.primary,
        child: TabBar(
          labelStyle:  XTextTheme.appTextTheme.titleMedium,
          unselectedLabelStyle:  XTextTheme.appTextTheme.titleMedium,
          dividerHeight: 0,
          indicatorSize: TabBarIndicatorSize.tab,
          indicatorColor: XColors.secondary,
          tabs: const [
            Tab(child: Text('Surah'),),
            Tab(child: Text('Juz'),),
            Tab(child: Text('Page'),),
          ]),
      ),
    );
  }
}