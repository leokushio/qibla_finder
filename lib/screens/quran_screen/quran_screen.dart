import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:iconsax/iconsax.dart';
import 'package:qibla_finder/constants/colors.dart';
import 'package:qibla_finder/constants/image_strings.dart';
import 'package:qibla_finder/constants/sizes.dart';

class QuranScreen extends StatelessWidget {
  const QuranScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [

    // ---  BG / Title & back Navigation
        Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(
            gradient: XColors.bgGradient
          ),
          child: Padding(
            padding: const EdgeInsets.only(top: XSizes.appBarHeight),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IconButton(
                  onPressed: ()=> Navigator.pop(context), 
                  icon: const Icon(Icons.arrow_back_ios_new, color: Colors.white,)
                  ),
                // SizedBox(width: XSizes.sm,),
                Text('Quran', style: Theme.of(context).textTheme.headlineLarge,)
              ],
            ),
          ),
        ),

    // --- Mosque Image
        Positioned(
          top: -40,
          right: -10,
          child: Opacity(
            opacity: 0.2,
            child: SvgPicture.asset(XImages.mosque, height: 250, ))

          ),

    // --- Body Widget
        Positioned(
          bottom: 0,
          child: Container(
            height: MediaQuery.of(context).size.height * 0.75,
            width: MediaQuery.of(context).size.width,
            color: Colors.white,
          )
        ),
       
      ],
    );
  }
}