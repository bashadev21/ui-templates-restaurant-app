import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:doctoworld_user/Components/custom_button.dart';
import 'package:doctoworld_user/Components/entry_field.dart';
import 'package:doctoworld_user/Locale/locale.dart';
import 'package:doctoworld_user/Routes/routes.dart';
import 'package:flutter/material.dart';

class SupportPage extends StatefulWidget {
  @override
  _SupportPageState createState() => _SupportPageState();
}

class _SupportPageState extends State<SupportPage> {
  @override
  Widget build(BuildContext context) {
    var locale = AppLocalizations.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(locale.support),
        textTheme: Theme.of(context).textTheme,
        centerTitle: true,
      ),
      body: FadedSlideAnimation(
        Padding(
          padding: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 0.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                locale.howMayWeHelpYou,
                style: Theme.of(context).textTheme.headline4,
              ),
              Text(
                locale.letUsKnowUrQueriesFeedbacks,
                style: Theme.of(context)
                    .textTheme
                    .subtitle1
                    .copyWith(color: Theme.of(context).disabledColor),
              ),
              Spacer(),
              EntryField(prefixIcon: Icons.mail, hint: locale.emailAddress),
              SizedBox(height: 12.0),
              EntryField(
                prefixIcon: Icons.edit,
                hint: locale.writeYourMsg,
                maxLines: 4,
              ),
              Spacer(),
              CustomButton(label: locale.submit),
              Spacer(flex: 2),
              FadedScaleAnimation(
                Image.asset(
                  'assets/hero_image.png',
                  height: 200,
                ),
                durationInMilliseconds: 400,
              )
            ],
          ),
        ),
        beginOffset: Offset(0, 0.3),
        endOffset: Offset(0, 0),
        slideCurve: Curves.linearToEaseOut,
      ),
    );
  }
}
