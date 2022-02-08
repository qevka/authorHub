// import 'package:cloudwatch/app/modules/weather/controllers/weather_controller.dart';
// import 'package:cloudwatch/app/routes/app_pages.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
// class SearchField extends StatelessWidget {
//   TextEditingController editControl = TextEditingController();
//   String value = "";
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.fromLTRB(30, 10, 20, 20),
//       child: Row(
//         children: [
//           Container(
//             decoration: BoxDecoration(
//               color: Colors.black12,
//               border: Border.all(
//                   color: Colors.white, // set border color
//                   width: 1.0), // set border width
//               borderRadius: BorderRadius.all(Radius.circular(10.0)), // set rounded corner radius
//             ),
//             child: Padding(
//               padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Container(
//                     width: Get.width - 200,
//                     child: TextField(
//                       style: TextStyle(color: Colors.white),
//                       decoration: InputDecoration(
//                           fillColor: Colors.white,
//                           border: InputBorder.none,
//                           hintText: "City",
//                           hintStyle: TextStyle(color: Colors.white, fontWeight: FontWeight.w200)),
//                       controller: editControl,
//                       onChanged: (val) {
//                         value = val;
//                       },
//                     ),
//                   ),
//                   SizedBox(
//                     width: 10,
//                   ),
//                   IconButton(
//                     iconSize: 30,
//                     onPressed: () {
//                       Get.find<WeatherController>().search(value);
//                     },
//                     icon: Icon(Icons.search_outlined),
//                     color: Colors.white,
//                   )
//                 ],
//               ),
//             ),
//           ),
//           IconButton(
//               onPressed: () {
//                 Get.toNamed(Routes.SETTINGS);
//               },
//               icon: Icon(
//                 Icons.settings,
//                 color: Colors.white,
//               ))
//         ],
//       ),
//     );
//   }
// }
