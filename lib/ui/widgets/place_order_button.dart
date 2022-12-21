import 'package:flutter/material.dart';
import 'package:tutorbin/business_logic/view_models/menu_page_view_model.dart';
import 'package:tutorbin/ui/widgets/snackbar.dart';
import 'package:tutorbin/ui/widgets/text.dart';
import 'package:tutorbin/utils/constants/app_colors.dart';
import 'package:tutorbin/utils/constants/app_text.dart';

class PlaceOrderButton extends StatelessWidget {
  PlaceOrderButton({Key? key, required this.state}) : super(key: key);
  MenuPageViewModel state;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 4.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.0),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              offset: const Offset(0.0, 1.0), //(x,y)
              blurRadius: 10,
              spreadRadius: 2),
        ],
      ),
      child: Container(
          width: MediaQuery.of(context).size.width,
          height: 55,
          margin:
              const EdgeInsets.only(top: 20, bottom: 20, left: 25, right: 25),
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: const Color(0xFF6C809A).withOpacity(.25),
                offset: const Offset(0, 15),
                blurRadius: 15,
                spreadRadius: 10,
              )
            ],
            borderRadius: BorderRadius.circular(8),
            color: AppColors.primaryOrange,
          ),
          child: TextButton(
              style: ButtonStyle(
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  text(
                    text: placeOrder,
                    color: AppColors.primaryWhite,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                  text(
                    text: '\$${state.total}',
                    color: AppColors.primaryWhite,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  )
                ],
              ),
              // onPressed: () => eventDetailController.purchaseTicket(
              //   context,
              //   amount: eventDetailController.eventDetails.price.toString(),
              //   eventId: eventDetailController.eventDetails.id,
              // ),

              // ignore: avoid_returning_null_for_void
              onPressed: () {
                if (state.total != 0) {
                  state.placeOrder(context);
                } else {
                  showSnackBar(context, 'Add atleast 1 item to go ahead !',
                      duration: const Duration(seconds: 3));
                }
              })),
    );
  }
}
