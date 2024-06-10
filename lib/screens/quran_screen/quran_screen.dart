import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qibla_finder/common_widgets/app_bar.dart';
import 'package:qibla_finder/common_widgets/header_image.dart';
import 'package:qibla_finder/constants/colors.dart';
import 'package:qibla_finder/constants/sizes.dart';
import 'package:qibla_finder/providers/api_provider.dart';
import 'package:qibla_finder/screens/quran_screen/tabs/surah_tab.dart';
import 'package:qibla_finder/screens/quran_screen/widgets/tabbar_quran_screen.dart';
import 'package:qibla_finder/theme/custom_themes/text_theme.dart';

class QuranScreen extends StatelessWidget {
  const QuranScreen({super.key});

  @override
  Widget build(BuildContext context) {
    
    final providerAPI = Provider.of<APIProvider>(context);
    final surahs = Provider.of<APIProvider>(context).surahsListModel.data;
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
              const HeaderImage(),
      // --- TabBar
              const TabBarQuranScreen(),
      // --- TabBar View
              Expanded(
                child: TabBarView(children: [
                  SurahTab(surahs: surahs),

                  Container(
                    width: double.infinity,
                    child: GridView.builder(
                      
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 2
                        ),
                      padding: const EdgeInsets.only(top: XSizes.defaultSpace, left: XSizes.sm, right: XSizes.sm),
                      itemCount: 30,
                      itemBuilder: ((context, index) => 
                        Material(
                          color: Colors.transparent,
                          child: Padding(
                            padding: const EdgeInsets.all(XSizes.sm),
                            child: ListTile(
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(XSizes.cardRadiusMd)),
                              tileColor: XColors.primary,
                              title: Text('JUZ ${(index+1).toString()}', style: XTextTheme.appTextTheme.titleMedium,),
                            ),
                          ),
                        )
                      )
                      ),
                  ),

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





