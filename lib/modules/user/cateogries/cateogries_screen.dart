import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:furniture_store/layout/cubit/cubit.dart';
import 'package:furniture_store/layout/cubit/states.dart';
import 'package:furniture_store/shared/component/component.dart';


class CateogriesScreen extends StatelessWidget {
  CateogriesScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
         body:ListView.separated(
           itemBuilder: (context,index)=>buildCatItem( ),
           separatorBuilder: (context,index)=>myDivider(),
           itemCount: 15,
         ),

        );
      },
    );
  }

}

Widget buildCatItem() => Padding(
  padding: const EdgeInsets.all(20.0),
  child: Row(
    children: [
      Image(
        image: NetworkImage(
          'https://images.unsplash.com/photo-1555041469-a586c61ea9bc?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8ZnVybml0dXJlfGVufDB8fDB8fA%3D%3D&w=1000&q=80',
        ),
        width: 80.0,
        height: 80.0,
        fit: BoxFit.cover,
      ),
      SizedBox(width: 20.0,),
      Text(
        'Bad Room',
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold
        ),
      ),
      Spacer(),
      Icon(Icons.arrow_forward_ios,
      ),

    ],
  ),
);


