import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';
import 'package:qibla_finder/common_widgets/app_bar.dart';
import 'package:qibla_finder/common_widgets/header_image.dart';
import 'package:qibla_finder/constants/colors.dart';
import 'package:qibla_finder/constants/image_strings.dart';
import 'package:qibla_finder/constants/sizes.dart';
import 'package:qibla_finder/providers/api_provider.dart';
import 'package:qibla_finder/screens/quran_screen/tabs/surah_tab.dart';
import 'package:qibla_finder/screens/quran_screen/widgets/tabbar_quran_screen.dart';
import 'package:qibla_finder/theme/custom_themes/text_theme.dart';

class SurahScreen extends StatelessWidget {
  const SurahScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final arg = ModalRoute.of(context)!.settings.arguments as Map;
    
    final providerAPI = Provider.of<APIProvider>(context);
    final surahs = Provider.of<APIProvider>(context).surahsListModel.data;
    final surahEnglish = Provider.of<APIProvider>(context).surahEnglishModel.data.ayahs;
    final surahArabic = Provider.of<APIProvider>(context).surahArabicModel.data.ayahs;
    providerAPI.getSurahsFromAPI();
    providerAPI.getSurahEnglishFromAPI(arg['index']+1);
    providerAPI.getSurahArabicFromAPI(arg['index']+1);
    
    return Scaffold(
      // extendBodyBehindAppBar: true,
      backgroundColor: XColors.primary,
      appBar: XAppBar(appBarTitle: surahs[arg['index']].englishName),
      body: DefaultTabController(
        length: 3,
        child: Container(
          padding: EdgeInsets.only(left: XSizes.md, right: XSizes.md),
          width: XSizes.screenWidth(context),
          decoration: const BoxDecoration(
            gradient: XColors.bgGradient
          ),
          child: SingleChildScrollView(
            physics: ScrollPhysics(),
            child: Column(
              children: [
            
        // --- Title 
                Container(
                  height: 250,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: XColors.primary,
                    borderRadius: BorderRadius.circular(XSizes.cardRadiusSm)
                  ),
                  child: Stack(
                    children: [
                      Positioned(
                        // right: 0,
                        child: Opacity(
                          opacity: 0.05,
                          child: SvgPicture.asset(XImages.mosque, height: 250, ))
                        ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            surahs[arg['index']].name, 
                            style: XTextTheme.appTextTheme.titleLarge,
                          ),
                          const SizedBox(height: XSizes.sm),
                          Text(
                            surahs[arg['index']].englishNameTranslation,
                            style: XTextTheme.appTextTheme.labelLarge,
                          ),
                          const SizedBox(height: XSizes.sm),
                          const Divider(indent: XSizes.lg, endIndent: XSizes.lg,),
                          const SizedBox(height: XSizes.sm),
                          Text(
                            '${surahs[arg['index']].revelationType.name} - ${surahs[arg['index']].numberOfAyahs.toString()} Ayahs',
                            style: XTextTheme.appTextTheme.labelLarge,
                          ),
                          const SizedBox(height: XSizes.spaceBtwSections),
                          SvgPicture.asset(
                            XImages.bismillah, 
                            colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcIn),
                            height: 50,
                            )
                        ],
                      ),
                    
                    ],
                  ),
                ),
                const SizedBox(height: XSizes.spaceBtwSections),
            
        // --- Body
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: surahEnglish.length,
                  itemBuilder:(context, index) => Column(
                    children: [
            // -- Ayah Number & Actions
                      Container(
                        decoration: BoxDecoration(
                          color: XColors.secondary,
                          borderRadius: BorderRadius.circular(XSizes.cardRadiusSm)
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: XSizes.sm),
                              child: CircleAvatar(
                                maxRadius: XSizes.md,
                                backgroundColor: XColors.primary,
                                foregroundColor: XColors.secondary,
                                child: Text(surahArabic[index].numberInSurah.toString()),
                                ),
                            ),
                            Row(
                              children: [
                                IconButton(onPressed: (){}, icon: Icon(Iconsax.play)),
                                IconButton(onPressed: (){}, icon: Icon(Icons.bookmark)),
                              ],
                            )
                          ],
                        ),
                      ),
                      const SizedBox(height: XSizes.spaceBtwSections),
              // -- Arabic Text
                      Container(
                        alignment: Alignment.centerRight,
                        child: Text(
                          surahArabic[index].text, 
                          style: XTextTheme.appTextTheme.headlineMedium,
                          textAlign: TextAlign.right,
                          ),
                      ),
              // -- English Text
                      Container(
                        alignment: Alignment.centerLeft,
                        child: Text(surahEnglish[index].text)
                        ),
                      const SizedBox(height: XSizes.spaceBtwSections),
                      ],
                  ),
                  )
            
                
              ],
            ),
          ),
        ),
      ),
    );
  }
}





