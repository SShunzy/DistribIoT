import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/classes/user_small.dart';
import 'package:flutter_app/pages/change_picture_page.dart';
import 'package:flutter_app/services/token_managing_service.dart';

class AccountWidget extends StatelessWidget{
  const AccountWidget({super.key, required this.user});

  final UserSmall user;


  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(vertical: 15.0),
        child:Column(
          children: [
            Center(
              child: CircleAvatar(
                backgroundImage: NetworkImage(
                  user.pictureURI.isNotEmpty?  user.pictureURI :
                  "https://upload.wikimedia.org/wikipedia/commons/a/ac/Default_pfp.jpg"
                ),
                radius: 50,
              ),
            ),
            Text(user.username),
          const SizedBox(height: 50),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 5.0,vertical: 10.0),
            child: CupertinoButton.filled(child: Text("Changer la photo de profil"), onPressed: (){
              Navigator.push(context, CupertinoPageRoute(builder: (context)=> ChangePicturePage(user: user)));
            }),
          ),
            CupertinoButton.filled(child: Text("Se déconnecter"), onPressed: () async {
              await storeToken("");
              Navigator.pop(context);
            }),
          ],
        )
    );
  }

}