import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:iconsax/iconsax.dart';
import 'package:qibla_finder/common_widgets/app_bar.dart';
import 'package:qibla_finder/constants/colors.dart';
import 'package:qibla_finder/constants/image_strings.dart';
import 'package:qibla_finder/constants/sizes.dart';
import 'package:qibla_finder/screens/home_screen/widgets/compass_bottom_sheet.dart';
import 'package:qibla_finder/screens/home_screen/widgets/menu_button.dart';
import 'package:qibla_finder/theme/custom_themes/text_theme.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {  
    const String appBarTitle = "Muslim Qibla App";
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: const XAppBar(appBarTitle: appBarTitle),
  
// --- Body
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: XColors.bgGradient
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: XSizes.lg, right: XSizes.lg),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
  // --- Greeting
              const SizedBox(height: kToolbarHeight + XSizes.spaceBtwSections,),
              Text('Assalamualaikum',  style: TextStyle(color: Colors.grey[400]),),
              const SizedBox(height: XSizes.spaceBtwItems,),
                
  // --- Header Card (Surah of the day)
              const HeaderCard(),
                
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
  // -- Floating Action Button
      floatingActionButton: FloatingActionButton(
        onPressed: () => compassBottomSheet(context),        
        backgroundColor: XColors.primary,
        foregroundColor: Colors.white,
        child: const Icon(CupertinoIcons.compass, size: XSizes.iconLg,),
        ),
    );
  }
}



class HeaderCard extends StatelessWidget {
  const HeaderCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: MediaQuery.of(context).size.width * 0.35,
          width: double.infinity,
          
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(XSizes.borderRadiusMd),
            color: XColors.primary,
          ),
        ),
        SvgPicture.asset(
          XImages.cresent,
          height: MediaQuery.of(context).size.width * 0.41,
          ),
        Container(
          padding: EdgeInsets.only(top: XSizes.lg, right: XSizes.lg),
          alignment: Alignment.centerRight,
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Icon(Iconsax.book5, color: Colors.grey[400], size: XSizes.iconSm,),
                  Text('Surah of the day.', style: TextStyle(color: Colors.grey[400]),),
                ],
              ),
              const SizedBox(height: XSizes.spaceBtwItems,),
              Text('Al-Fatiah', style: XTextTheme.appTextTheme.titleMedium,),
              Text('Surah No: 1',  style: TextStyle(color: Colors.grey[400]),),
            ],
          ),
        )
      ],
    );
  }
}

