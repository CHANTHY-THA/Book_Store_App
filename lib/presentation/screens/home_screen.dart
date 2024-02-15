// import 'package:flutter/material.dart';
// import 'package:test/presentation/navigation/navigation_items.dart';

// class HomeScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Home'),
//       ),
//       body: ListView.builder(
//         itemCount: navigationItems.length,
//         itemBuilder: (context, index) {
//           final item = navigationItems[index];
//           return ListTile(
//             leading: Icon(item.icon),
//             title: Text(item.title),
//             onTap: () {
//               Navigator.pushNamed(context, item.route);
//             },
//           );
//         },
//       ),
//     );
//   }
// }

