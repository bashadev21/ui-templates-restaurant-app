import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'Languages/arabic.dart';
import 'Languages/english.dart';
import 'Languages/french.dart';
import 'Languages/indonesian.dart';
import 'Languages/portuguese.dart';
import 'Languages/spanish.dart';

class AppLocalizations {
  final Locale locale;
  AppLocalizations(this.locale);

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static Map<String, Map<String, String>> _localizedValues = {
    'en': english(),
    'ar': arabic(),
    'pt': portuguese(),
    'fr': french(),
    'id': indonesian(),
    'es': spanish(),
  };

  String get myProfile {
    return _localizedValues[locale.languageCode]['myProfile'];
  }

  String get uploadPhoto {
    return _localizedValues[locale.languageCode]['uploadPhoto'];
  }

  String get changeLanguage {
    return _localizedValues[locale.languageCode]['changeLanguage'];
  }

  String get documentation {
    return _localizedValues[locale.languageCode]['documentation'];
  }

  String get govtID {
    return _localizedValues[locale.languageCode]['govtID'];
  }

  String get verified {
    return _localizedValues[locale.languageCode]['verified'];
  }

  String get drivingLicense {
    return _localizedValues[locale.languageCode]['drivingLicense'];
  }

  String get notUploadedYet {
    return _localizedValues[locale.languageCode]['notUploadedYet'];
  }

  String get upload {
    return _localizedValues[locale.languageCode]['upload'];
  }

  String get updateInfo {
    return _localizedValues[locale.languageCode]['updateInfo'];
  }

  String get faq1 {
    return _localizedValues[locale.languageCode]['faq1'];
  }

  String get faq2 {
    return _localizedValues[locale.languageCode]['faq2'];
  }

  String get faq3 {
    return _localizedValues[locale.languageCode]['faq3'];
  }

  String get faq4 {
    return _localizedValues[locale.languageCode]['faq4'];
  }

  String get faq5 {
    return _localizedValues[locale.languageCode]['faq5'];
  }

  String get faq6 {
    return _localizedValues[locale.languageCode]['faq6'];
  }

  String get faq7 {
    return _localizedValues[locale.languageCode]['faq7'];
  }

  String get faqs {
    return _localizedValues[locale.languageCode]['faqs'];
  }

  String get support {
    return _localizedValues[locale.languageCode]['support'];
  }

  String get howMayWeHelpYou {
    return _localizedValues[locale.languageCode]['howMayWeHelpYou'];
  }

  String get letUsKnowYourQueries {
    return _localizedValues[locale.languageCode]['letUsKnowYourQueries'];
  }

  String get email {
    return _localizedValues[locale.languageCode]['email'];
  }

  String get writeYourMsg {
    return _localizedValues[locale.languageCode]['writeYourMsg'];
  }

  String get submit {
    return _localizedValues[locale.languageCode]['submit'];
  }

  String get tnc {
    return _localizedValues[locale.languageCode]['tnc'];
  }

  String get insight {
    return _localizedValues[locale.languageCode]['insight'];
  }

  String get today {
    return _localizedValues[locale.languageCode]['today'];
  }

  String get orders {
    return _localizedValues[locale.languageCode]['orders'];
  }

  String get km {
    return _localizedValues[locale.languageCode]['km'];
  }

  String get ride {
    return _localizedValues[locale.languageCode]['ride'];
  }

  String get earnings {
    return _localizedValues[locale.languageCode]['earnings'];
  }

  String get viewAll {
    return _localizedValues[locale.languageCode]['viewAll'];
  }

  String get sendToBank {
    return _localizedValues[locale.languageCode]['sendToBank'];
  }

  String get availableBalance {
    return _localizedValues[locale.languageCode]['availableBalance'];
  }

  String get bankInfo {
    return _localizedValues[locale.languageCode]['bankInfo'];
  }

  String get accountHolderName {
    return _localizedValues[locale.languageCode]['accountHolderName'];
  }

  String get bankName {
    return _localizedValues[locale.languageCode]['bankName'];
  }

  String get branchCode {
    return _localizedValues[locale.languageCode]['branchCode'];
  }

  String get accountNumber {
    return _localizedValues[locale.languageCode]['accountNumber'];
  }

  String get amountToTransfer {
    return _localizedValues[locale.languageCode]['amountToTransfer'];
  }

  String get wallet {
    return _localizedValues[locale.languageCode]['wallet'];
  }

  String get recent {
    return _localizedValues[locale.languageCode]['recent'];
  }

  String get items {
    return _localizedValues[locale.languageCode]['items'];
  }

  String get randomDate {
    return _localizedValues[locale.languageCode]['randomDate'];
  }

  String get online {
    return _localizedValues[locale.languageCode]['online'];
  }

  String get enterMobileNumber {
    return _localizedValues[locale.languageCode]['enterMobileNumber'];
  }

  String get orContinueWith {
    return _localizedValues[locale.languageCode]['orContinueWith'];
  }

  String get facebook {
    return _localizedValues[locale.languageCode]['facebook'];
  }

  String get gmail {
    return _localizedValues[locale.languageCode]['gmail'];
  }

  String get registerNow {
    return _localizedValues[locale.languageCode]['registerNow'];
  }

  String get yourPhoneNotRegistered {
    return _localizedValues[locale.languageCode]['yourPhoneNotRegistered'];
  }

  String get letUsKnowBasicDetails {
    return _localizedValues[locale.languageCode]['letUsKnowBasicDetails'];
  }

