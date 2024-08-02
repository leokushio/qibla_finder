import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qibla_finder/constants/colors.dart';
import 'package:qibla_finder/constants/sizes.dart';
import 'package:qibla_finder/models/surah_list_model.dart';
import 'package:qibla_finder/providers/api_provider.dart';
import 'package:qibla_finder/providers/audio_provider.dart';
import 'package:qibla_finder/theme/custom_themes/text_theme.dart';

class SurahTab extends StatelessWidget {
  const SurahTab({
    super.key,
    required this.surahs,
  });

  final List<Datum> surahs;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity, 
      child: ListView.builder(
        padding: const EdgeInsets.only(top: XSizes.sm),
        itemCount: surahs.length,
        itemBuilder: (context, index) => 
          Material(
            color: Colors.transparent,
            child: Padding(
              padding: const EdgeInsets.only(bottom: XSizes.md),
              child: ListTile(
                leading: Text(surahs[index].number.toString(), style: XTextTheme.appTextTheme.titleMedium,),
                tileColor: XColors.primary,
                title: Text(surahs[index].englishName, style: XTextTheme.appTextTheme.titleMedium,),
                subtitle: Text('${surahs[index].revelationType.name} . ${surahs[index].numberOfAyahs} Verses',style: XTextTheme.appTextTheme.labelMedium,),
                trailing: Text(surahs[index].name, style: XTextTheme.appTextTheme.titleMedium?.copyWith(color: XColors.secondary),),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(XSizes.cardRadiusMd)),
                onTap: () {
                  // context.read<APIProvider>().getSurahsFromAPI();
                  // context.read<APIProvider>().getSurahEnglishFromAPI(index);
                  // context.read<APIProvider>().getSurahArabicFromAPI(index);
                  // context.read<APIProvider>().getSurahAudioFromAPI(index);
                  Navigator.pushNamed(
                    context, 
                    '/surah_screen',
                    arguments: {'index': index}
                  );
                } 
                ),
            ),
          )
        ),
      );
  }
}