import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:docto_delivery/Locale/locale.dart';
import 'package:docto_delivery/Routes/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class InsightPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var locale = AppLocalizations.of(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(locale.insight,
            style: Theme.of(context)
                .textTheme
                .subtitle1
                .copyWith(fontSize: 18, fontWeight: FontWeight.w500)),
        titleSpacing: 0.0,
        actions: <Widget>[
          Row(
            children: <Widget>[
              Text(
                locale.today.toUpperCase(),
                style: Theme.of(context).textTheme.headline4.copyWith(
                    fontSize: 15.0,
                    letterSpacing: 1.5,
                    color: Theme.of(context).primaryColor),
              ),
              IconButton(
                icon: Icon(Icons.arrow_drop_down),
                color: Theme.of(context).primaryColor,
                onPressed: () {},
              )
            ],
          )
        ],
      ),
      body: FadedSlideAnimation(
        Insight(),
        beginOffset: Offset(0, 0.3),
        endOffset: Offset(0, 0),
        slideCurve: Curves.linearToEaseOut,
      ),
    );
  }
}

class Insight extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var locale = AppLocalizations.of(context);
    return ListView(
      children: <Widget>[
        Divider(
          thickness: 8.0,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 40, vertical: 10.0),
          child: Row(
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(bottom: 8.0),
                    child: Text('64',
                        style: Theme.of(context)
                            .textTheme
                            .subtitle1
                            .copyWith(fontSize: 18)),
                  ),
                  Text(
                    locale.orders,
                    style: Theme.of(context).textTheme.subtitle2.copyWith(
                        fontWeight: FontWeight.w500,
                        color: Theme.of(context).disabledColor),
                  ),
                ],
              ),
              Spacer(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(bottom: 8.0),
                    child: Text('68 ' + locale.km,
                        style: Theme.of(context)
                            .textTheme
                            .subtitle1
                            .copyWith(fontSize: 18)),
                  ),
                  Text(
                    locale.ride,
                    style: Theme.of(context).textTheme.subtitle2.copyWith(
                        fontWeight: FontWeight.w500,
                        color: Theme.of(context).disabledColor),
                  ),
                ],
              ),
              Spacer(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(bottom: 8.0),
                    child: Text('\$302.50',
                        style: Theme.of(context)
                            .textTheme
                            .subtitle1
                            .copyWith(fontSize: 18)),
                  ),
                  Text(
                    locale.earnings,
                    style: Theme.of(context).textTheme.subtitle2.copyWith(
                        fontWeight: FontWeight.w500,
                        color: Theme.of(context).disabledColor),
                  ),
                ],
              ),
            ],
          ),
        ),
        Divider(
          thickness: 6.7,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(locale.earnings.toUpperCase(),
                  style: Theme.of(context)
                      .textTheme
                      .headline4
                      .copyWith(fontSize: 15.0, letterSpacing: 1.5)),
              Center(
                child: FadedScaleAnimation(
                  Image(
                    image: AssetImage("assets/img_chart.png"),
                    height: 200.0,
                  ),
                  durationInMilliseconds: 400,
                ),
              ),
              GestureDetector(
                onTap: () =>
                    Navigator.pushNamed(context, PageRoutes.walletPage),
                child: Center(
                  child: Text(
                    locale.viewAll.toUpperCase(),
                    style: Theme.of(context).textTheme.caption.copyWith(
                        color: Theme.of(context).primaryColor,
                        letterSpacing: 1.33,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ),
        Divider(
          thickness: 6.7,
        ),
        Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(locale.orders.toUpperCase(),
                  style: Theme.of(context)
                      .textTheme
                      .headline4
                      .copyWith(fontSize: 15.0, letterSpacing: 1.5)),
              Center(
                child: FadedScaleAnimation(
                  Image(
                    image: AssetImage("assets/img_chart.png"),
                    height: 200.0,
                  ),
                  durationInMilliseconds: 400,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
