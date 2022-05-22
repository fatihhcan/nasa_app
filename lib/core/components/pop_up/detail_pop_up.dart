import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nasa_app/core/extensions/context_extension.dart';

import '../../constants/text_constant.dart';

Future<bool?> detailPopUp(
    BuildContext context,
    String imageSrc,
    String roverName,
    String cameraName,
    String taskStatus,
    String landingDate,
    String launchDate,
    String dateOfPhotographing) async {
  return showDialog(
      context: context,
      builder: (_) => AlertDialog(
            contentPadding: EdgeInsets.zero,
            content: Container(
              height: context.height * 0.5,
              width: context.width,
              color: context.customColors!.moodyBlue,
              child: Padding(
                padding: context.paddingMediumHorizontal,
                child: Column(
                  children: [
                    context.sizedBoxLowVertical,
                    buildPhoto(imageSrc),
                    context.sizedBoxMediumVertical,
                    buildRoverName(roverName),
                    buildCameraName(cameraName),
                    buildTaskStatus(taskStatus),
                    buildLandingDate(landingDate),
                    buildLaunchDate(launchDate),
                    buildDateOfPhotographing(dateOfPhotographing),
                    context.sizedBoxMediumVertical,
                    buildOkButton(context)
                  ],
                ),
              ),
            ),
          ));
}

ElevatedButton buildOkButton(BuildContext context) {
  return ElevatedButton(
      style: ButtonStyle(
        backgroundColor:
            MaterialStateProperty.all(context.customColors!.jacksonsPurple),
      ),
      onPressed: () {
        Navigator.pop(context);
      },
      child: Text(
        TextConstants.okButton,
        style: context.textTheme.bodyText2,
      ));
}

Row buildDateOfPhotographing(String dateOfPhotographing) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      Text(TextConstants.dateOfPhotographing),
      Text(dateOfPhotographing),
    ],
  );
}

Row buildLaunchDate(String launchDate) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      Text(TextConstants.launchDate),
      Text(launchDate),
    ],
  );
}

Row buildLandingDate(String landingDate) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      Text(TextConstants.landingDate),
      Text(landingDate),
    ],
  );
}

Row buildTaskStatus(String taskStatus) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      Text(TextConstants.taskStatus),
      Text(taskStatus),
    ],
  );
}

Row buildCameraName(String cameraName) {
  return Row(
   mainAxisSize: MainAxisSize.max,
    children: [
      Text(TextConstants.cameraName),
       Flexible(child: Text(cameraName, overflow: TextOverflow.ellipsis,))],
  );
}

Row buildRoverName(String roverName) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      Text(TextConstants.roverName),
      Text(roverName),
    ],
  );
}

SizedBox buildPhoto(String imageSrc) {
  return SizedBox(height: 200.h, width: 200.w, child: Image.network(imageSrc));
}
