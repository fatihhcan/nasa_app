import 'package:flutter/material.dart';
import 'package:nasa_app/core/extensions/context_extension.dart';

class CustomCard extends StatelessWidget {
  final String? imageSrc;
  const CustomCard({Key? key, this.imageSrc}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Image.network(imageSrc!),
      decoration: BoxDecoration(
          color: context.customColors!.hawkesBlue,
          borderRadius: context.bordernormalRadius),
    );
  }
}
