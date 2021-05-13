import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:doctoworld_seller/Locale/locale.dart';
import 'package:doctoworld_seller/Routes/routes.dart';
import 'package:flutter/material.dart';

class RecentOrders extends StatefulWidget {
  @override
  _RecentOrdersState createState() => _RecentOrdersState();
}

class _RecentOrdersState extends State<RecentOrders> {
  @override
  Widget build(BuildContext context) {
    var locale = AppLocalizations.of(context);
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text(locale.recentOrders),
          textTheme: Theme.of(context).textTheme,
          centerTitle: true,
          leading: IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {
              Navigator.pushNamed(context, PageRoutes.accountPage);
            },
          ),
          bottom: TabBar(
              indicatorColor: Colors.transparent,
              unselectedLabelColor: Theme.of(context).disabledColor,
              labelColor: Theme.of(context).primaryColor,
              labelStyle: Theme.of(context).textTheme.bodyText1,
              unselectedLabelStyle: Theme.of(context).textTheme.bodyText1,
              tabs: [
                Tab(
                  text: locale.newOrders,
                ),
                Tab(
                  text: locale.pastOrders,
                ),
              ]),
        ),
        body: TabBarView(children: [
          FadedSlideAnimation(
            NewOrders(),
            beginOffset: Offset(0.3, 0.3),
            endOffset: Offset(0, 0),
            slideCurve: Curves.linearToEaseOut,
          ),
          FadedSlideAnimation(
            NewOrders(),
            beginOffset: Offset(0, 0.3),
            endOffset: Offset(0, 0),
            slideCurve: Curves.linearToEaseOut,
          ),
        ]),
      ),
    );
  }
}

class NewOrder {
  String image;
  String name;
  String dateTime;
  String status;
  String amountMode;
  List<String> medicines;

  NewOrder(this.image, this.name, this.dateTime, this.status, this.amountMode,
      this.medicines);
}

class NewOrders extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<String> _medicines1 = [
      'Salospir 100mg Tablet',
      'Non Drosy Laririn Tablet',
      'Xenical 120mg Tablet',
    ];
    List<String> _medicines2 = [
      'Non Drosy Laririn Tablet',
      'Xenical 120mg Tablet',
    ];
    List<NewOrder> newOrdersList = [
      NewOrder('assets/test image.png', 'Samantha Smith', '13 June, 11:20 am',
          'PENDING', '\$18.00 | COD', _medicines1),
      NewOrder('assets/test image.png', 'Healthfy Medicals', '2 items | PayPal',
          'PENDING', '\$18.00 | COD', _medicines2),
      NewOrder('assets/test image.png', 'Well Life Store', '13 June, 11:20 am',
          'ACCEPTED', '\$18.00 | COD', _medicines1),
      NewOrder('assets/test image.png', 'Healthfy Medicals', '2 items | PayPal',
          'ACCEPTED', '\$18.00 | COD', _medicines2),
      NewOrder('assets/test image.png', 'Samantha Smith', '13 June, 11:20 am',
          'PENDING', '\$18.00 | COD', _medicines1),
      NewOrder('assets/test image.png', 'Healthfy Medicals', '2 items | PayPal',
          'PENDING', '\$18.00 | COD', _medicines2),
      NewOrder('assets/test image.png', 'Well Life Store', '13 June, 11:20 am',
          'ACCEPTED', '\$18.00 | COD', _medicines1),
      NewOrder('assets/test image.png', 'Healthfy Medicals', '2 items | PayPal',
          'ACCEPTED', '\$18.00 | COD', _medicines2),
    ];
    return Scaffold(
      body: ListView.builder(
          physics: BouncingScrollPhysics(),
          shrinkWrap: true,
          itemCount: newOrdersList.length,
          itemBuilder: (context, outerIndex) {
            return InkWell(
              onTap: () =>
                  Navigator.pushNamed(context, PageRoutes.orderInfoPage),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Divider(
                    thickness: 6,
                    color: Theme.of(context).backgroundColor,
                  ),
                  ListTile(
                    leading: FadedScaleAnimation(
                      Image.asset(
                        newOrdersList[outerIndex].image,
                        height: 40,
                        width: 40,
                      ),
                      durationInMilliseconds: 400,
                    ),
                    title: Row(
                      children: [
                        Text(
                          newOrdersList[outerIndex].name,
                          style: Theme.of(context)
                              .textTheme
                              .subtitle1
                              .copyWith(fontWeight: FontWeight.w700),
                        ),
                        Spacer(),
                        Text(
                          newOrdersList[outerIndex].status,
                          style: Theme.of(context).textTheme.bodyText1.copyWith(
                              color:
                                  newOrdersList[outerIndex].status == 'PENDING'
                                      ? Color(0xffD6AB33)
                                      : Theme.of(context).primaryColor,
                              letterSpacing: 0.5,
                              fontSize: 14),
                        ),
                      ],
                    ),
                    subtitle: Row(
                      children: [
                        Text(
                          newOrdersList[outerIndex].dateTime,
                          style: Theme.of(context).textTheme.subtitle2,
                        ),
                        Spacer(),
                        Text(
                          newOrdersList[outerIndex].amountMode,
                          style: Theme.of(context)
                              .textTheme
                              .subtitle2
                              .copyWith(fontSize: 13),
                        ),
                      ],
                    ),
                  ),
                  ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: newOrdersList[outerIndex].medicines.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 75.0, vertical: 4),
                          child: Text(
                            newOrdersList[outerIndex].medicines[index],
                            style: Theme.of(context)
                                .textTheme
                                .subtitle1
                                .copyWith(fontSize: 14),
                          ),
                        );
                      }),
                  outerIndex == newOrdersList.length - 1
                      ? SizedBox(
                          height: 15,
                        )
                      : SizedBox.shrink(),
                ],
              ),
            );
          }),
    );
  }
}
