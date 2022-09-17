import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
//import 'package:tyreplex/screens/filterPages/filter_screen.dart';
import 'package:tyreplex/screens/myOrderPages/test_Screen_B.dart';
import 'package:tyreplex/screens/myOrderPages/test_screen_A.dart';
import 'package:tyreplex/screens/myOrderPages/test_screen_C.dart';

class MyOrdersPage extends StatefulWidget{
  const MyOrdersPage({Key? key}) : super(key: key);

  @override
  MyOrdersPageState createState() => MyOrdersPageState();
  }
class MyOrdersPageState extends State<MyOrdersPage >{
  int _counter = 0;
  bool showElevatedButtonBadge = true;
  int _selectedScreenIndex = 0;
  final List _orderScreens = [
    {"screen":  TestScreenA(), },
    {"screen":  TestScreenB(), },
    {"screen":  TestScreenC(), }
  ];

  void _selectScreen(int index) {
    setState(() {
      _selectedScreenIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        centerTitle: true,
        title: const Text('My Orders',style: TextStyle(fontSize: 20,color: Colors.white)),
        actions: [
          IconButton(
              onPressed: (){
                setState(() {
                  _counter++;
                }); // this will increase badge counter as of now
              },
              icon: const Icon(Icons.notifications_active_outlined,color: Colors.white,)),

          Badge(
            position: BadgePosition.topEnd(top: 0,end: 3),
            animationDuration: const Duration(milliseconds: 200),
            animationType: BadgeAnimationType.slide,
            badgeContent: Text(
              _counter.toString(),
              style: const TextStyle(color: Colors.white),
            ),
            badgeColor: Colors.green,
            child: IconButton(
                onPressed: (){
                  print("These are items in your cart");
                },
                icon: const Icon(Icons.shopping_cart,color: Colors.white,)),
          ),
                 ],

                    ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(top: 5.0),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children:  [
                  Card(
                    elevation: 5,
                    child: SizedBox(
                      height: 80,
                      width: 150,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: const [
                              Text('Earning in September',style: TextStyle(fontSize: 13,color: Colors.black38),),
                            ],
                          ),
                          const SizedBox(height: 6,),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  Text('₹ 000', style: TextStyle(fontSize: 17),),
                                  SizedBox(width: 6,),
                                  Text('0.0%', style: TextStyle(fontSize: 17, color: Colors.red, ),),
                                ],
                              ),


                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Card(elevation: 5,
                    child: SizedBox(
                      height: 80,
                      width: 120,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: const [
                              Text('Total Earning',style: TextStyle(fontSize: 13,color: Colors.black38),),
                            ],
                          ),
                          const SizedBox(height: 6,),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Text('₹ 000', style: TextStyle(fontSize: 17),),


                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Card(elevation: 5,
                    child: SizedBox(
                      height: 80,
                      width: 160,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: const [
                              Text('Earning in Previous month',style: TextStyle(fontSize: 13,color: Colors.black38),),
                            ],
                          ),
                          const SizedBox(height: 6,),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Text('₹ 000', style: TextStyle(fontSize: 17),),



                            ],
                          ),
                        ],
                      ),
                    ),
                  ),

                ],
              ),
            ),


          ),
          _orderScreens[_selectedScreenIndex]["screen"],
        ],
      ),
      drawer: Drawer(
        child: Column(

          children: [
            SizedBox(
              height: 140,
              child: UserAccountsDrawerHeader(
                decoration: const BoxDecoration(

                    color: Colors.red
                ),
                accountName: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text("Howdy Vikas "),
                    CircleAvatar(
                      radius: 32,
                      // backgroundColor:
                      // Theme.of(context).platform == TargetPlatform.iOS
                      //     ? Color(0xFF56ccf2)
                      //     : Colors.white,
                      child: Text("VK",

                        style: TextStyle(fontSize: 30,
                          // color: Colors.lightGreenAccent,
                        ),
                      ),
                    ),
                  ],
                ),
                accountEmail: const Text("1122334455"),
              ),
            ),
            Expanded(
                child: ListView(
                  children: [
                    ListTile(
                      title: const Text('Customer Orders',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                          )),
                      contentPadding: const EdgeInsets.fromLTRB(20, 0, 0, 5),
                      leading: const Icon(Icons.dashboard_customize_sharp,size: 25,),
                      onTap: () {
                        Navigator.of(context).pop();
                        // Navigator.of(context).push(MaterialPageRoute(
                        //     builder: (BuildContext context) => HomeScreen()));
                      },
                    ),
                    ListTile(
                      title: const Text('Buy Tyres',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                          )),
                      contentPadding: const EdgeInsets.fromLTRB(20, 5, 0, 5),
                      leading: const Icon(Icons.shopping_cart_outlined,size: 25,),
                      onTap: () {
                        Navigator.pushNamed(context, '/myFilterPage');
                        // Navigator.of(context).push(MaterialPageRoute(
                        //     builder: (BuildContext context) => HomeScreen()));
                      },

                    ),
                    ListTile(
                      title: const Text('Orders History',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                          )),
                      contentPadding: const EdgeInsets.fromLTRB(20, 5, 0, 5),
                      leading: const Icon(Icons.double_arrow_sharp,size: 25,),
                      onTap: () {
                        Navigator.of(context).pop();
                        // Navigator.of(context).push(MaterialPageRoute(
                        //     builder: (BuildContext context) => HomeScreen()));
                      },
                    ),
                    ListTile(
                      title: const Text('Create Customers Bill',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                          )),
                      contentPadding: const EdgeInsets.fromLTRB(20, 5, 0, 5),
                      leading: const Icon(Icons.padding,size: 25,),
                      onTap: () {
                        Navigator.of(context).pop();
                        // Navigator.of(context).push(MaterialPageRoute(
                        //     builder: (BuildContext context) => HomeScreen()));
                      },
                    ),
                    ListTile(
                      title: const Text('My Rewards',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                          )),
                      contentPadding: const EdgeInsets.fromLTRB(20, 5, 0, 5),
                      leading: const Icon(Icons.card_giftcard_outlined,size: 25,),
                      trailing: const Icon(Icons.arrow_right,
                        color: Colors.white,),
                      onTap: () {
                        Navigator.of(context).pop();
                        // Navigator.of(context).push(MaterialPageRoute(
                        //     builder: (BuildContext context) => HomeScreen()));
                      },
                    ),
                    ListTile(
                      title: const Text('Send SMS',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                          )),
                      contentPadding: const EdgeInsets.fromLTRB(20, 5, 0, 5),
                      leading: const Icon(Icons.notifications,size: 25,),
                      onTap: () {
                        Navigator.of(context).pop();
                        // Navigator.of(context).push(MaterialPageRoute(
                        //     builder: (BuildContext context) => HomeScreen()));
                      },
                    ),
                    ListTile(
                      title: const Text('Manage Inventory',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                          )),
                      contentPadding: const EdgeInsets.fromLTRB(20, 5, 0, 5),
                      leading: const Icon(Icons.inventory_rounded,size: 25,),
                      onTap: () {
                        Navigator.of(context).pop();
                        // Navigator.of(context).push(MaterialPageRoute(
                        //     builder: (BuildContext context) => HomeScreen()));
                      },
                    ),
                    ListTile(
                      title: const Text('Online Leads',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                          )),
                      contentPadding: const EdgeInsets.fromLTRB(20, 5, 0, 5),
                      leading: const Icon(Icons.people_alt,size: 25,),
                      onTap: () {
                        Navigator.of(context).pop();
                        // Navigator.of(context).push(MaterialPageRoute(
                        //     builder: (BuildContext context) => HomeScreen()));
                      },
                    ),
                    ListTile(
                      title: const Text('Virtual Number Call',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                          )),
                      contentPadding: const EdgeInsets.fromLTRB(20, 5, 0, 5),
                      leading: const Icon(Icons.call,size: 25,),
                      onTap: () {
                        Navigator.of(context).pop();
                        // Navigator.of(context).push(MaterialPageRoute(
                        //     builder: (BuildContext context) => HomeScreen()));
                      },
                    ),
                    ListTile(
                      title: const Text('Call Your RM',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                          )),
                      contentPadding: const EdgeInsets.fromLTRB(20, 5, 0, 5),
                      leading: const Icon(Icons.call,size: 25,),
                      onTap: () {
                        Navigator.of(context).pop();
                        // Navigator.of(context).push(MaterialPageRoute(
                        //     builder: (BuildContext context) => HomeScreen()));
                      },
                    ),
                    ListTile(
                      title: const Text('Settings',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                          )),
                      contentPadding: const EdgeInsets.fromLTRB(20, 5, 0, 5),
                      leading: const Icon(Icons.settings,size: 25,),
                      onTap: () {
                        Navigator.of(context).pop();
                        // Navigator.of(context).push(MaterialPageRoute(
                        //     builder: (BuildContext context) => HomeScreen()));
                      },
                    ),
                  ],
                )
            ),

         Align(
           alignment: FractionalOffset.bottomCenter,
           child: Container(
             padding: const EdgeInsets.only(bottom: 5.0),
             child:  Column(
               crossAxisAlignment: CrossAxisAlignment.start,
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children: [
                 Row(
                   crossAxisAlignment: CrossAxisAlignment.center,
                   mainAxisAlignment: MainAxisAlignment.center,
                   children: [
                     Column(
                       crossAxisAlignment: CrossAxisAlignment.center,
                       children: const [
                         Text('TyrePlex',style: TextStyle(fontSize: 20),),
                         Text('trusted by 3000+ dealers',style: TextStyle(fontSize: 10),),
                       ],
                     ),
                     const SizedBox(width: 100,),
                     Column(
                       crossAxisAlignment: CrossAxisAlignment.start,
                       children: const [
                         Text('2.0.12 Build 68', style: TextStyle(fontSize: 10),),
                       ],
                     ),
                   ],
                 ),
               ],
             ),
           ),

         ),

            ],
          ),
        ),


      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectScreen,
        currentIndex: _selectedScreenIndex,
        items:  const [
          BottomNavigationBarItem(icon: Icon(Icons.pending,size: 30,), label: "Pending", backgroundColor: Colors.red),
          BottomNavigationBarItem(icon: Icon(Icons.watch_later_outlined,color: Colors.black,size: 30,), label: "Upcoming"),
          BottomNavigationBarItem(icon: Icon(Icons.check,color: Colors.black,size: 30,), label: "Completed"),

        ],

      ),

               );



  }
}
