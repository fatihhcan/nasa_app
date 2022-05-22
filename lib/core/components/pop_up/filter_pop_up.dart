import 'package:flutter/material.dart';
import 'package:nasa_app/core/extensions/context_extension.dart';


Future<bool?> filterPopUp(BuildContext context,Widget child)
{
   return  showDialog(
                      context: context,
                      builder: (_) => AlertDialog(
                            contentPadding: EdgeInsets.zero,
                            content: Container(
                              height: context.height * 0.5,
                              width: context.width,
                              color: context.customColors!.moodyBlue,
                              child: Padding(
                                padding: context.paddingMediumHorizontal,
                                child: child,
                              ),
                            ),
                          ));
}