// import 'package:flutter/material.dart';
// import 'package:plug_in/ui/component/plug_in_appbar.dart';
// import 'package:plug_in/ui/component/plug_in_bottom_navigation_bar.dart';
// import 'package:plug_in/ui/component/plug_in_drawer.dart';
// import 'package:plug_in/ui/component/plug_in_route_preview.dart';
// import 'package:plug_in/provider/member_test_provider.dart';
// import 'package:plug_in/ui/component/plug_in_container.dart';
// import 'package:provider/provider.dart';
//
// import '../../provider/member_provider.dart';
// import '../component/plug_in_text.dart';
//
// class MainView extends StatelessWidget {
//   const MainView({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       extendBodyBehindAppBar: true,
//       appBar: PlugInAppBar(title: "Plug In"),
//       endDrawer: PlugInDrawer(),
//       body: SafeArea(
//         child: Column(
//           children: [
//             // _appBar(),
//             Flexible(
//               fit: FlexFit.tight,
//               child: _main(context),
//             ),
//           ],
//         ),
//       ),
//       bottomNavigationBar: PlugInBottomNavigationBar(),
//     );
//   }
//
//   Widget _main(BuildContext context) {
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         _profilePreview(),
//         _routePreviewListView(context),
//         _mapButton(),
//       ],
//     );
//   }
//
//   Widget _appBar() {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Text(
//             "Plug In",
//             style: TextStyle(fontSize: 40.0, fontWeight: FontWeight.w800),
//           ),
//           Icon(
//             Icons.menu,
//             size: 30.0,
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget _profilePreview() {
//     return Consumer<MemberProvider>(
//       builder: (context, memberProvider, child) => Column(
//         children: [
//           Padding(
//             padding: const EdgeInsets.only(top: 10.0),
//             child: PlugInContainer(
//               height: 200.0,
//               child: Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                   children: [
//                     Row(
//                       children: [
//                         const PlugInContainer(
//                           child: Center(
//                             child: PlugInText(
//                               "😀",
//                               fontSize: 30.0,
//                             ),
//                           ),
//                           height: 50.0,
//                           width: 50.0,
//                           color: Colors.white,
//                           useShadow: false,
//                         ),
//                         Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             PlugInText(
//                               memberProvider.member.name,
//                               fontSize: 25.0,
//                               color: Color(0xff205513),
//                               fontWeight: FontWeight.bold,
//                             ),
//                             PlugInText(
//                               memberProvider.member.address,
//                               fontSize: 12.0,
//                               color: Color(0xff205513),
//                             )
//                           ],
//                         ),
//                       ],
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Column(
//                             children: [
//                               PlugInText(
//                                 memberProvider.member.sum.toStringAsFixed(1) +
//                                     "km",
//                                 fontSize: 15.0,
//                                 color: Color(0xff205513),
//                               ),
//                               PlugInText(
//                                 "지금까지",
//                                 fontSize: 15.0,
//                                 color: Color(0xff205513),
//                               )
//                             ],
//                           ),
//                           Column(
//                             children: [
//                               PlugInText(
//                                 memberProvider.member.today.toStringAsFixed(1) +
//                                     "km",
//                                 fontSize: 15.0,
//                                 color: Color(0xff205513),
//                               ),
//                               PlugInText(
//                                 "오늘",
//                                 fontSize: 15.0,
//                                 color: Color(0xff205513),
//                               )
//                             ],
//                           ),
//                           Column(
//                             children: [
//                               PlugInText(
//                                 memberProvider.member.avg.toStringAsFixed(1) +
//                                     "km",
//                                 fontSize: 15.0,
//                                 color: Color(0xff205513),
//                               ),
//                               PlugInText(
//                                 "평균",
//                                 fontSize: 15.0,
//                                 color: Color(0xff205513),
//                               )
//                             ],
//                           )
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               color: const Color(0xFFABF55D),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget _routePreviewListView(BuildContext context) {
//     return Container(
//       height: 390.0,
//       child: ListView.builder(
//         shrinkWrap: true,
//         itemCount: 3,
//         scrollDirection: Axis.horizontal,
//         itemBuilder: (BuildContext context, int index) {
//           return GestureDetector(
//             onTap: () {
//               Navigator.of(context).push(
//                 PageRouteBuilder(
//                   opaque: false,
//                   transitionDuration: const Duration(milliseconds: 200),
//                   reverseTransitionDuration: const Duration(milliseconds: 200),
//                   pageBuilder: (context, animation, secondaryAnimation) {
//                     return Scaffold(
//                       backgroundColor: Colors.black12.withOpacity(0.2),
//                       body: GestureDetector(
//                         onTap: () {
//                           Navigator.of(context).pop();
//                         },
//                         child: PlugInContainer(
//                           height: 100.0,
//                           child: Center(
//                             child: Text("hi"),
//                           ),
//                           color: Colors.purple,
//                         ),
//                       ),
//                     );
//                   },
//                   transitionsBuilder:
//                       (context, animation, secondaryAnimation, child) {
//                     const _begin = Offset(1.0, 0.0);
//                     const _end = Offset.zero;
//                     const _curve = Curves.ease;
//                     final _tween = Tween(begin: _begin, end: _end)
//                         .chain(CurveTween(curve: _curve));
//                     return SlideTransition(
//                       position: animation.drive(_tween),
//                       child: child,
//                     );
//                   },
//                 ),
//               );
//             },
//             child: PlugInRoutePreview(
//                 backGroundColor: Colors.blueGrey, middleColor: Colors.blue),
//           );
//         },
//       ),
//     );
//   }
//
//   Widget _mapButton() {
//     return GestureDetector(
//       onTap: () {},
//       child: Stack(
//         children: [
//           PlugInContainer(
//             height: 70.0,
//             color: const Color(0xFFABF55D),
//             child: Center(
//               child: Text(
//                 "Go Plogging",
//                 style: TextStyle(
//                     color: Color(0xff205513),
//                     fontWeight: FontWeight.w600,
//                     fontSize: 15.0),
//               ),
//             ),
//           ),
//           Positioned(
//             right: 15.0,
//             top: 10.0,
//             child: GestureDetector(
//               onVerticalDragStart: (DragStartDetails d) {
//                 print("drag...");
//               },
//               child: PlugInContainer(
//                 height: 50.0,
//                 width: 50.0,
//                 color: Colors.white,
//                 child: Icon(Icons.keyboard_arrow_right_rounded),
//                 useShadow: false,
//               ),
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }
