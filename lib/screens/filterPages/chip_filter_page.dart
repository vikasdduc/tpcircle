//import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FilterChipPage extends StatefulWidget {
  const FilterChipPage({Key? key}) : super(key: key);

  @override
  State<FilterChipPage> createState() => _FilterChipPageState();
}

class _FilterChipPageState extends State<FilterChipPage> {
  int _selectedIndex = 0;
  int _selectedCategoryIndex = -1;
  String _selectedUserType = "Maid";
  PageController pageController = PageController();
  List vehicleList = ["Maid", "Driver", "Engineer", "Gardener", "Pilot"];
  List data = [
    {
      "name": "Sachin Rajput",
      "profilePic":
      "https://lh3.googleusercontent.com/a-/AAuE7mCfQn-gP_FJZUUU4GC4aSU1km9t_e5PL6zsV-NwdA=k-s48",
      "category": ["Maid", "Engineer"],
      "rating": 5,
      "bg": Colors.red
    },
    {
      "name": "Sachin Tendulkar",
      "profilePic":
      "https://lh3.googleusercontent.com/a-/AAuE7mCfQn-gP_FJZUUU4GC4aSU1km9t_e5PL6zsV-NwdA=k-s48",
      "category": ["Gardener", "Pilot", "Engineer"],
      "rating": 5,
      "bg": Colors.amberAccent
    }
  ];
  List filteredData = [];

  void onTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    pageController.jumpToPage(index);
  }

  void tappedCategory(int index) {
    _selectedCategoryIndex = index;
    _selectedUserType = vehicleList[index];
    _filterData();
  }

  @override
  void initState() {
    super.initState();
    _filterData();
  }

  _filterData() {
    filteredData = _selectedCategoryIndex >= 0
        ? data.where((element) => element["category"].contains(_selectedUserType)).toList()
        : data;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List<Widget>.generate(
                    vehicleList.length, // place the length of the array here
                        (int index) {
                      return Container(
                        margin: const EdgeInsets.all(2.0),
                        child: GestureDetector(
                          onTap: () {
                            tappedCategory(index);
                          },
                          child: Chip(
                              label: Text(vehicleList[index])
                          ),
                        ),
                      );
                    }).toList(),
              ),
            ),
            Expanded(
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: filteredData.length,
                itemBuilder: (context, index) {
                  var item = filteredData[index];
                  return Container(
                    width: 180.0,
                    color: item['bg'],
                    child: Center(
                      child: Text(item["name"].toString()),
                    ),
                  );
                },
                // This next line does the trick.
              ),
            ),
          ]
      ),
    );
        // bottomNavigationBar: BottomNavigationBar(
        //   items: const <BottomNavigationBarItem>[
        //     BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        //     BottomNavigationBarItem(
        //         icon: Icon(Icons.cleaning_services), label: 'House Keeping'),
        //     BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
        //     BottomNavigationBarItem(
        //         icon: Icon(Icons.account_balance_wallet), label: 'Wallet'),
        //     BottomNavigationBarItem(
        //         icon: Icon(Icons.bookmarks), label: 'Bookmarked'),
        //     BottomNavigationBarItem(
        //         icon: Icon(Icons.local_convenience_store), label: 'Store'),
        //     BottomNavigationBarItem(
        //         icon: Icon(Icons.notifications), label: 'Notifications'),
        //     BottomNavigationBarItem(
        //         icon: Icon(Icons.assessment), label: 'Notifications'),
        //     BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        //   ],
        //   currentIndex: _selectedIndex,
        //   selectedItemColor: Colors.blue,
        //   unselectedItemColor: Colors.grey,
        //   onTap: onTapped,
        // )

  }
}