  String get mobileNumber {
    return _localizedValues[locale.languageCode]['mobileNumber'];
  }

  String get fullName {
    return _localizedValues[locale.languageCode]['fullName'];
  }

  String get emailAddress {
    return _localizedValues[locale.languageCode]['emailAddress'];
  }

  String get backToSignIn {
    return _localizedValues[locale.languageCode]['backToSignIn'];
  }

  String get wellSendAnOtp {
    return _localizedValues[locale.languageCode]['wellSendAnOtp'];
  }

  String get givenPhoneNumber {
    return _localizedValues[locale.languageCode]['givenPhoneNumber'];
  }

  String get phoneVerification {
    return _localizedValues[locale.languageCode]['phoneVerification'];
  }

  String get weveSendAnOtpVerification {
    return _localizedValues[locale.languageCode]['weveSendAnOtpVerification'];
  }

  String get onYourGivenNumber {
    return _localizedValues[locale.languageCode]['onYourGivenNumber'];
  }

  String get enter4DigitOtp {
    return _localizedValues[locale.languageCode]['enter4DigitOtp'];
  }

  String get secLeft {
    return _localizedValues[locale.languageCode]['secLeft'];
  }

  String get resend {
    return _localizedValues[locale.languageCode]['resend'];
  }

  String get customer {
    return _localizedValues[locale.languageCode]['customer'];
  }

  String get typeYourMsg {
    return _localizedValues[locale.languageCode]['typeYourMsg'];
  }

  String get heyThere {
    return _localizedValues[locale.languageCode]['heyThere'];
  }

  String get howMuchTime {
    return _localizedValues[locale.languageCode]['howMuchTime'];
  }

  String get onMyWay {
    return _localizedValues[locale.languageCode]['onMyWay'];
  }

  String get willReachIn {
    return _localizedValues[locale.languageCode]['willReachIn'];
  }

  String get medicalStore {
    return _localizedValues[locale.languageCode]['medicalStore'];
  }

  String get continuee {
    return _localizedValues[locale.languageCode]['continuee'];
  }

  String get go {
    return _localizedValues[locale.languageCode]['go'];
  }

  String get packs {
    return _localizedValues[locale.languageCode]['packs'];
  }

  String get cashOnDel {
    return _localizedValues[locale.languageCode]['cashOnDel'];
  }

  String get prescUploaded {
    return _localizedValues[locale.languageCode]['prescUploaded'];
  }

  String get min {
    return _localizedValues[locale.languageCode]['min'];
  }

  String get direction {
    return _localizedValues[locale.languageCode]['direction'];
  }

  String get markAsPicked {
    return _localizedValues[locale.languageCode]['markAsPicked'];
  }

  String get acceptDelivery {
    return _localizedValues[locale.languageCode]['acceptDelivery'];
  }

  String get quickPayments {
    return _localizedValues[locale.languageCode]['quickPayments'];
  }

  String get rideOverview {
    return _localizedValues[locale.languageCode]['rideOverview'];
  }

  String get setProfile {
    return _localizedValues[locale.languageCode]['setProfile'];
  }

  String get contactUs {
    return _localizedValues[locale.languageCode]['contactUs'];
  }

  String get letUsHelpYou {
    return _localizedValues[locale.languageCode]['letUsHelpYou'];
  }

  String get aboutUs {
    return _localizedValues[locale.languageCode]['aboutUs'];
  }

  String get tncc {
    return _localizedValues[locale.languageCode]['tncc'];
  }

  String get privacyPolicies {
    return _localizedValues[locale.languageCode]['privacyPolicies'];
  }

  String get quickAnswers {
    return _localizedValues[locale.languageCode]['quickAnswers'];
  }

  String get logout {
    return _localizedValues[locale.languageCode]['logout'];
  }

  String get seeYouSoon {
    return _localizedValues[locale.languageCode]['seeYouSoon'];
  }

  String get account {
    return _localizedValues[locale.languageCode]['account'];
  }

  String get youreOnline {
    return _localizedValues[locale.languageCode]['youreOnline'];
  }

  String get youreOffline {
    return _localizedValues[locale.languageCode]['youreOffline'];
  }

  String get deliveredSuccessfully {
    return _localizedValues[locale.languageCode]['deliveredSuccessfully'];
  }

  String get thankYouForDeliver {
    return _localizedValues[locale.languageCode]['thankYouForDeliver'];
  }

  String get youDrove {
    return _localizedValues[locale.languageCode]['youDrove'];
  }

  String get viewOrderInfo {
    return _localizedValues[locale.languageCode]['viewOrderInfo'];
  }

  String get yourEarnings {
    return _localizedValues[locale.languageCode]['yourEarnings'];
  }

  String get viewEarnings {
    return _localizedValues[locale.languageCode]['viewEarnings'];
  }

  String get backToHome {
    return _localizedValues[locale.languageCode]['backToHome'];
  }
}

class AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) =>
      ['en', 'ar', 'id', 'pt', 'fr', 'es'].contains(locale.languageCode);

  @override
  Future<AppLocalizations> load(Locale locale) {
    // Returning a SynchronousFuture here because an async "load" operation
    // isn't needed to produce an instance of AppLocalizations.
    return SynchronousFuture<AppLocalizations>(AppLocalizations(locale));
  }

  @override
  bool shouldReload(AppLocalizationsDelegate old) => false;
}
