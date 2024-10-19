import 'package:flutter/material.dart';
import 'package:zego_zimkit/zego_zimkit.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Conversations'),
          actions:  [TextButton(onPressed: (){

            ZIMKit().showDefaultNewPeerChatDialog(context);
          }, child: const Icon(Icons.add))],
        ),
        body: ZIMKitConversationListView(
          onPressed: (context, conversation, defaultAction) {
            Navigator.push(context, MaterialPageRoute(
              builder: (context) {
                return ZIMKitMessageListPage(
                  conversationID: conversation.id,
                  conversationType: conversation.type,
                );
              },
            ));
          },
        ),
      ),
    );
  }
}