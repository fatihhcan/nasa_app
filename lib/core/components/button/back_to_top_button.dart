import 'package:flutter/material.dart';
import 'package:nasa_app/core/extensions/context_extension.dart';

import '../../constants/text_constant.dart';

class BackToTopButton extends StatelessWidget {
  final ScrollController scrollController;
  final bool backtoTop;
  const BackToTopButton({Key? key, required this.scrollController, this.backtoTop =false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return buildBackToTop(scrollController, backtoTop, context);
  }

  Widget buildBackToTop(ScrollController scrollController, bool backtoTop,
          BuildContext context) =>
      backtoTop
          ? Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: context.paddingLowAll,
                child: FloatingActionButton.extended(
                  onPressed: () {
                    scrollController.animateTo(0,
                        duration: Duration(seconds: 1), curve: Curves.linear);
                  },
                  label: Text(
                    TextConstants.backToTop,
                    style: context.textTheme.bodyText2,
                  ),
                ),
              ),
            )
          : SizedBox();
}
