import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';




class MessageScreen extends StatelessWidget {
  const MessageScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: (){Navigator.pop(context);}, icon: Icon(Icons.arrow_back),color: Colors.white,),
        title: Text(
          'Notify Message',
          style: TextStyle(
            color: Colors.white
          ),
        ),
        centerTitle: true,
      ),
    );

  }

}



