import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:docto_delivery/Locale/locale.dart';
import 'package:docto_delivery/Routes/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class WalletPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var locale = AppLocalizations.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          locale.wallet,
          style: Theme.of(context).textTheme.subtitle1.copyWith(fontSize: 18),
        ),
        centerTitle: true,
      ),
      body: FadedSlideAnimation(
        Wallet(),
        beginOffset: Offset(0, 0.3),
        endOffset: Offset(0, 0),
        slideCurve: Curves.linearToEaseOut,
      ),
    );
  }
}

class Wallet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var locale = AppLocalizations.of(context);
    return ListView(
      physics: BouncingScrollPhysics(),
      children: <Widget>[
        Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12.0),
                    child: ListTile(
                      title: Text(
                        locale.availableBalance.toUpperCase(),
                        style: Theme.of(context).textTheme.subtitle2.copyWith(
                            letterSpacing: 0.67,
                            color: Theme.of(context).disabledColor,
                            fontWeight: FontWeight.w500),
                      ),
                      subtitle: Text(
                        '\$ 520.50',
                        style: Theme.of(context).textTheme.headline4,
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 40.0,
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                  color: Theme.of(context).backgroundColor,
                  child: Text(
                    locale.recent,
                    style: Theme.of(context).textTheme.subtitle2.copyWith(),
                  ),
                ),
              ],
            ),
            Positioned.directional(
              textDirection: Directionality.of(context),
              top: 70.0,
              end: 20.0,
              child: Container(
                height: 46.0,
                width: 134.0,
                color: Theme.of(context).primaryColor,
                child: FlatButton(
                  color: Theme.of(context).primaryColor,
                  onPressed: () =>
                      Navigator.pushNamed(context, PageRoutes.sendToBankPage),
                  child: Text(
                    locale.sendToBank,
                    style: Theme.of(context).textTheme.bodyText2.copyWith(
                        color: Theme.of(context).scaffoldBackgroundColor),
                  ),
                ),
              ),
            ),
          ],
        ),
        ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: 15,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  buildWalletTile(context),
                  Divider(
                    color: Theme.of(context).backgroundColor,
                    thickness: 5.0,
                    height: 5.0,
                  ),
                ],
              );
            }),
      ],
    );
  }

  Widget buildWalletTile(BuildContext context) {
    var locale = AppLocalizations.of(context);
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, PageRoutes.insightPage);
      },
      child: Padding(
        padding: const EdgeInsets.only(
            left: 20.0, right: 20.0, top: 12.0, bottom: 12.0),
        child: Row(
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text('San Smith', style: Theme.of(context).textTheme.subtitle1),
                SizedBox(height: 4.0),
                Text('3' + locale.items + '|' + locale.randomDate,
                    style: Theme.of(context).textTheme.subtitle2.copyWith(
                        color: Theme.of(context).disabledColor, fontSize: 12)),
              ],
            ),
            Spacer(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Text(
                  '\$80.00',
                  style: Theme.of(context).textTheme.subtitle1,
                ),
                SizedBox(height: 4.0),
                Text(locale.online,
                    style: Theme.of(context)
                        .textTheme
                        .subtitle2
                        .copyWith(color: Theme.of(context).disabledColor)),
              ],
            ),
            Spacer(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Text(
                  '\$5.20',
                  style: Theme.of(context).textTheme.subtitle1,
                ),
                SizedBox(height: 4.0),
                Text(locale.earnings,
                    style: Theme.of(context)
                        .textTheme
                        .subtitle2
                        .copyWith(color: Theme.of(context).disabledColor)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
