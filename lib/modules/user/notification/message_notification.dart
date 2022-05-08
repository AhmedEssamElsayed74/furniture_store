import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'package:furniture_store/shared/component/component.dart';




class MessageScreen extends StatelessWidget {
  const MessageScreen({Key? key}) : super(key: key);

Widget BuildMessage(context)
{
  return Scaffold(
    appBar: AppBar(
      leading: IconButton(onPressed: (){Navigator.pop(context);}, icon: Icon(Icons.arrow_back),color: Colors.white,),
      title: const Text(
        'Notify Message',
        style: TextStyle(
            color: Colors.white
        ),
      ),
      centerTitle: true,
    ),
  );

}

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(

        body:
        OfflineBuilder(
            connectivityBuilder: (
                BuildContext context,
                ConnectivityResult connectivity,
                Widget child,
                ) {
              final bool connected = connectivity != ConnectivityResult.none;
              if(connected){
                return BuildMessage(context);
              }else
              {
                return BuildNoInternetWidget();
              }
            },
            child: const Center(child: CircularProgressIndicator(),)
        )
    );
  }

}



