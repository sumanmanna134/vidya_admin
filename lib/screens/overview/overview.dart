import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vidya_admin/constants/controller_constant.dart';
import 'package:vidya_admin/helpers/ResponsiveWidget.dart';
import 'package:vidya_admin/screens/overview/widgets/info_card_small.dart';
import 'package:vidya_admin/screens/overview/widgets/info_cards.dart';
import 'package:vidya_admin/screens/overview/widgets/overview_cards_large.dart';
import 'package:vidya_admin/screens/overview/widgets/overview_cards_medium.dart';
import 'package:vidya_admin/screens/overview/widgets/overview_cards_small.dart';
import 'package:vidya_admin/screens/overview/widgets/revenue_section_large.dart';
import 'package:vidya_admin/screens/overview/widgets/revenue_section_small.dart';
import 'package:vidya_admin/screens/overview/widgets/today_published.dart';
import 'package:vidya_admin/widgets/custom_text.dart';
class Overview extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Obx(()=> Row(
          children: [
            Container(
              margin: EdgeInsets.only(top: ResponsiveWidget.isSmallScreen(context)?56:6),
              child: CustomText(text: menuController.activeItem.value, size: 24, weight: FontWeight.bold,),
            ),

          ],
        )),
        Expanded(child: ListView(
          children: [
            if(ResponsiveWidget.isLargeScreen(context) || ResponsiveWidget.isMediumScreen(context))
              if(ResponsiveWidget.isCustomSize(context))
                OverviewCardsMediumScreenSize()
              else OverviewLargeScreen()
            else OverviewCardsSmallScreen(),

            ResponsiveWidget.isLargeScreen(context) ? RevenueSectionLarge(): RevenueSectionSmall(),
            TodayPublishedTable()




          ],
        ))
      ],
    );
  }
}
