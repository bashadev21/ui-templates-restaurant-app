import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:docto_delivery/Components/custom_button.dart';
import 'package:docto_delivery/Locale/locale.dart';
import 'package:docto_delivery/Routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderDeliveredPage extends StatefulWidget {
  @override
  _OrderDeliveredPageState createState() => _OrderDeliveredPageState();
}

class _OrderDeliveredPageState extends State<OrderDeliveredPage> {
  @override
  Widget build(BuildContext context) {
    var locale = AppLocalizations.of(context);
    return Scaffold(
      body: FadedSlideAnimation(
        Column(
          children: [
            Spacer(
              flex: 2,
            ),
            FadedScaleAnimation(
              Image.asset(
                'assets/img_order delivered.png',
                scale: 3,
              ),
              durationInMilliseconds: 400,
            ),
            Spacer(),
            Text(locale.deliveredSuccessfully,
                style: Theme.of(context).textTheme.bodyText1.copyWith(fontSize: 20)),
            SizedBox(
              height: 6,
            ),
            Text(locale.thankYouForDeliver),
            Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 28.0),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, PageRoutes.orderInfoPage);
                    },
                    child: RichText(
                        text: TextSpan(children: <TextSpan>[
                      TextSpan(
                          text: locale.youDrove + '\n',
                          style: Theme.of(context).textTheme.subtitle2),
                      TextSpan(
                          text: '18 ' + locale.min + ' (6.5 ' + locale.km + ')\n',
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1
                              .copyWith(fontSize: 16, height: 1.7)),
                      TextSpan(
                          text: locale.viewOrderInfo,
                          style: Theme.of(context).textTheme.bodyText1.copyWith(
                              fontSize: 17, color: Theme.of(context).primaryColor, height: 1.5)),
                    ])),
                  ),
                  Spacer(),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, PageRoutes.walletPage);
                    },
                    child: RichText(
                        text: TextSpan(children: <TextSpan>[
                      TextSpan(
                          text: locale.yourEarnings + '\n',
                          style: Theme.of(context).textTheme.subtitle2),
                      TextSpan(
                          text: '\$ 8.50\n',
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1
                              .copyWith(fontSize: 16, height: 1.7)),
                      TextSpan(
                          text: locale.viewEarnings,
                          style: Theme.of(context).textTheme.bodyText1.copyWith(
                              fontSize: 17, color: Theme.of(context).primaryColor, height: 1.5)),
                    ])),
                  ),
                ],
              ),
            ),
            Spacer(),
            CustomButton(
              radius: 0,
              onTap: () {
                Get.back();
              },
              label: locale.backToHome,
            ),
          ],
        ),
        beginOffset: Offset(0, 0.3),
        endOffset: Offset(0, 0),
        slideCurve: Curves.linearToEaseOut,
      ),
    );
  }
}
