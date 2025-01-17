import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/classes/user_small.dart';
import 'package:flutter_app/services/token_managing_service.dart';


class ChangePicturePage extends StatefulWidget{
  const ChangePicturePage({super.key, required this.user});

  final UserSmall user;
  @override
  State<ChangePicturePage> createState() => _ChangePicturePageState();
}

class _ChangePicturePageState extends State<ChangePicturePage> {
  final formKey = GlobalKey<FormState>();
  String pictureURI = "";

  @override
  Widget build(BuildContext context) {

    return  CupertinoPageScaffold(
        child: CustomScrollView(
          slivers: [
            CupertinoSliverNavigationBar(
              alwaysShowMiddle: false,
              largeTitle: const Text(
                "DistribIoT",
                style: TextStyle(height: 1, fontSize: 30),
              ),
              leading:  CupertinoButton(
                  padding:  const EdgeInsets.symmetric(vertical: 5),
                  child:   const Icon(Icons.arrow_back_ios),
                  onPressed: ()=> Navigator.pop(context)
              ),
            ),
            SliverFillRemaining(
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    CupertinoFormRow(
                        prefix:  Text("URL"),
                        child: CupertinoTextFormFieldRow(
                          placeholder: 'Enter Picture URL',
                          textInputAction: TextInputAction.next,
                          onChanged: (input){
                            pictureURI = input;
                          },
                          validator: (picture){
                            if(picture == null || picture.isEmpty) {
                              return 'Enter a valid Username';
                            }
                            else{
                              return null;
                            }
                          },
                        )
                    ),
                    Container(
                        margin: const EdgeInsets.symmetric(horizontal: 12),
                        width: double.infinity,
                        child:CupertinoButton.filled(
                            child: const Text("Changer la photo"),
                            onPressed: () async {
                              final form = formKey.currentState!;
                              if(form.validate()){
                                String? newPicture = await updatePicture(pictureURI);
                                Navigator.pop(context);
                              }
                            }
                        )
                    )
                  ],
                ),
              ),
            )
          ],
        )
    );
  }
}