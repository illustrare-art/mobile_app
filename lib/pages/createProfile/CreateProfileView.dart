import 'package:flutter/material.dart';
import 'package:illustrare/components/ImageAdaptor.dart';
import 'package:illustrare/models/StreamListenableBuilder.dart';
import 'package:illustrare/network/BaseResponse.dart';

import "./CreateProfileBloc.dart";

class CreateProfile extends StatefulWidget {
  static String id = "/CreateProfile";

  @override
  _CreateProfileState createState() => _CreateProfileState();
}

class _CreateProfileState extends State<CreateProfile> {
  var photoUrl;
  String? errorMessage;

  @override
  Widget build(BuildContext context) {
    return StreamListenableBuilder<BaseResponse>(
        stream: bloc.subject.stream,
        listener: (value) {
          if (value != null) {
            if (value.success) {
              Navigator.popAndPushNamed(context, "/Feed");
            } else {
              // TODO: Handle Error
            }
          }
        },
        builder: (context, AsyncSnapshot<BaseResponse> snapshot) {
          if (snapshot.data != null)
            return _buildScreen(snapshot.data!.message);
          else
            return _buildScreen(null);
        });
  }

  @override
  void initState() {
    super.initState();
    bloc
        .getUser()
        .then((user){
          setState(() {
            photoUrl = user.photoUrl;
          });
    });

  }

  Widget _buildScreen(String? errorMessage) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: Color(0xFFF4ECFF),
        body: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          Container(
              margin: EdgeInsets.only(top: 48),
              child: Center(
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(128),
                      child: ImageAdaptor(
                          imagePath: photoUrl, width: 256, height: 256)))),
          InkWell(
              onTap: () async {
                var image = await bloc.pickPhoto();
                this.setState(() {
                  photoUrl = image;
                });

              },
              child: Container(
                  margin: EdgeInsets.only(top: 16),
                  child: RichText(
                      text: TextSpan(
                    text: "Edit Your Profile Photo",
                    style: TextStyle(
                        color: Color(0xFF00C89B),
                        fontSize: 16,
                        fontWeight: FontWeight.w700),
                  )))),
          Container(
              margin: EdgeInsets.only(top: 48),
              width: screenWidth * .9,
              child: TextField(
                decoration: InputDecoration(labelText: 'Username'),
                onChanged: (text) {
                  bloc.userName = text;
                },
              )),
          Container(
              margin: EdgeInsets.only(top: 32),
              width: screenWidth * .9,
              child: TextField(
                decoration: InputDecoration(labelText: 'Phone Number'),
                onChanged: (text) {
                  bloc.phoneNumber = text;
                },
              )),
          Container(
              margin: EdgeInsets.only(top: 32),
              child: TextButton(
                  onPressed: () async {
                    await bloc.onCreateProfileClicked();
                  },
                  style: TextButton.styleFrom(
                      backgroundColor: Color(0xFF00C89B),
                      padding:
                          EdgeInsets.symmetric(horizontal: 32, vertical: 8),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      )),
                  child: Text("Start",
                      style: TextStyle(fontSize: 32, color: Colors.white))))
        ]));
  }
}
