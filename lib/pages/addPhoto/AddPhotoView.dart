import 'package:flutter/material.dart';
import 'package:illustrare/components/BottomBar.dart';
import 'package:illustrare/models/AppUserModel.dart';
import 'package:illustrare/models/StreamListenableBuilder.dart';
import 'package:illustrare/network/BaseResponse.dart';
import 'package:illustrare/pages/addPhoto//AddPhotoBloc.dart';



class AddPhotoView extends StatefulWidget {
  const AddPhotoView({Key? key}) : super(key: key);
  static String id = "/AddPhoto";

  _AddPhotoViewState createState() => _AddPhotoViewState();


}

class _AddPhotoViewState extends State<AddPhotoView>{

  @override
  Widget build(BuildContext context) {

    return StreamListenableBuilder<BaseResponse>(
        stream: bloc.subject.stream,
        listener: (value) {

        },
        builder: (context, AsyncSnapshot<BaseResponse> snapshot){
          return _buildNoUser(context);
        });
  }

  redirect(AppUserModel? user){
    if(user != null){
      if(user.userId != null){
        if(user.userName != null) Navigator.popAndPushNamed(this.context,"/FeedPage");
        else Navigator.popAndPushNamed(this.context,"/CreateProfile");
      }
    }
  }

  @override
  initState() {
    super.initState();
  }

  Widget _buildNoUser(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomBar(),
      floatingActionButton: FloatingActionButton(
        elevation: 4.0,
        backgroundColor: Color(0xFFFF605C),
        child:Icon(Icons.close,color:Color(0xFFF4ECFF) ),
        onPressed: () {
          if(Navigator.canPop(context)) Navigator.pop(context);
          else Navigator.popAndPushNamed(context, "/Feed");
        },
      ),
      floatingActionButtonLocation:
      FloatingActionButtonLocation.centerDocked,
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              InkWell(
                child: Container(
                    margin:EdgeInsets.only( top:96),

                    width:240,
                    height:240,
                    child:Placeholder(
                      color:Color(0XFF161853),
                    )),
                onTap: () {
                  // TODO: Handle Select image
                  print("Click event on Container");
                },
              )
              ,
              Container(
                  margin:EdgeInsets.only( top:48),
                  width:320,
                  child:TextField(
                    decoration: InputDecoration(labelText: 'Name'),
                    onChanged: (text) {
                      bloc.name = text;
                    },

                  )
              ),
              Container(
                  margin:EdgeInsets.only( top:24),
                  width:320,
                  child:TextField(
                    strutStyle: StrutStyle(
                      height:4
                    ),
                    decoration: InputDecoration(labelText: 'Description'),
                    onChanged: (text) {
                      bloc.description = text;
                    },

                  )
              ),
              Container(
                  margin:EdgeInsets.only( top:24),
                  height:64,
                  width:160,
                  child:TextButton(
                      onPressed: () async {
                        // TODO: Handle upload to image.
                      },
                      style:TextButton.styleFrom(
                          backgroundColor: Color(0xFF00C89B),
                          padding: EdgeInsets.symmetric(horizontal: 32, vertical: 8),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),

                          )),
                      child:Text(
                          "Post",
                          style: TextStyle(fontSize:32,color:Colors.white)
                      ))

              )
              ],

            )
        )
      );
  }
}