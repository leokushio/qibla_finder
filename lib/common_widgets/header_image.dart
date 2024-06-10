import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:qibla_finder/constants/image_strings.dart';
import 'package:qibla_finder/constants/sizes.dart';

class HeaderImage extends StatelessWidget {
  const HeaderImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: XSizes.appBarHeight * 2,
      child: Stack(
        children: [            
          Positioned(
            top: -80,
            right: -10,
            child: Opacity(
              opacity: 0.2,
              child: SvgPicture.asset(XImages.mosque, height: 200, )
            )
          ),
        ],
      ),
    );
  }
}