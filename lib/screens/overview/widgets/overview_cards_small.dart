import 'package:flutter/material.dart';
import 'package:vidya_admin/constants/colors.dart';
import 'package:vidya_admin/screens/overview/widgets/info_card_small.dart';
class OverviewCardsSmallScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    return Container(
      height: 400,
      child: Column(
        children: [
          InfoCardSmall(
            title: "Premium Members",
            value : "7",
            onTap: (){},
            topColor: Colors.orange,
          ),
          SizedBox(width: _width/64, height: 10,),
          InfoCardSmall(
            title: "Active Members",
            value : "7",
            onTap: (){},
            topColor: Colors.lightGreen,
          ),
          SizedBox(width: _width/64, height: 10,),
          InfoCardSmall(
            title: "Total Published",
            value : "17",
            onTap: (){},
            topColor: active,
          ),
          SizedBox(width: _width/64, height: 10,),
          InfoCardSmall(
            title: "Unpublished",
            value : "17",
            onTap: (){},
            topColor: Colors.redAccent,
          ),
        ],
      ),
    );
  }
}
