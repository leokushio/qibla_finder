import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';
import 'package:qibla_finder/constants/colors.dart';
import 'package:qibla_finder/constants/sizes.dart';
import 'package:qibla_finder/models/surah_audio_model.dart' as a;
import 'package:qibla_finder/models/surah_model.dart';
import 'package:qibla_finder/providers/audio_provider.dart';
import 'package:qibla_finder/theme/custom_themes/text_theme.dart';

class AyahsCard extends StatefulWidget {
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
  State<AyahsCard> createState() => _AyahsCardState();
}

class _AyahsCardState extends State<AyahsCard> {
  final player = AudioPlayer();

  @override
  Widget build(BuildContext context) {
    final audioProvider = Provider.of<AudioProvider>(context);
    // final player = AudioPlayer();

    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: widget.surahEnglish.length,
      itemBuilder: (context, index) => Column(
        children: [
          // -- Ayah Number & Actions
          Container(
            decoration: BoxDecoration(
                color: XColors.secondary,
                borderRadius: BorderRadius.circular(XSizes.cardRadiusSm)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: XSizes.sm),
                  child: CircleAvatar(
                    maxRadius: XSizes.md,
                    backgroundColor: XColors.primary,
                    foregroundColor: XColors.secondary,
                    child: Text(
                        widget.surahArabic[index].numberInSurah.toString()),
                  ),
                ),
                Row(
                  children: [
                    IconButton(
                        onPressed: () async {
                          if (audioProvider.currentIndex == index) {
                            if (!audioProvider.xPlay) {
                              audioProvider.setPlay(index);
                              await audioProvider.player.resume();
                              print(audioProvider.player.playerId);
                            } else {
                              audioProvider.setPause();
                              await audioProvider.player.pause();
                              print(audioProvider.player.playerId);
                            }
                          } else {
                            audioProvider.setPlay(index);
                            await audioProvider.player.play(
                                UrlSource(widget.surahAudio[index].audio));
                            print(audioProvider.player.playerId);
                          }
                        },
                        icon: audioProvider.currentIndex == index
                            ? !audioProvider.xPlay
                                ? const Icon(Iconsax.play)
                                : const Icon(Iconsax.pause)
                            : const Icon(Iconsax.play)),
                    IconButton(
                      onPressed: () async {
                        if (audioProvider.currentIndex == index) {
                          audioProvider.setStop();
                          await audioProvider.player.stop();
                        }
                      },
                      icon: const Icon(Iconsax.stop),
                    ),
                    // IconButton(onPressed: (){}, icon: const Icon(Icons.bookmark)),
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
              widget.surahArabic[index].text,
              style: XTextTheme.appTextTheme.headlineMedium,
              textAlign: TextAlign.right,
            ),
          ),
          // -- English Text
          Container(
              padding: const EdgeInsets.only(left: XSizes.md),
              alignment: Alignment.centerLeft,
              child: Text(widget.surahEnglish[index].text)),
          const SizedBox(height: XSizes.spaceBtwSections),
        ],
      ),
    );
  }
}
