import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';
import 'package:qibla_finder/common_widgets/app_bar.dart';
import 'package:qibla_finder/constants/colors.dart';
import 'package:qibla_finder/constants/image_strings.dart';
import 'package:qibla_finder/constants/sizes.dart';
import 'package:qibla_finder/providers/api_provider.dart';
import 'package:qibla_finder/screens/home_screen/widgets/compass_bottom_sheet.dart';
import 'package:qibla_finder/screens/quran_screen/tabs/surah_tab.dart';
import 'package:qibla_finder/theme/custom_themes/text_theme.dart';
import 'package:yandex_mobileads/mobile_ads.dart';
import 'package:qibla_finder/models/surah_list_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    
    super.initState();
    MobileAds.setUserConsent(true);
    MobileAds.initialize();
  }
  @override
  Widget build(BuildContext context) {  
    final providerAPI = Provider.of<APIProvider>(context);
    final surahs = Provider.of<APIProvider>(context).surahsListModel.data;
    providerAPI.getSurahsFromAPI();
    const String appBarTitle = "Muslim Qibla App";
    final banner = BannerAd(
      adUnitId: 'R-M-10310535-1', 
      adSize: BannerAdSize.sticky(width: MediaQuery.of(context).size.width.round())
      );


    return Scaffold(
      bottomNavigationBar: Container(
        // height: 70, 
        width: MediaQuery.of(context).size.width,
        color: Colors.white,
        child: AdWidget(bannerAd: banner),
        ),
      // persistentFooterButtons: [Container(height: 100, width: MediaQuery.of(context).size.width,color: Colors.blue,)],
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
              HeaderCard(surahs: surahs),
                
  // -- Surahs Section
              Expanded(
                child: SurahTab(surahs: surahs)
              ),
                     
            ],
          ),
        )
      ),
  // -- Floating Action Button
      floatingActionButton: FloatingActionButton(
        onPressed: () => compassBottomSheet(context),        
        backgroundColor: XColors.secondary,
        foregroundColor: XColors.primary,
        elevation: 20,
        
        
        child: const Icon(CupertinoIcons.compass, size: XSizes.iconLg,),
        ),
    );
  }
}



class HeaderCard extends StatelessWidget {
  const HeaderCard({
    required this.surahs,
    super.key,
  });

  final List<Datum>surahs;

  @override
  Widget build(BuildContext context) {
    int randomNumber = 0;
    randomNumber = Provider.of<APIProvider>(context).random;
    
    
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
          padding: const EdgeInsets.only(top: XSizes.lg, right: XSizes.lg),
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
              Text(
                surahs.isNotEmpty
                ? surahs[randomNumber].name : '', 
                style: XTextTheme.appTextTheme.titleMedium,
                ),
              Text(
                surahs.isNotEmpty
                ? surahs[randomNumber].englishName : '', 
                style: XTextTheme.appTextTheme.titleMedium,
                ),
              Text('Surah No: ${randomNumber+1}',  style: TextStyle(color: Colors.grey[400]),),
            ],
          ),
        )
      ],
    );
  }
}

