import 'package:tutorbin/business_logic/view_models/menu_page_view_model.dart';
import 'package:tutorbin/ui/base_view.dart';
import 'package:tutorbin/ui/widgets/menu_overview_tile.dart';
import 'package:tutorbin/ui/widgets/place_order_button.dart';
import 'package:flutter/material.dart';
import 'package:tutorbin/ui/widgets/popular_menu_overview_tile.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  @override
  Widget build(BuildContext context) {
    return BaseView<MenuPageViewModel>(
        onModelReady: (model, _) => model.init(),
        builder: (context, state) {
          return Scaffold(
            // appBar: AppBar(
            //   title: Text(widget.title),
            // ),
            body: SafeArea(
                child: state.isBusy
                    ? const Center(child: CircularProgressIndicator())
                    : Center(
                        child: ListView(
                          children: <Widget>[
                  
                            if (state.popularItems.isNotEmpty)
                              PopularMenuOverview(
                                popularItems: state.popularItems,
                        
                                state: state,
                              ),
                            ...List.generate(
                                state.listOfItemCategoryMaps.length, (index) {
                              return MenuOverviewTile(
                                catData: state.listOfItemCategoryMaps[index],
                                state: state,
                                catListIndex: index,
                              );
                            })
                          ],
                        ),
                      )),

            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerFloat,
            floatingActionButton: PlaceOrderButton(
                state:
                    state), // This trailing comma makes auto-formatting nicer for build methods.
          );
        });
  }
}
