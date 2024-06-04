import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:iconsax/iconsax.dart';
import 'package:qibla_finder/constants/colors.dart';
import 'package:qibla_finder/constants/image_strings.dart';
import 'package:qibla_finder/constants/sizes.dart';
import 'package:qibla_finder/screens/home_screen/widgets/compass_bottom_sheet.dart';
import 'package:qibla_finder/screens/home_screen/widgets/menu_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
  // -- Floating Action Button
      floatingActionButton: FloatingActionButton(
        onPressed: () => compassBottomSheet(context),        
        backgroundColor: XColors.primary,
        foregroundColor: Colors.white,
        child: const Icon(CupertinoIcons.compass, size: XSizes.iconLg,),
        ),

// --- Body
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: XColors.bgGradient
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: XSizes.lg, right: XSizes.lg),
          child: Column(
            children: [
              const SizedBox(height: XSizes.xl,),
                
  // --- Header Section
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
      // --- Cresent Image Header            
                  SvgPicture.asset(
                    XImages.cresent,
                    height: MediaQuery.of(context).size.width * 0.7,
                    ),
      // --- "More / Settings" Icon Button
                  IconButton(
                    onPressed: (){},
                    icon: const Icon(Icons.more_horiz, size: XSizes.iconLg, color: XColors.secondary,)
                  ),
                ],
              ),
                
  // -- Menu Section
              XMenuButton(onTap: (){Navigator.pushNamed(context, '/quran_screen');}, icon: Iconsax.book, title: 'Quran'),
              const SizedBox(height: XSizes.spaceBtwItems,),
              XMenuButton(onTap: (){}, icon: Icons.mosque, title: 'Prayer Times'),
              const SizedBox(height: XSizes.spaceBtwItems,),
              XMenuButton(onTap: (){}, icon: Iconsax.bookmark, title: 'Saved Suras'),
              const SizedBox(height: XSizes.spaceBtwItems,),
  // ---
              Container(
                height: 150,
                decoration: BoxDecoration(
                  color: XColors.secondary,
                  borderRadius: BorderRadius.circular(10)
                ),
              )
              
            ],
          ),
        )
      ),
    );
  }
}

