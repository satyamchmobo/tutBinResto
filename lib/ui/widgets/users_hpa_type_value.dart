import 'package:flutter/material.dart';


class UsersHpaTypeValueCard extends StatelessWidget {
  const UsersHpaTypeValueCard({
    Key? key,
    this.handicapType,
    this.handicapValue,
    this.onTap,
  }) : super(key: key);
  final String? handicapType;
  final String? handicapValue;

  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: Container(
        // height: 73.h(),
        // width: 103.w(),
        padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 9),

        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.79),
          border: Border.all(color: const Color(0xFFD9DBE9)),
        ),
        child: InkWell(
          borderRadius: BorderRadius.circular(5),
          onTap: null,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                handicapType ?? 'NA',
           
                overflow: TextOverflow.ellipsis,
              ),
              Text(
                handicapValue ?? 'NA',
                // club.name,
                // style: sizeConfig.style.textInputStyle.copyWith(
                //   fontSize: 15.57.w(),
                //   fontWeight: FontWeight.w400,
                // ),
                overflow: TextOverflow.ellipsis,
              )
            ],
          ),
        ),
      ),
    );
  }
}
