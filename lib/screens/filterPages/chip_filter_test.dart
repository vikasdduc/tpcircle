// //import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:tyreplex/screens/rest_api_example/apiServices.dart';
// import 'package:tyreplex/screens/rest_api_example/json_model.dart';
//
// class FilterChipPage extends StatefulWidget {
//   const FilterChipPage({Key? key}) : super(key: key);
//
//   @override
//   State<FilterChipPage> createState() => _FilterChipPageState();
// }
//
// class _FilterChipPageState extends State<FilterChipPage> {
//   late List<userModel>? _userModel = [];
//   // int _selectedIndex = 0;
//   int _selectedCategoryIndex = -1;
//   String _selectedUserType = "Car";
//   PageController pageController = PageController();
//   List vehicleList = ["Car", "Bike", "Scooter", "Truck", "Truck/Bus"];
//   List data = [
//     {
//       "name": "Sachin Rajput",
//       "profilePic":
//       "https://lh3.googleusercontent.com/a-/AAuE7mCfQn-gP_FJZUUU4GC4aSU1km9t_e5PL6zsV-NwdA=k-s48",
//       "category": ["Car", "Scooter"],
//       "rating": 5,
//       "bg": Colors.red
//     },
//     {
//       "name": "Sachin Tendulkar",
//       "profilePic":
//       "https://lh3.googleusercontent.com/a-/AAuE7mCfQn-gP_FJZUUU4GC4aSU1km9t_e5PL6zsV-NwdA=k-s48",
//       "category": ["Truck", "Bike", "Scooter"],
//       "rating": 2,
//       "bg": Colors.amberAccent
//     },
//     {
//       "name": "Mahipal pandit",
//       "profilePic":
//       "https://lh3.googleusercontent.com/a-/AAuE7mCfQn-gP_FJZUUU4GC4aSU1km9t_e5PL6zsV-NwdA=k-s48",
//       "category": ["Bike", "Scooter","Truck"],
//       "rating": 3,
//       "bg": Colors.pinkAccent
//     },
//   ];
//   //List filteredData = [];
//
//   // void onTapped(int index) {
//   //   setState(() {
//   //     _selectedIndex = index;
//   //   });
//   //   pageController.jumpToPage(index);
//   // }
//
//   void _filterData() async{
//     _userModel = (await ApiService().getUsers());
//     _userModel = _selectedCategoryIndex >= 0
//         ? _userModel?.where((element) => element["category"].contains(_selectedUserType)).toList()//here is error because no list of category in api  "category": ["Bike", "Scooter","Truck"],
//         : _userModel;
//     Future.delayed(const Duration(seconds: 1)).then((value) => setState((){}));
//   }
//   void tappedCategory(int index) {
//     _selectedCategoryIndex = index;
//     _selectedUserType = vehicleList[index];
//     _filterData();
//   }
//
//   @override
//   void initState() {
//     super.initState();
//     _filterData();
//   }
//
//   // _filterData() {
//   //   filteredData = _selectedCategoryIndex >= 0
//   //       ? data.where((element) => element["category"].contains(_selectedUserType)).toList()
//   //       : data;
//   //   setState(() {});
//   // }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(),
//       body: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             SingleChildScrollView(
//               scrollDirection: Axis.horizontal,
//               child: Row(
//                 children: List<Widget>.generate(
//                     vehicleList.length, // place the length of the array here
//                         (int index) {
//                       return Container(
//                         margin: const EdgeInsets.all(2.0),
//                         child: GestureDetector(
//                           onTap: () {
//                             tappedCategory(index);
//                           },
//                           child: Chip(
//                               label: Text(vehicleList[index])
//                           ),
//                         ),
//                       );
//                     }).toList(),
//               ),
//             ),
//             SizedBox(
//               height: 100,
//               child: ListView.builder(
//                 scrollDirection: Axis.vertical,
//                 itemCount: _userModel?.length,
//                 itemBuilder: (context, index) {
//
//                   var item = _userModel![index];
//                   return Card(
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Text(item["name"].toString()
//                         ),
//                         Text(item["rating"].toString()),
//                       ],
//                     ),
//                   );
//                 },
//                 // This next line does the trick.
//               ),
//             ),
//           ]
//       ),
//     );
//     // bottomNavigationBar: BottomNavigationBar(
//     //   items: const <BottomNavigationBarItem>[
//     //     BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
//     //     BottomNavigationBarItem(
//     //         icon: Icon(Icons.cleaning_services), label: 'House Keeping'),
//     //     BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
//     //     BottomNavigationBarItem(
//     //         icon: Icon(Icons.account_balance_wallet), label: 'Wallet'),
//     //     BottomNavigationBarItem(
//     //         icon: Icon(Icons.bookmarks), label: 'Bookmarked'),
//     //     BottomNavigationBarItem(
//     //         icon: Icon(Icons.local_convenience_store), label: 'Store'),
//     //     BottomNavigationBarItem(
//     //         icon: Icon(Icons.notifications), label: 'Notifications'),
//     //     BottomNavigationBarItem(
//     //         icon: Icon(Icons.assessment), label: 'Notifications'),
//     //     BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
//     //   ],
//     //   currentIndex: _selectedIndex,
//     //   selectedItemColor: Colors.blue,
//     //   unselectedItemColor: Colors.grey,
//     //   onTap: onTapped,
//     // )
//
//   }
// }
