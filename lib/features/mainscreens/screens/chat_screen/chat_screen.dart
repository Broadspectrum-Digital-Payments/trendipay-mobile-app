import 'package:bdp_payment_app/core/constants/colors.dart';
import 'package:bdp_payment_app/core/constants/image_strings.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Expanded(
              child: ListView.builder(
                  itemCount: 2, // Example number of chat messages
                  itemBuilder: (context, index) {
                    // Example: Alternate between system and user messages
                    if (index % 2 == 0) {
                      return _buildUserChat();
                    } else {
                      return _buildSystemChat();
                    }
                  })),
          _buildChatInputRow(),
        ],
      ),
    );
  }



  Widget _buildChatInputRow() {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(8.0),
      child: Row(
        children: [
          Image.asset(BDPImages.userProfile),
          SizedBox(width: 10),
          Expanded(
            child: SizedBox(
              width: 300,
              height: 40,
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Type your message here...',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(width: 10),
          Image.asset(BDPImages.sendIcon)
        ],
      ),
    );
  }
}

Widget _buildSystemChat() {
  return Container(
    padding: const EdgeInsets.all(8.0),
    child: Row(
      children: [
        Image.asset(
          BDPImages.bdpIcon,
          width: 12.77,
          height: 24,
        ),
        const SizedBox(width: 4),
        Expanded(
            child: Container(
          width: 300,
          height: 58,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.0),
              topRight: Radius.circular(20.0),
              bottomLeft: Radius.zero,
              bottomRight: Radius.circular(20.0),
            ),
            color: BDPColors.primary,
          ),
          child: const Padding(
            padding: EdgeInsets.only(left: 18.0, right: 8.0),
            child: Text(
              'Welcome Keren, how may I help you',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 16,
                color: Colors.white,
              ),
            ),
          ),
        )),
      ],
    ),
  );
}

Widget _buildUserChat() {
  return Container(
    padding: const EdgeInsets.all(8.0),
    child: Row(
      children: [
        Expanded(
            child: Container(
          width: 300,
          height: 58,
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20.0),
                topRight: Radius.circular(20.0),
                bottomRight: Radius.zero,
                bottomLeft: Radius.circular(20.0),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  spreadRadius: 1,
                  blurRadius: 5,
                  offset: const Offset(0, 3),
                ),
              ],
              color: Colors.white),
          child: const Padding(
            padding: EdgeInsets.only(left: 18.0, right: 8.0),
            child: Text(
              'My balance is not reflecting',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
          ),
        )),
        const SizedBox(width: 4),
        Align(
            alignment: Alignment.bottomCenter,
            child: Image.asset(
              BDPImages.user,
              width: 24,
              height: 24,
            )),
      ],
    ),
  );
}
