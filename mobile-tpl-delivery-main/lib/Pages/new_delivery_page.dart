import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:docto_delivery/Components/custom_button.dart';
import 'package:docto_delivery/Locale/locale.dart';
import 'package:docto_delivery/Routes/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NewDeliveryPage extends StatefulWidget {
  @override
  _NewDeliveryPageState createState() => _NewDeliveryPageState();
}

class _NewDeliveryPageState extends State<NewDeliveryPage> {
  bool deliveryAccepted = false;
  bool isCartOpen = false;
  @override
  Widget build(BuildContext context) {
    var locale = AppLocalizations.of(context);
    return Scaffold(
      body: FadedSlideAnimation(
        Stack(
          children: [
            Image.asset(
              'assets/map2.jpg',
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.fill,
            ),
            deliveryAccepted
                ? PositionedDirectional(
                    top: 50,
                    end: 20,
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          isCartOpen = !isCartOpen;
                        });
                      },
                      child: CircleAvatar(
                        radius: 18,
                        backgroundColor: Theme.of(context).primaryColor,
                        child: Icon(
                          isCartOpen ? Icons.close : Icons.shopping_cart,
                          color: Theme.of(context).scaffoldBackgroundColor,
                          size: 17,
                        ),
                      ),
                    ),
                  )
                : SizedBox.shrink(),
            isCartOpen
                ? PositionedDirectional(
                    top: 100,
                    start: 12,
                    end: 12,
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Theme.of(context).scaffoldBackgroundColor),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          ListView.builder(
                              padding: EdgeInsets.zero,
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: 3,
                              itemBuilder: (context, index) {
                                return ListTile(
                                  title: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text('Salospir 100mg Tablet'),
                                      SizedBox(
                                        width: 12,
                                      ),
                                      Image.asset(
                                        'assets/ic_prescription.png',
                                        scale: 3.5,
                                      ),
                                    ],
                                  ),
                                  subtitle: Text('2 ' + locale.packs,
                                      style: Theme.of(context)
                                          .textTheme
                                          .subtitle2
                                          .copyWith(color: Theme.of(context).disabledColor)),
                                  trailing:
                                      Text('\$6.00', style: Theme.of(context).textTheme.subtitle1),
                                );
                              }),
                          ListTile(
                            dense: true,
                            tileColor: Theme.of(context).backgroundColor,
                            title: Text(
                              locale.cashOnDel,
                              style: Theme.of(context)
                                  .textTheme
                                  .subtitle1
                                  .copyWith(color: Theme.of(context).primaryColor),
                            ),
                            trailing: Text(
                              '\$20.00',
                              style: Theme.of(context)
                                  .textTheme
                                  .subtitle1
                                  .copyWith(color: Theme.of(context).primaryColor),
                            ),
                          ),
                          ListTile(
                            title: Row(
                              children: [
                                Image.asset(
                                  'assets/ic_prescription.png',
                                  scale: 3.5,
                                ),
                                SizedBox(
                                  width: 12,
                                ),
                                Text(
                                  locale.prescUploaded,
                                  style: Theme.of(context).textTheme.subtitle1,
                                ),
                              ],
                            ),
                            trailing: Icon(
                              Icons.remove_red_eye,
                              color: Theme.of(context).primaryColor,
                              size: 20,
                            ),
                          ),
                        ],
                      ),
                    ))
                : SizedBox.shrink(),
            PositionedDirectional(
              bottom: 8,
              start: 12,
              end: 12,
              child: FadedScaleAnimation(
                Container(
                  decoration: BoxDecoration(
                      color: Theme.of(context).scaffoldBackgroundColor,
                      borderRadius: BorderRadius.circular(12)),
                  child: Column(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
                        child: ListTile(
                          tileColor: Theme.of(context).backgroundColor,
                          title: RichText(
                              text: TextSpan(children: <TextSpan>[
                            TextSpan(
                                text: '16.5 ' + locale.km,
                                style: Theme.of(context).textTheme.subtitle1),
                            TextSpan(
                                text: ' (12' + locale.min + ')',
                                style: Theme.of(context)
                                    .textTheme
                                    .subtitle2
                                    .copyWith(color: Theme.of(context).disabledColor)),
                          ])),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                Icons.navigation_rounded,
                                color: Theme.of(context).primaryColor,
                              ),
                              SizedBox(
                                width: 8,
                              ),
                              Text(
                                locale.direction,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1
                                    .copyWith(color: Theme.of(context).primaryColor),
                              )
                            ],
                          ),
                        ),
                      ),
                      ListTile(
                        contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 8),
                        leading: Icon(
                          Icons.location_on,
                          color: Theme.of(context).primaryColor,
                        ),
                        title: Text('Well Life Store'),
                        subtitle: Text(
                          '1024, Hemiltone Street\nUnion Market, USA',
                          style: Theme.of(context)
                              .textTheme
                              .subtitle2
                              .copyWith(color: Theme.of(context).disabledColor, fontSize: 12),
                        ),
                        trailing: deliveryAccepted
                            ? Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(
                                    Icons.call,
                                    color: Theme.of(context).primaryColor,
                                    size: 16,
                                  ),
                                  SizedBox(
                                    width: 16,
                                  ),
                                  GestureDetector(
                                      onTap: () {
                                        Navigator.pushNamed(context, PageRoutes.chatToStorePage);
                                      },
                                      child: Icon(Icons.message,
                                          color: Theme.of(context).primaryColor, size: 16)),
                                  SizedBox(
                                    width: 12,
                                  ),
                                ],
                              )
                            : SizedBox.shrink(),
                      ),
                      ListTile(
                        contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 8),
                        leading: Icon(
                          Icons.navigation_rounded,
                          color: Theme.of(context).primaryColor,
                        ),
                        title: Text('Samantha Smith'),
                        subtitle: Text(
                          'D-32, Deniel Street, Central\nResidency, USA',
                          style: Theme.of(context)
                              .textTheme
                              .subtitle2
                              .copyWith(color: Theme.of(context).disabledColor, fontSize: 12),
                        ),
                        trailing: deliveryAccepted
                            ? Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(
                                    Icons.call,
                                    color: Theme.of(context).primaryColor,
                                    size: 16,
                                  ),
                                  SizedBox(
                                    width: 16,
                                  ),
                                  GestureDetector(
                                      onTap: () {
                                        Navigator.pushNamed(context, PageRoutes.chatToCustomerPage);
                                      },
                                      child: Icon(Icons.message,
                                          color: Theme.of(context).primaryColor, size: 16)),
                                  SizedBox(
                                    width: 12,
                                  ),
                                ],
                              )
                            : SizedBox.shrink(),
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.vertical(bottom: Radius.circular(12)),
                        child: CustomButton(
                          label: deliveryAccepted ? locale.markAsPicked : locale.acceptDelivery,
                          radius: 0,
                          onTap: () {
                            deliveryAccepted
                                ? Navigator.pushNamed(context, PageRoutes.orderDeliveredPage)
                                : null;
                            setState(() {
                              deliveryAccepted = true;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                durationInMilliseconds: 400,
              ),
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
