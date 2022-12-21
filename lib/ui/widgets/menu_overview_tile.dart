import 'package:flutter/material.dart';
import 'package:tutorbin/business_logic/models/item_details_model.dart';
import 'package:tutorbin/business_logic/view_models/menu_page_view_model.dart';
import 'package:tutorbin/ui/widgets/add_counter_button.dart';
import 'package:tutorbin/ui/widgets/best_seller_chip.dart';
import 'package:tutorbin/ui/widgets/expansion_widget/src/widget.dart';
import 'package:tutorbin/ui/widgets/menu_category_list_tile.dart';

import 'package:tutorbin/ui/widgets/text.dart';

class MenuOverviewTile extends StatelessWidget {
  MenuOverviewTile(
      {Key? key,
      required this.catData,
      this.catListIndex,
      this.popularItemIndexesMaps,
      required this.state})
      : super(key: key);
  // final ClubStaffInformation? staffInformation;
  // final List<Map<String, String>>? itemList;
  MenuPageViewModel state;
  int? catListIndex;
  List<Map<String, int>>? popularItemIndexesMaps;
  Map<String, List<ItemDetails?>> catData;

  @override
  Widget build(BuildContext context) {
    return CustomExpansionWidget(
      expandedChild:
          // staffInformation == null ||
          //         staffInformation!.result == null ||
          //         staffInformation!.result!.isEmpty
          catData.values.first.isEmpty
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
                  height: catData.values.first.length * 73,
                  child: Column(
                    children:
                        List.generate(catData.values.first.length, (index) {
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
                                  text:
                                      catData.values.first[index]?.name ?? ' ',
                                  color: Colors.black,
                                  fontSize: 12.5,
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                if (catData.keys.first == 'Popular items' &&
                                    index == 0)
                                  const BestSeller(),
                              ],
                            ),
                          ),
                          subtitle: text(
                            text:
                                '\$ ${catData.values.first[index]?.price.toString() ?? '0'}',
                            color: Colors.grey.withOpacity(1),
                            fontWeight: FontWeight.w500,
                            fontSize: 11,
                          ),
                          trailing: AddCounterButton(
                              state: state,
                              isPopular: catData.keys.first == 'Popular items'
                                  ? true
                                  : false,
                              catListIndex: catListIndex!
                              // popularItemIndexesMaps
                              // catListIndex??0,
                              ,
                              itemListIndex: index),
                        ),
                      );
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
          tileTitle: catData.keys.first,
          itemCount: catData.values.first.length,
        );
      },
    );
  }
}
