import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:docto_delivery/Components/custom_button.dart';
import 'package:docto_delivery/Components/entry_field.dart';
import 'package:docto_delivery/Locale/locale.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var locale = AppLocalizations.of(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: true,
        title: Text(
          locale.myProfile,
          style: Theme.of(context).textTheme.subtitle1.copyWith(fontSize: 18),
        ),
      ),
      body: FadedSlideAnimation(
        RegisterForm('987 654 3210'),
        beginOffset: Offset(0, 0.3),
        endOffset: Offset(0, 0),
        slideCurve: Curves.linearToEaseOut,
      ),
    );
  }
}

class RegisterForm extends StatefulWidget {
  final String phoneNumber;

  RegisterForm(this.phoneNumber);

  @override
  _RegisterFormState createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var locale = AppLocalizations.of(context);
    return Stack(
      children: <Widget>[
        SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Divider(
                color: Theme.of(context).cardColor,
                thickness: 8.0,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          height: 99.0,
                          width: 99.0,
                          //color: Theme.of(context).cardColor,
                          child: FadedScaleAnimation(
                            Image.asset('assets/img_profile.png'),
                            durationInMilliseconds: 400,
                          ),
                        ),
                        SizedBox(width: 24.0),
                        CircleAvatar(
                          radius: 16,
                          backgroundColor: Theme.of(context).primaryColor,
                          child: Icon(
                            Icons.camera_alt,
                            color: Theme.of(context).scaffoldBackgroundColor,
                            size: 19.0,
                          ),
                        ),
                        SizedBox(width: 14.3),
                        Text(locale.uploadPhoto,
                            style: Theme.of(context)
                                .textTheme
                                .subtitle2
                                .copyWith(
                                    color: Theme.of(context).primaryColor)),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 12,
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    EntryField(
                      isDense: true,
                      borderRadius: BorderRadius.circular(2),
                      prefixIcon: Icons.account_circle,
                      initialValue: 'George Anderson',
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    EntryField(
                      prefixIcon: Icons.phone_iphone,
                      isDense: true,
                      borderRadius: BorderRadius.circular(2),
                      initialValue: '+1 987 654 3210',
                      readOnly: true,
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    EntryField(
                      prefixIcon: Icons.mail,
                      isDense: true,
                      borderRadius: BorderRadius.circular(2),
                      initialValue: 'deliveryman@email.com',
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                  ],
                ),
              ),
              Divider(
                thickness: 8.0,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10.0, horizontal: 20.0),
                    child: Text(
                      locale.documentation,
                      style: Theme.of(context).textTheme.subtitle1.copyWith(
                          fontWeight: FontWeight.w500,
                          color: Theme.of(context).disabledColor),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: ListTile(
                      leading: Icon(
                        Icons.verified_user,
                        color: Theme.of(context).primaryColor,
                      ),
                      title: Text(
                        locale.govtID.toUpperCase(),
                        style: Theme.of(context)
                            .textTheme
                            .headline5
                            .copyWith(fontSize: 10.0, color: Color(0xff838383)),
                      ),
                      subtitle: Text(
                        'myvoterid.jpg',
                        style: Theme.of(context).textTheme.bodyText2,
                      ),
                      trailing: Text(
                        locale.verified.toUpperCase(),
                        style: Theme.of(context).textTheme.bodyText2.copyWith(
                            color: Theme.of(context).primaryColor,
                            letterSpacing: 0.67,
                            fontWeight: FontWeight.w500,
                            fontSize: 13),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: ListTile(
                      leading: Icon(
                        Icons.assignment_late_rounded,
                        color: Theme.of(context).disabledColor,
                      ),
                      title: Text(
                        locale.drivingLicense.toUpperCase(),
                        style: Theme.of(context)
                            .textTheme
                            .headline5
                            .copyWith(fontSize: 10.0, color: Color(0xff838383)),
                      ),
                      subtitle: Text(
                        locale.notUploadedYet,
                        style: Theme.of(context)
                            .textTheme
                            .caption
                            .copyWith(color: Color(0xff8f8f8f)),
                      ),
                      trailing: Text(
                        locale.upload.toUpperCase(),
                        style: Theme.of(context).textTheme.bodyText2.copyWith(
                            color: Theme.of(context).primaryColor,
                            letterSpacing: 0.67,
                            fontWeight: FontWeight.w500,
                            fontSize: 13),
                      ),
                    ),
                  ),
                  Container(
                    height: 80.0,
                    color: Theme.of(context).cardColor,
                  ),
                ],
              ),
            ],
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: CustomButton(
              label: locale.updateInfo,
              onTap: () {
                // Navigator.popAndPushNamed(context, PageRoutes.accountPage);
              }),
        )
      ],
    );
  }
}
