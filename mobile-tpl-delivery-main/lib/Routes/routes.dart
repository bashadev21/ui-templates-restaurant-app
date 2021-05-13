import 'package:docto_delivery/Account/DeliveryProfile/delivery_profile.dart';
import 'package:docto_delivery/Account/Help/faqs_page.dart';
import 'package:docto_delivery/Account/Help/support_page.dart';
import 'package:docto_delivery/Account/Help/tnc.dart';
import 'package:docto_delivery/Account/Insight/insight_page.dart';
import 'package:docto_delivery/Account/change_language_page.dart';
import 'package:docto_delivery/Account/send_to_bank.dart';
import 'package:docto_delivery/Account/wallet.dart';
import 'package:docto_delivery/Chat/chat_to_customer.dart';
import 'package:docto_delivery/Chat/chat_to_store.dart';
import 'package:docto_delivery/Pages/order_info.dart';
import 'package:docto_delivery/Pages/new_delivery_page.dart';
import 'package:docto_delivery/Pages/offline_page.dart';
import 'package:docto_delivery/Pages/order_delivered.dart';
import 'package:flutter/material.dart';

class PageRoutes {
  static const String offlinePage = 'offline_page';
  static const String newDeliveryPage = 'new_delivery_page';
  static const String chatToStorePage = 'chat_to_store';
  static const String chatToCustomerPage = 'chat_to_customer';
  static const String orderDeliveredPage = 'order_delivered_page';
  static const String walletPage = 'wallet_page';
  static const String orderInfoPage = 'order_info_page';
  static const String sendToBankPage = 'send_to_bank';
  static const String myProfile = 'my_profile';
  static const String insightPage = 'insight';
  static const String faqPage = 'faq_page';
  static const String supportPage = 'support_page';
  static const String tncPage = 'tnc_page';
  static const String languagePage = 'language_page';

  Map<String, WidgetBuilder> routes() {
    return {
      offlinePage: (context) => OfflinePage(),
      newDeliveryPage: (context) => NewDeliveryPage(),
      chatToStorePage: (context) => ChatToStore(),
      chatToCustomerPage: (context) => ChatToCustomer(),
      orderDeliveredPage: (context) => OrderDeliveredPage(),
      walletPage: (context) => WalletPage(),
      orderInfoPage: (context) => OrderInfo(),
      sendToBankPage: (context) => AddToBank(),
      myProfile: (context) => ProfilePage(),
      insightPage: (context) => InsightPage(),
      faqPage: (context) => FAQPage(),
      supportPage: (context) => SupportPage(),
      tncPage: (context) => TnCPage(),
      languagePage: (context) => ChangeLanguagePage(),
    };
  }
}
