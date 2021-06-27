import 'package:flutter/material.dart';
import 'package:vidya_admin/constants/colors.dart';

import 'info_cards.dart';
class OverviewCardsMediumScreenSize extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          children: [
            InfoCard(
              title: "Premium Members",
              value : "7",
              onTap: (){},
              topColor: Colors.orange,
            ),
            SizedBox(width: _width/64,),
            InfoCard(
              title: "Active Members",
              value : "7",
              onTap: (){},
              topColor: Colors.lightGreen,
            ),


          ],
        ),
        SizedBox(height: 16,),
        Row(
          children: [
            InfoCard(
              title: "Total Published",
              value : "17",
              onTap: (){},
              topColor: active,
            ),
            SizedBox(width: _width/64,),
            InfoCard(
              title: "Unpublished",
              value : "17",
              onTap: (){},
              topColor: Colors.redAccent,
            ),
          ],
        )

      ],
    );

  }
}
