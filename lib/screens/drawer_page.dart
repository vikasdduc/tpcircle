import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class DrawerPage extends StatefulWidget{
  const DrawerPage({Key? key}) : super(key: key);

  @override
  DrawerPageState createState() => DrawerPageState();
}
class DrawerPageState extends State<DrawerPage >{

  @override
  Widget build(BuildContext context){

    return Drawer(
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
                    Card(
                      elevation: 10,
                      child: ListTile(
                        title: const Text('log out',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                            )),
                        contentPadding: const EdgeInsets.fromLTRB(20, 0, 0, 5),
                        leading: const Icon(Icons.logout,size: 25,),
                        onTap: () async {
                          await FirebaseAuth.instance.signOut();
                          // Navigator.pushReplacement(
                          //   context,
                          //   MaterialPageRoute(
                          //     builder: (context) => LoginScreen(),
                          //   ),
                          // );
                        },


                        //Navigator.of(context).pop();
                        // Navigator.of(context).push(MaterialPageRoute(
                        //     builder: (BuildContext context) => HomeScreen()));

                      ),
                    ),
                    Card(
                      child: ListTile(
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
                    ),
                    Card(
                      child: ListTile(
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
                    ),
                    Card(
                      child: ListTile(
                        title: const Text('Orders History',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                            )),
                        contentPadding: const EdgeInsets.fromLTRB(20, 5, 0, 5),
                        leading: const Icon(Icons.double_arrow_sharp,size: 25,),
                        onTap: () {
                          Navigator.pushNamed(context, '/chipPage');
                          // Navigator.of(context).push(MaterialPageRoute(
                          //     builder: (BuildContext context) => HomeScreen()));
                        },
                      ),
                    ),
                    Card(
                      child: ListTile(
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
                    ),
                    Card(
                      child: ListTile(
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
                    ),
                    Card(
                      child: ListTile(
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
                    ),
                    Card(
                      child: ListTile(
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
                    ),
                    Card(
                      child: ListTile(
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
                    ),
                    Card(
                      child: ListTile(
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
                    ),
                    Card(
                      child: ListTile(
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
                    ),
                    Card(
                      child: ListTile(
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
      );

  }


}