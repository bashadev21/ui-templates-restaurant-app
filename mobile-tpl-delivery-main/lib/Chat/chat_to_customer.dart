import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:docto_delivery/Locale/locale.dart';
import 'package:flutter/material.dart';

class ChatToCustomer extends StatefulWidget {
  @override
  _ChatToCustomerState createState() => _ChatToCustomerState();
}

class _ChatToCustomerState extends State<ChatToCustomer> {
  @override
  Widget build(BuildContext context) {
    var locale = AppLocalizations.of(context);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.keyboard_arrow_down)),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(60),
          child: ListTile(
            leading: Icon(
              Icons.navigation_rounded,
              color: Theme.of(context).primaryColor,
            ),
            title: Text('Samantha Smith'),
            subtitle: Text(
              locale.customer,
              style: Theme.of(context)
                  .textTheme
                  .subtitle2
                  .copyWith(color: Theme.of(context).disabledColor),
            ),
            trailing: Icon(
              Icons.call,
              color: Theme.of(context).primaryColor,
            ),
          ),
        ),
      ),
      body: Stack(
        children: [
          Container(
            constraints: BoxConstraints.expand(),
            padding: EdgeInsets.only(top: 0.0, bottom: 76),
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/map2.jpg'),
                    fit: BoxFit.cover,
                    colorFilter: ColorFilter.linearToSrgbGamma())),
            child: FadedScaleAnimation(
              MessageStream(),
              durationInMilliseconds: 400,
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: TextFormField(
              decoration: InputDecoration(
                  fillColor: Theme.of(context).scaffoldBackgroundColor,
                  filled: true,
                  hintText: locale.typeYourMsg,
                  suffixIcon: Icon(
                    Icons.send,
                    color: Theme.of(context).primaryColor,
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                  )),
            ),
          ),
        ],
      ),
    );
  }
}

class MessageStream extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var locale = AppLocalizations.of(context);
    List<MessageBubble> messageBubbles = [
      MessageBubble(
        sender: 'user',
        text: locale.heyThere + '\n' + locale.howMuchTime,
        time: '11:58 am',
        isDelivered: false,
        isMe: false,
      ),
      MessageBubble(
        sender: 'delivery_partner',
        text: locale.onMyWay + '\n' + locale.willReachIn,
        time: '11:59 am',
        isDelivered: false,
        isMe: true,
      ),
    ];
    return ListView(
      physics: BouncingScrollPhysics(),
      shrinkWrap: true,
      padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
      children: messageBubbles,
    );
  }
}

class MessageBubble extends StatelessWidget {
  final bool isMe;
  final String text;
  final String sender;
  final String time;
  final bool isDelivered;

  MessageBubble(
      {this.sender, this.text, this.time, this.isMe, this.isDelivered});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment:
            isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: <Widget>[
          Material(
            elevation: 4.0,
            color: isMe
                ? Theme.of(context).primaryColor
                : Theme.of(context).scaffoldBackgroundColor,
            borderRadius: BorderRadius.circular(6.0),
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 12.0),
              child: Column(
                crossAxisAlignment:
                    isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    text,
                    style: isMe
                        ? Theme.of(context).textTheme.bodyText2.copyWith(
                            color: Theme.of(context).scaffoldBackgroundColor)
                        : Theme.of(context).textTheme.bodyText2,
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Text(
                        time,
                        style: TextStyle(
                          fontSize: 10.0,
                          color: isMe
                              ? Colors.white.withOpacity(0.75)
                              : Theme.of(context).cursorColor,
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      isMe
                          ? Icon(
                              Icons.check_circle,
                              color:
                                  isDelivered ? Colors.blue : Colors.grey[300],
                              size: 12.0,
                            )
                          : SizedBox.shrink(),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
