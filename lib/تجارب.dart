// import 'package:carousel_slider/carousel_options.dart';
// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:furniture_store/layout/cubit/cubit.dart';
// import 'package:furniture_store/layout/cubit/states.dart';
// import 'package:furniture_store/modules/user/item/item_screen.dart';
// import 'package:furniture_store/shared/component/component.dart';
// import 'package:furniture_store/shared/style/color.dart';
//
//
// class ProductScreen extends StatefulWidget {
//   const ProductScreen({Key? key}) : super(key: key);
//
//   @override
//   State<ProductScreen> createState() => _ProductScreenState();
// }
//
// class _ProductScreenState extends State<ProductScreen> {
//   List items =
//   [
//     'https://i.pinimg.com/736x/79/11/b9/7911b9cac1f574e675d4b5d3903207e6.jpg',
//     'https://i.pinimg.com/564x/db/51/95/db519529496b547c93d1ad8b230559b0.jpg',
//     'https://d13r0hznkpv24o.cloudfront.net/media/catalog/product/cache/74cf99c86332999c0c5bbe50aaa1b73c/l/e/lego_5_1.png',
//     'https://i.pinimg.com/originals/ac/43/f5/ac43f531373013c83d1af9a3fddc931e.jpg',
//     'https://i.pinimg.com/564x/79/d3/4e/79d34ee3f5dc45477308641955db6117.jpg',
//
//   ];
//
//   List categoriesItems = [
//     'Bed Room',
//     'Kids Room',
//     'Dining Room',
//     'Living Room',
//     'Salon',
//     'Kitchen',
//     'Offices',
//     'Antiques',
//     'Carpets',
//     'Lighting',
//     'Chairs',
//     'Curtains',
//     'Table',
//     'Out door',
//     'Appliances',
//   ];
//
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocConsumer<ShopCubit, ShopStates>(
//       listener: (context, state) {},
//       builder: (context, state) {
//         return Scaffold(
//
//           body: SingleChildScrollView(
//             physics: BouncingScrollPhysics(),
//             child: Padding(
//               padding: const EdgeInsets.all(20.0),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children:
//                 [
//                   CarouselSlider(
//                     items:
//                     //  Image(
//                     //   image: NetworkImage('https://images.unsplash.com/photo-1555041469-a586c61ea9bc?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8ZnVybml0dXJlfGVufDB8fDB8fA%3D%3D&w=1000&q=80'),
//                     //   width: double.infinity,
//                     //   fit: BoxFit.cover,
//                     // ),
//                     items
//                         .map((image) =>
//                         Builder(
//                           builder: (BuildContext context) {
//                             return Container(
//                               decoration: BoxDecoration(
//                                 image: DecorationImage(
//                                   image: NetworkImage(image),
//                                   fit: BoxFit.fill,
//                                 ),
//                               ),
//                             );
//                           },
//                         ))
//                         .toList(),
//
//
//                     options: CarouselOptions(
//                       height: 250.0,
//                       initialPage: 0,
//                       enableInfiniteScroll: true,
//                       viewportFraction: 1,
//                       reverse: false,
//                       autoPlay: true,
//                       autoPlayInterval: Duration(seconds: 3),
//                       autoPlayAnimationDuration: Duration(seconds: 1),
//                       autoPlayCurve: Curves.fastLinearToSlowEaseIn,
//                       scrollDirection: Axis.horizontal,
//                     ),
//                   ),
//                   SizedBox(height: 15.0,),
//
//                   Text('Categories',
//                     style: TextStyle(
//                       fontSize: 24,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   SizedBox(height: 10,),
//                   Container(
//                     height: 60,
//                     child: ListView.separated(
//                       physics: BouncingScrollPhysics(),
//                       shrinkWrap: true,
//                       scrollDirection: Axis.horizontal,
//                       itemBuilder: (context, index) => Container(
//                         width: 100,
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadiusDirectional.circular(50.0,),
//                           color: Colors.grey[350],
//
//                         ),
//                         child: TextButton(onPressed: () {
//                           navigateto(context, ItemScreen(categoriesItems[index]),);
//                         }, child:
//                         Text('${categoriesItems[index]}',
//                           style: TextStyle(
//                             color: Colors.black,
//                           ),
//                         ),
//                         ),
//
//                       ),
//                       separatorBuilder: (context, index) => SizedBox(width: 5.0,),
//                       itemCount: categoriesItems.length,
//
//                     ),
//                   ),
//
//                   SizedBox(height: 10.0,),
//
//                   Center(
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.center,
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: const [
//                         Image(
//                           image: NetworkImage(
//                             'https://75324b7afe1a238e9728-48cce035978395103897a6b442a94265.lmsin.net/163641874-163641874-HC27062021_02-750-1.jpg?v=1',
//                           ),
//                           height: 180,
//                           width: 300,
//                           fit: BoxFit.fill,
//                         ),
//                         SizedBox(height: 10.0,),
//                         Image(
//                           image: NetworkImage(
//                             'https://homzmart.com/s3/catalog/product/5/8/58_1_copy_.png',
//                           ),
//                           height: 180,
//                           width: 300,
//                           fit: BoxFit.cover,
//                         ),
//                         SizedBox(height: 10.0,),
//                         Image(
//                           image: NetworkImage(
//                             'https://i.pinimg.com/564x/f6/89/b0/f689b08547d7d3d76ddee839e217a195.jpg',
//                           ),
//                           height: 180,
//                           width: 300,
//                           fit: BoxFit.fill,
//                         ),
//                         SizedBox(height: 10.0,),
//                         Image(
//                           image: NetworkImage(
//                             'https://75324b7afe1a238e9728-48cce035978395103897a6b442a94265.lmsin.net/162981135-162981135-HC22042021_01-750-1.jpg',
//                           ),
//                           height: 180,
//                           width: 300,
//                           fit: BoxFit.fill,
//                         ),
//                         SizedBox(height: 10.0,),
//                         Image(
//                           image: NetworkImage(
//                             'https://homzmart.com/s3/catalog/product/0/1/0145.jpg',
//                           ),
//                           height: 200,
//                           width: 300,
//                           fit: BoxFit.cover,
//                         ),
//
//
//
//                       ],
//                     ),
//                   ),
//
//                   SizedBox(height: 30.0,),
//
//
//
//
//
//
//
//                 ],
//               ),
//             ),
//           ),
//         );
//       },
//     );
//   }
//
//
// }
//

/////////////////////////////////////////////////////////////////////////////////////////////////////////////
////cartscreen//////
//
// import 'package:flutter/material.dart';
// import 'package:furniture_store/shared/component/component.dart';
//
//
// class DetailsScreen extends StatelessWidget {
//   const DetailsScreen({Key? key}) : super(key: key);
//
//
//   @override
//   Widget build(BuildContext context)
//   {
//     return  Scaffold(
//       backgroundColor: Colors.white,
//       body: CustomScrollView(
//         physics: const BouncingScrollPhysics(),
//         slivers:
//         [
//           buildSliverAppBar(),
//           SliverList(delegate: SliverChildListDelegate(
//             [
//               Container(
//                 padding: EdgeInsets.all(15),
//
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children:
//                   [
//
//                     const Text('Galaxy Metal Floor Lamp',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
//                     const SizedBox(height: 10,),
//                     const Text('For elegant home settings, this contemporary floor lamp is a fitting choice. Comprising of six bulb shades in a spherical shape, this item is electric-powered. When switched on, this impressive lamp radiates a soothing light that is pleasant for the eyes. Furthermore, you can retain its look for a long time with a regular wipe clean',
//                       maxLines: 8,
//                       overflow: TextOverflow.ellipsis,
//                     ),
//                     const SizedBox(height: 15,),
//                     myDivider(),
//                     const SizedBox(height: 15,),
//                     Row(
//
//                       children: const [
//                         Text('Size :',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),), SizedBox(width: 10,),
//                         Text('180x520 cm'),
//                       ],
//                     ),
//                     const SizedBox(height: 15,),
//                     myDivider(),
//                     const SizedBox(height: 15,),
//                     Row(
//
//                       children: const [
//                         Text('Price :',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),), SizedBox(width: 10,),
//                         Text('1250 EGP'),
//                       ],
//                     ),
//                     const SizedBox(height: 15,),
//                     myDivider(),
//                     const SizedBox(height: 15,),
//                     Row(
//
//                       children: const [
//                         Text('Color :',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),), SizedBox(width: 10,),
//                         Text('Grey'),
//                       ],
//                     ),
//
//
//
//                   ],
//                 ),
//               ),
//             ],
//           ),
//           ),
//         ],
//
//       ),
//     );
//   }
//
// }
//
// Widget buildSliverAppBar() {
//   return const SliverAppBar(
//     expandedHeight: 500,
//     pinned: true,
//     stretch: true,
//     backgroundColor: Colors.white,
//     flexibleSpace: FlexibleSpaceBar(
//       background: Image(
//         image: NetworkImage(
//           'https://75324b7afe1a238e9728-48cce035978395103897a6b442a94265.lmsin.net/163641874-163641874-HC27062021_02-750-1.jpg?v=1',
//         ),
//         fit: BoxFit.fill,
//       ),
//     ),
//   );
// }

// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:furniture_store/layout/cubit/cubit.dart';
// import 'package:furniture_store/layout/cubit/states.dart';
// import 'package:furniture_store/modules/user/checkout/checkout.dart';
// import 'package:furniture_store/shared/component/component.dart';
// import 'package:furniture_store/shared/style/color.dart';
// import 'package:hexcolor/hexcolor.dart';
//
// class CartScreen extends StatefulWidget {
//   const CartScreen({Key? key}) : super(key: key);
//
//   @override
//   State<CartScreen> createState() => _CartScreenState();
// }
//
// class _CartScreenState extends State<CartScreen> {
//   var Itemnum = [5, 2];
//   int totalprice = 0;
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocConsumer<ShopCubit, ShopStates>(
//       listener: (context, state) {},
//       builder: (context, state) {
//         return Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 15.0),
//           child: Column(
//             children: [
//               Expanded(
//                 child: ListView.separated(
//                   itemBuilder: (context, index) => Container(
//                     height: 200,
//                     child: Card(
//                       elevation: 10,
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.start,
//                         crossAxisAlignment: CrossAxisAlignment.center,
//                         children: [
//                           const Image(
//                             image: NetworkImage(
//                               'https://75324b7afe1a238e9728-48cce035978395103897a6b442a94265.lmsin.net/163641874-163641874-HC27062021_02-750-1.jpg?v=1',
//                             ),
//                             width: 150,
//                             height: 150,
//                             fit: BoxFit.cover,
//                           ),
//                           const SizedBox(
//                             width: 15,
//                           ),
//                           Expanded(
//                             child: Column(
//                               mainAxisAlignment: MainAxisAlignment.start,
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 const SizedBox(
//                                   height: 30,
//                                 ),
//                                 const Text(
//                                   'Galaxy Metal Floor Lamp ',
//                                   maxLines: 1,
//                                   overflow: TextOverflow.ellipsis,
//                                   style: TextStyle(
//                                     height: 1.1,
//                                   ),
//                                 ),
//                                 const SizedBox(
//                                   height: 20.0,
//                                 ),
//                                 const Text(
//                                   '25x96x100 cm',
//                                   style: TextStyle(
//                                     color: defaultcolor,
//                                     fontWeight: FontWeight.bold,
//                                   ),
//                                 ),
//                                 SizedBox(
//                                   height: 15,
//                                 ),
//                                 Row(
//                                   mainAxisAlignment: MainAxisAlignment.start,
//                                   crossAxisAlignment: CrossAxisAlignment.center,
//                                   children: [
//                                     IconButton(
//                                       padding: EdgeInsets.zero,
//                                       onPressed: () {
//                                         setState(() {
//                                           Itemnum[0]++;
//                                         });
//                                       },
//                                       icon: const Icon(
//                                         Icons.add,
//                                         color: Colors.grey,
//                                       ),
//                                     ),
//                                     Text('${Itemnum[0]}'),
//                                     IconButton(
//                                       padding: EdgeInsets.zero,
//                                       onPressed: () {
//                                         setState(() {
//                                           if (Itemnum[0] > 1) {
//                                             Itemnum[0]--;
//                                           } else {}
//                                         });
//                                       },
//                                       icon: const Icon(
//                                         Icons.remove,
//                                         color: Colors.grey,
//                                       ),
//                                     ),
//                                     Spacer(),
//                                     IconButton(
//                                       onPressed: () {
//                                         var alert = AlertDialog(
//                                             title: const Text(
//                                               'Are you sure you want delete?',
//                                               style: TextStyle(
//                                                 fontSize: 16.0,
//                                               ),
//                                             ),
//                                             content: SizedBox(
//                                               height: 30,
//                                               child: Container(
//                                                 color: Colors.white,
//                                                 width: 200,
//                                                 child: Row(
//                                                   children: [
//                                                     Padding(
//                                                       padding: EdgeInsets.only(
//                                                           left: 10.0),
//                                                       child: TextButton(
//                                                           onPressed: () {},
//                                                           child: const Text(
//                                                             'Yes',
//                                                             style: TextStyle(
//                                                               fontWeight:
//                                                                   FontWeight
//                                                                       .bold,
//                                                               fontSize: 14,
//                                                               color:
//                                                                   Colors.blue,
//                                                             ),
//                                                           )),
//                                                     ),
//                                                     Spacer(),
//                                                     TextButton(
//                                                         onPressed: () {},
//                                                         child: const Text(
//                                                           'No',
//                                                           style: TextStyle(
//                                                             fontWeight:
//                                                                 FontWeight.bold,
//                                                             fontSize: 14,
//                                                             color: Colors.red,
//                                                           ),
//                                                         )),
//                                                   ],
//                                                 ),
//                                               ),
//                                             ));
//                                         showDialog(
//                                             context: context,
//                                             builder: (context) => alert);
//                                       },
//                                       icon: Icon(
//                                         Icons.delete,
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                   separatorBuilder: (context, index) => SizedBox(height: 20),
//                   itemCount: 10,
//                   shrinkWrap: true,
//                 ),
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   Expanded(
//                     child: Container(
//                       padding: EdgeInsets.symmetric(horizontal: 15),
//                       child: Text(
//                         'Total Price ' +
//                             (totalprice + Itemnum[0] * 2000).toString(),
//                         style: TextStyle(
//                           fontSize: 18,
//                           fontWeight: FontWeight.bold,
//                           color: Colors.black,
//                         ),
//                       ),
//                     ),
//                   ),
//                   MaterialButton(
//                     onPressed: () {},
//                     child: Text('checkout',style: TextStyle(color: Colors.white),),
//                     color: HexColor('#087083'),
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(15),
//                     ),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         );
//       },
//     );
//   }
// }


///////////////////////////

// bottomNavigationBar: BottomNavigationBar(
// currentIndex: ShopCubit.get(context).currentindex,
// onTap: (value) => ShopCubit.get(context).ChangeBottom(value),
// items: const [
// BottomNavigationBarItem(
// icon: Icon(
// Icons.home,
// ),
// label: 'Home',
// ),
// BottomNavigationBarItem(
// icon: Icon(
// Icons.linked_camera_outlined,
// ),
// label: '3D',
// ),
// BottomNavigationBarItem(
// icon: Icon(
// Icons.favorite_outline_rounded,
// ),
// label: 'Favourites',
// ),
// BottomNavigationBarItem(
// icon: Icon(
// Icons.person,
// ),
// label: 'Profile',
// ),
// ],


import 'package:flutter/material.dart';
import 'package:flutter_offline/flutter_offline.dart';

class DemoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Offline Demo"),
      ),
      body: OfflineBuilder(
        connectivityBuilder: (
            BuildContext context,
            ConnectivityResult connectivity,
            Widget child,
            ) {
          final bool connected = connectivity != ConnectivityResult.none;
          return new Stack(
            fit: StackFit.expand,
            children: [
              Positioned(
                height: 24.0,
                left: 0.0,
                right: 0.0,
                child: Container(
                  color: connected ? Color(0xFF00EE44) : Color(0xFFEE4400),
                  child: Center(
                    child: Text("${connected ? 'ONLINE' : 'OFFLINE'}"),
                  ),
                ),
              ),
              Center(
                child: new Text(
                  'Yay!',
                ),
              ),
            ],
          );
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text(
              'There are no bottons to push :)',
            ),
            new Text(
              'Just turn off your internet.',
            ),
          ],
        ),
      ),
    );
  }
}




