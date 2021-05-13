import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:doctoworld_seller/Components/custom_button.dart';
import 'package:doctoworld_seller/Locale/locale.dart';
import 'package:doctoworld_seller/Routes/routes.dart';
import 'package:flutter/material.dart';

class OrderInfo extends StatefulWidget {
  @override
  _OrderInfoState createState() => _OrderInfoState();
}

class _OrderInfoState extends State<OrderInfo> {
  @override
  Widget build(BuildContext context) {
    var locale = AppLocalizations.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(locale.orderNum + ' 221451'),
        textTheme: Theme.of(context).textTheme,
        centerTitle: true,
        actions: [
          IconButton(
              icon: Icon(
                Icons.more_vert,
                color: Theme.of(context).primaryColor,
              ),
              onPressed: () {})
        ],
      ),
      body: FadedSlideAnimation(
        Stack(
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                ListTile(
                  leading: FadedScaleAnimation(
                    Image.asset(
                      'assets/test image.png',
                      height: 40,
                      width: 40,
                    ),
                    durationInMilliseconds: 400,
                  ),
                  title: Row(
                    children: [
                      Text(
                        'Samantha Smith',
                        style: Theme.of(context)
                            .textTheme
                            .subtitle1
                            .copyWith(fontWeight: FontWeight.w700),
                      ),
                      Spacer(),
                      Text(
                        locale.pending,
                        style: Theme.of(context).textTheme.bodyText1.copyWith(
                            color: Color(0xffD6AB33),
                            letterSpacing: 0.5,
                            fontSize: 14),
                      ),
                    ],
                  ),
                  subtitle: Row(
                    children: [
                      Text(
                        '13 June, 11:20 am',
                        style: Theme.of(context).textTheme.subtitle2,
                      ),
                      Spacer(),
                      Text(
                        '\$18.00 | COD',
                        style: Theme.of(context)
                            .textTheme
                            .subtitle2
                            .copyWith(fontSize: 13),
                      ),
                    ],
                  ),
                ),
                Divider(
                  color: Theme.of(context).backgroundColor,
                  thickness: 8.0,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
                  child: Text(locale.orderedItems,
                      style: Theme.of(context).textTheme.subtitle2.copyWith(
                          color: Theme.of(context).disabledColor,
                          fontSize: 14)),
                  color: Theme.of(context).scaffoldBackgroundColor,
                ),
                ListView.builder(
                    itemCount: 3,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15.0, vertical: 8),
                        child: Row(
                          children: [
                            RichText(
                                text: TextSpan(children: <TextSpan>[
                              TextSpan(
                                  text: 'Salospir 100mg Tablet\n',
                                  style: Theme.of(context).textTheme.subtitle1),
                              TextSpan(
                                  text: '2 ' + locale.packs,
                                  style: Theme.of(context)
                                      .textTheme
                                      .subtitle2
                                      .copyWith(height: 1.8))
                            ])),
                            SizedBox(
                              width: 15,
                            ),
                            Image.asset(
                              'assets/test image.png',
                              height: 25,
                              width: 25,
                            ),
                            Spacer(),
                            Text(
                              '\$6.00',
                              style: Theme.of(context).textTheme.subtitle1,
                            )
                          ],
                        ),
                      );
                    }),
                Divider(
                  color: Theme.of(context).backgroundColor,
                  thickness: 8.0,
                ),
                ListTile(
                  leading: FadedScaleAnimation(
                    Image.asset(
                      'assets/ic_prescription.png',
                      height: 25,
                      width: 25,
                    ),
                    durationInMilliseconds: 600,
                  ),
                  title: Text(
                    locale.prescUploaded,
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                  trailing: FadedScaleAnimation(
                    Icon(
                      Icons.remove_red_eye,
                      color: Theme.of(context).primaryColor,
                    ),
                    durationInMilliseconds: 600,
                  ),
                ),
                Divider(
                  color: Theme.of(context).backgroundColor,
                  thickness: 8.0,
                ),
                buildBottomListTile(context, 'Sub Total', '\$18.00'),
                buildBottomListTile(context, 'Promo Code Applied', '-\$2.00'),
                buildBottomListTile(context, 'Service Charge', '\$4.00'),
                buildBottomListTile(context, 'Amount via COD', '-\$20.00'),
                Expanded(
                  child: Container(
                    color: Theme.of(context).backgroundColor,
                  ),
                ),
              ],
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Container(
                    color: Theme.of(context).scaffoldBackgroundColor,
                    child: ListTile(
                      leading: FadedScaleAnimation(
                        Image.asset(
                          'assets/deliveryman.png',
                          height: 40,
                          width: 40,
                        ),
                        durationInMilliseconds: 600,
                      ),
                      title: Text(
                        'George Anderson',
                        style: Theme.of(context)
                            .textTheme
                            .subtitle1
                            .copyWith(fontWeight: FontWeight.w500),
                      ),
                      subtitle: Text(
                        locale.deliveryPartnerAssign,
                        style: Theme.of(context)
                            .textTheme
                            .subtitle2
                            .copyWith(letterSpacing: 0.06),
                      ),
                      trailing: IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.navigation,
                          color: Theme.of(context).primaryColor,
                          size: 20.0,
                        ),
                      ),
                    ),
                  ),
                  CustomButton(
                    label: locale.markAsReady,
                    color: Theme.of(context).primaryColor,
                    radius: 0,
                    onTap: () =>
                        Navigator.pushNamed(context, PageRoutes.trackOrderPage),
                  ),
                ],
              ),
            )
          ],
        ),
        beginOffset: Offset(0, 0.3),
        endOffset: Offset(0, 0),
        slideCurve: Curves.linearToEaseOut,
      ),
    );
  }

  Padding buildBottomListTile(BuildContext context, String text, String price) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 6),
      child: FadedSlideAnimation(
        Row(
          children: [
            Text(
              text,
              style: Theme.of(context).textTheme.subtitle1.copyWith(
                  fontWeight:
                      text != AppLocalizations.of(context).amountVia + ' COD'
                          ? FontWeight.w400
                          : FontWeight.w500),
            ),
            Spacer(),
            Text(
              price,
              style: Theme.of(context).textTheme.subtitle1.copyWith(
                  fontSize:
                      text != AppLocalizations.of(context).amountVia + ' COD'
                          ? 16
                          : 18),
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
