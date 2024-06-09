import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';
import 'package:qibla_finder/common_widgets/app_bar.dart';
import 'package:qibla_finder/constants/colors.dart';
import 'package:qibla_finder/constants/image_strings.dart';
import 'package:qibla_finder/constants/sizes.dart';
import 'package:qibla_finder/providers/api_provider.dart';
import 'package:qibla_finder/theme/custom_themes/text_theme.dart';

class QuranScreen extends StatelessWidget {
  const QuranScreen({super.key});

  @override
  Widget build(BuildContext context) {
    
    final providerAPI = Provider.of<APIProvider>(context);
    final surahs = Provider.of<APIProvider>(context).surahsModel.data;
    providerAPI.getSurahsFromAPI();
    
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: XColors.primary,
      appBar: const XAppBar(appBarTitle: 'The Holy Quran'),
      body: DefaultTabController(
        length: 3,
        child: Container(
          decoration: const BoxDecoration(
          gradient: XColors.bgGradient
        ),
          child: Column(
            children: [
  // --- Mosque Image --- Header
              Container(
                height: XSizes.appBarHeight * 2,
                child: Stack(
                  children: [       
      
                    Positioned(
                      top: -80,
                      right: -10,
                      child: Opacity(
                        opacity: 0.2,
                        child: SvgPicture.asset(XImages.mosque, height: 200, ))
                      ),
                  ],
                ),
              ),
          
  // --- Body Widget

      // --- TabBar
              Padding(
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
              ),

              Expanded(
                child: TabBarView(children: [
                  Container(
                    // color: XColors.secondary,
                    width: double.infinity, 
                    child: ListView.builder(
                      padding: const EdgeInsets.only(top: XSizes.defaultSpace, left: XSizes.sm, right: XSizes.sm),
                      itemCount: surahs.length,
                      itemBuilder: (context, index) => 
                        Material(
                          color: Colors.transparent,
                          child: Padding(
                            padding: const EdgeInsets.all(XSizes.sm),
                            child: ListTile(
                              leading: Text(surahs[index].number.toString(), style: XTextTheme.appTextTheme.titleMedium,),
                              tileColor: XColors.primary,
                              title: Text(surahs[index].englishName, style: XTextTheme.appTextTheme.titleMedium,),
                              subtitle: Text('${surahs[index].revelationType.name} . ${surahs[index].numberOfAyahs} Verses',style: XTextTheme.appTextTheme.labelMedium,),
                              trailing: Text(surahs[index].name, style: XTextTheme.appTextTheme.titleMedium?.copyWith(color: XColors.secondary),),
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(XSizes.cardRadiusMd)),
                              ),
                          ),
                        )
                      ),
                    ),

                  Container(width: double.infinity,color: XColors.secondary, child: Text('data'),),
                  Container(width: double.infinity, child: Text('data'),),
                
                ]),
              )
            ],
          ),
        ),
      ),
    );
  }
}