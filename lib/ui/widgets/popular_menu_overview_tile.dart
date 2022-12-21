import 'package:flutter/material.dart';
import 'package:tutorbin/business_logic/view_models/menu_page_view_model.dart';
import 'package:tutorbin/ui/widgets/add_counter_button.dart';
import 'package:tutorbin/ui/widgets/best_seller_chip.dart';
import 'package:tutorbin/ui/widgets/expansion_widget/src/widget.dart';
import 'package:tutorbin/ui/widgets/menu_category_list_tile.dart';

import 'package:tutorbin/ui/widgets/text.dart';

class PopularMenuOverview extends StatelessWidget {
  PopularMenuOverview(
      {Key? key,
      required this.popularItems,
      this.catListIndex,

      required this.state})
      : super(key: key);

  MenuPageViewModel state;
  int? catListIndex;


  List<ItemDetailsWithIndexes?> popularItems;

  @override
  Widget build(BuildContext context) {
    return CustomExpansionWidget(
      expandedChild: popularItems.isEmpty
          ? Container(
              width: 364,
              padding: const EdgeInsets.symmetric(
                vertical: 55,
                horizontal: 25,
              ),
              alignment: Alignment.center,
              child: text(
                text: 'No item available',
                color: Colors.black,
                fontSize: 10,
              ),
            )
          : Container(
              color: Colors.grey.withOpacity(.1),
              height: popularItems.length * 73,
              child: Column(
                children: List.generate(popularItems.length, (index) {
                  return Container(
                      decoration: BoxDecoration(
                          border: Border(
                              bottom: BorderSide(
                        width: 1,
                        color: Colors.grey.withOpacity(.2),
                      ))),
                      child: ListTile(
                        title: SizedBox(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              text(
                                text: popularItems[index]?.name ?? ' ',
                                color: Colors.black,
                                fontSize: 12.5,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              if (index == 0) const BestSeller(),
                            ],
                          ),
                        ),
                        subtitle: text(
                          text:
                              '\$ ${popularItems[index]?.price.toString() ?? '0'}',
                          color: Colors.grey.withOpacity(1),
                          fontWeight: FontWeight.w500,
                          fontSize: 11,
                        ),
                        trailing: AddCounterButton(
                          state: state,
                          catListIndex: popularItems[index]?.catListIndex ?? 0,
                          itemListIndex:
                              popularItems[index]?.itemListIndex ?? 0,
                        ),
                      ));
                }),
              ),
            ),
      builder:
          (context, expandedChild, toggleExpansion, isAnimating, isExpanded) {
        return MenuCategoryListTile(
          isAnimating: isAnimating,
          isExpanded: isExpanded,
          toggleExpansion: toggleExpansion,
          expandedChild: expandedChild,
          tileTitle: 'Popular Items',
          itemCount: popularItems.length,
        );
      },
    );
  }
}
