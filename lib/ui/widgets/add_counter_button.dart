import 'package:flutter/material.dart';
import 'package:tutorbin/business_logic/view_models/menu_page_view_model.dart';
import 'package:tutorbin/ui/widgets/snackbar.dart';
import 'package:tutorbin/ui/widgets/text.dart';
import 'package:tutorbin/utils/constants/app_colors.dart';

class AddCounterButton extends StatelessWidget {
  AddCounterButton(
      {Key? key,
      required this.state,
      required this.catListIndex,
      required this.itemListIndex,
      this.isPopular})
      : super(key: key);
  MenuPageViewModel state;
  int catListIndex;
  int itemListIndex;
  bool? isPopular;
  @override
  Widget build(BuildContext context) {
    return state.listOfItemCategoryMaps[catListIndex].values
                .first[itemListIndex].orderedCount ==
            0
        ? InkWell(
            onTap: () {
              debugPrint('here');
              debugPrint('$catListIndex - $itemListIndex');
              if (state.listOfItemCategoryMaps[catListIndex].values
                      .first[itemListIndex].instock ==
                  true) {
                state.incrementCountOfItem(catListIndex, itemListIndex);
              } else {
                showSnackBar(context, 'Out of stock!',
                    duration: const Duration(seconds: 3));
              }
            },
            child: Container(
              height: 30,
              width: 80,
              decoration: BoxDecoration(
                  border: Border.all(
                    color: state.listOfItemCategoryMaps[catListIndex].values
                                .first[itemListIndex].instock ==
                            true
                        ? AppColors.primaryOrange
                        : Colors.grey,
                    width: 1,
                  ),
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(48)),
              child: Center(
                child: text(
                    color: state.listOfItemCategoryMaps[catListIndex].values
                                .first[itemListIndex].instock ==
                            true
                        ? AppColors.primaryOrange
                        : Colors.grey,
                    text: 'Add',
                    fontSize: 12,
                    fontWeight: FontWeight.bold),
              ),
            ),
          )
        : Container(
            height: 30,
            width: 80,
            decoration: BoxDecoration(
                border: Border.all(
                  color: AppColors.primaryOrange,
                  width: 1,
                ),
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(48)),
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InkWell(
                      onTap: () {
                        debugPrint('here');
                        debugPrint('$catListIndex - $itemListIndex');

                        state.decrementCountOfItem(catListIndex, itemListIndex);
                      },
                      child: const Icon(Icons.remove,
                          color: AppColors.primaryOrange, size: 20)),
                  Container(
     
                    padding: const EdgeInsets.symmetric(
                      vertical: 7,
                      horizontal: 7,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: AppColors.primaryOrange,
                    ),
                    child: text(
                        color: AppColors.primaryWhite,
                        text: state.listOfItemCategoryMaps[catListIndex].values
                            .first[itemListIndex].orderedCount
                            .toString(),
                        fontSize: 13,
                        fontWeight: FontWeight.bold),
                  ),
                  InkWell(
                      onTap: () {
                        debugPrint('here');
                        debugPrint('$catListIndex - $itemListIndex');

                        state.incrementCountOfItem(catListIndex, itemListIndex);
                      },
                      child: const Icon(
                        Icons.add,
                        color: AppColors.primaryOrange,
                        size: 20,
                      )),
                ],
              ),
            ),
          );
  }
}
