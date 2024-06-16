import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';
import 'package:qibla_finder/common_widgets/app_bar.dart';
import 'package:qibla_finder/constants/colors.dart';
import 'package:qibla_finder/constants/image_strings.dart';
import 'package:qibla_finder/constants/sizes.dart';
import 'package:qibla_finder/models/surah_list_model.dart';
import 'package:qibla_finder/models/surah_model.dart';
import 'package:qibla_finder/providers/api_provider.dart';
import 'package:qibla_finder/providers/audio_provider.dart';
import 'package:qibla_finder/theme/custom_themes/text_theme.dart';
import 'package:qibla_finder/models/surah_audio_model.dart' as a;

class SurahScreen extends StatelessWidget {
  const SurahScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final arg = ModalRoute.of(context)!.settings.arguments as Map;
    
    final providerAPI = Provider.of<APIProvider>(context);
    final surahs = Provider.of<APIProvider>(context).surahsListModel.data;
    final surahEnglish = Provider.of<APIProvider>(context).surahEnglishModel.data.ayahs;
    final surahArabic = Provider.of<APIProvider>(context).surahArabicModel.data.ayahs;
    final surahAudio = Provider.of<APIProvider>(context).surahAudioModel.data.ayahs;
    // final audioProvider = Provider.of<AudioProvider>(context);
    providerAPI.getSurahsFromAPI();
    providerAPI.getSurahEnglishFromAPI(arg['index']+1);
    providerAPI.getSurahArabicFromAPI(arg['index']+1);
    providerAPI.getSurahAudioFromAPI(arg['index']+1);
    
    return Scaffold(
      // extendBodyBehindAppBar: true,
      backgroundColor: XColors.primary,
      appBar: XAppBar(appBarTitle: surahs[arg['index']].englishName),
      body: DefaultTabController(
        length: 3,
        child: Container(
          padding: const EdgeInsets.only(left: XSizes.md, right: XSizes.md),
          width: XSizes.screenWidth(context),
          decoration: const BoxDecoration(
            gradient: XColors.bgGradient
          ),
          child: SingleChildScrollView(
            physics: const ScrollPhysics(),
            child: Column(
              children: [
            
        // --- Title 
                SurahScreenHeader(surahs: surahs, arg: arg),
                const SizedBox(height: XSizes.spaceBtwSections),
            
        // --- Body
                AyahsCard(surahEnglish: surahEnglish, surahArabic: surahArabic, surahAudio: surahAudio,)
            
                
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class AyahsCard extends StatelessWidget {
  const AyahsCard({
    super.key,
    required this.surahEnglish,
    required this.surahArabic,
    required this.surahAudio,
  });

  final List<Ayah> surahEnglish;
  final List<Ayah> surahArabic;
  final List<a.Ayah> surahAudio;

  @override
  Widget build(BuildContext context) {
    final audioProvider = Provider.of<AudioProvider>(context);

    return ListView.builder(
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
                    IconButton(
                      onPressed: () => audioProvider.currentIndex == index
                        ? !audioProvider.xPlay 
                          ? audioProvider.setPlay(index)
                          : audioProvider.setPause()
                        : audioProvider.setPlay(index),
                      icon: audioProvider.currentIndex == index 
                        ? !audioProvider.xPlay 
                          ? const Icon(Iconsax.play) 
                          : const Icon(Iconsax.pause)
                        : const Icon(Iconsax.play)
                      ),

                    IconButton(onPressed: (){}, icon: const Icon(Icons.bookmark)),
                  ],
                )
              ],
            ),
          ),
          const SizedBox(height: XSizes.spaceBtwSections),
                  // -- Arabic Text
          Container(
            padding: const EdgeInsets.only(right: XSizes.md),
            alignment: Alignment.centerRight,
            child: Text(
              surahArabic[index].text, 
              style: XTextTheme.appTextTheme.headlineMedium,
              textAlign: TextAlign.right,
              ),
          ),
                  // -- English Text
          Container(
            padding: const EdgeInsets.only(left: XSizes.md),
            alignment: Alignment.centerLeft,
            child: Text(surahEnglish[index].text)
            ),
          const SizedBox(height: XSizes.spaceBtwSections),
          ],
      ),
      );
  }
}

class SurahScreenHeader extends StatelessWidget {
  const SurahScreenHeader({
    super.key,
    required this.surahs,
    required this.arg,
  });

  final List<Datum> surahs;
  final Map arg;

  @override
  Widget build(BuildContext context) {
    return Container(
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
                colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
                height: 50,
                )
            ],
          ),
        
        ],
      ),
    );
  }
}





