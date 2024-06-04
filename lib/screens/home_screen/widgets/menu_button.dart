import 'package:flutter/material.dart';
import 'package:qibla_finder/constants/colors.dart';
import 'package:qibla_finder/constants/sizes.dart';

class XMenuButton extends StatelessWidget {
  const XMenuButton({
    super.key,
    required this.onTap,
    required this.icon,
    required this.title,
  });

  final void Function()? onTap;
  final IconData icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap, 
      style: ButtonStyle(
        shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(XSizes.buttonRadius))),
        padding: const MaterialStatePropertyAll(EdgeInsets.all(XSizes.buttonHeight),),
        foregroundColor: const MaterialStatePropertyAll(XColors.primary)
      ),
      child: Row(
        children: [
          Icon(icon),
          const SizedBox(width: XSizes.spaceBtwItems,),
          Text(title)
        ],
      )
      );
  }
}