import 'package:flutter/material.dart';

import '../../config/fonts.dart';
import '../../config/images.dart';

class CharactersErrorWidget extends StatelessWidget {
  final String title;
  final String content;
  final String actionTitle;
  final bool withAction;
  final VoidCallback? onRetry;

  const CharactersErrorWidget({
    Key? key,
    required this.title,
    required this.content,
    required this.actionTitle,
    this.onRetry,
    this.withAction = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Padding(
      padding: const EdgeInsets.only(left: 80, right: 80),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image(image: AppImages.deadpool, width: 120),
          SizedBox(
            height: 10,
          ),
          Text(
            title,
            style: boldStyle.copyWith(color: Colors.black54),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            content,
            style: regularStyle.copyWith(color: Colors.black45, fontSize: 16),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 15,
          ),
          withAction
              ? ElevatedButton(
                  onPressed: () {
                    onRetry?.call();
                  },
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(20, 12, 20, 12),
                    child: Text(actionTitle.toUpperCase(),
                        style: mediumStyle.copyWith(color: Colors.white)),
                  ),
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.black),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                    ),
                  ),
                )
              : SizedBox()
        ],
      ),
    ));
  }
}
