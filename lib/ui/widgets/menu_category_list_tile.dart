import 'package:flutter/material.dart';
import 'package:tutorbin/ui/widgets/text.dart';

class MenuCategoryListTile extends StatelessWidget {
  const MenuCategoryListTile(
      {Key? key,
      required this.isAnimating,
      required this.isExpanded,
      required this.toggleExpansion,
      required this.expandedChild,
      required this.tileTitle,
      required this.itemCount})
      : super(key: key);
  final bool isAnimating;
  final bool isExpanded;
  final void Function() toggleExpansion;
  final Widget expandedChild;
  final String tileTitle;
  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: toggleExpansion,
          child: Container(
            // height: 35,
            // margin: const EdgeInsets.symmetric(vertical: 15),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 15),
            decoration: BoxDecoration(
                border: Border(
                    bottom: BorderSide(
              width: 1,
              color: Colors.grey.withOpacity(.2),
            ))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: text(
                    text: tileTitle,
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                    fontSize: 13,
                  ),
                ),
                SizedBox(
                  child: Row(
                    children: [
                      text(
                        text: isExpanded ? 'Show less' : itemCount.toString(),
                        color: Colors.grey,
                        fontSize: 10,
                        fontWeight: FontWeight.w500,
                      ),
                      isExpanded
                          ? const Icon(
                              Icons.keyboard_arrow_down,
                              color: Colors.grey,
                            )
                          : const Icon(
                              Icons.keyboard_arrow_right,
                              color: Colors.grey,
                            ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        expandedChild
      ],
    );
  }
}
