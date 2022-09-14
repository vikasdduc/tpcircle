import 'package:flutter/material.dart';

class MyOrdersPage extends StatefulWidget{
  const MyOrdersPage({Key? key}) : super(key: key);

  @override
  MyOrdersPageState createState() => MyOrdersPageState();
  }
class MyOrdersPageState extends State<MyOrdersPage >{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        centerTitle: true,
        title: const Text('My Orders',style: TextStyle(fontSize: 20,color: Colors.white)),
        actions: [
          IconButton(
              onPressed: (){},
              icon: const Icon(Icons.notifications_active_outlined,color: Colors.white,)),

          IconButton(
              onPressed: (){ },
              icon: const Icon(Icons.shopping_cart,color: Colors.white,)),
                 ],

                    ),
      body: Container(
        padding: const EdgeInsets.only(top: 5.0),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children:  [
              Card(
                elevation: 5,
                child: Container(
                  height: 120,
                  width: 180,
                ),
              ),
              Card(elevation: 5,
                child: Container(
                  height: 120,
                  width: 150,
                ),
              ),
              Card(elevation: 5,
                child: Container(
                  height: 120,
                  width: 150,
                ),
              ),
            ],
          ),
        ),


      ),
      drawer: Drawer(
        child: Container(

          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              const UserAccountsDrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.red
                ),
                accountName: Text("Howdy Vikas tyres"),
                accountEmail: Text("vikas.kumar@tyreplex.com"),
                currentAccountPicture: CircleAvatar(
                  // backgroundColor:
                  // Theme.of(context).platform == TargetPlatform.iOS
                  //     ? Color(0xFF56ccf2)
                  //     : Colors.white,
                  child: Text("VK",
                    style: TextStyle(fontSize: 50,
                     // color: Colors.lightGreenAccent,
                    ),),
                ),
              ),
              ListTile(
                title: const Text('Customer Orders',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                    )),
                contentPadding: const EdgeInsets.fromLTRB(20, 5, 0, 5),
                leading: const Icon(Icons.dashboard_customize_sharp,size: 30,),
                trailing: const Icon(Icons.arrow_right,
                  color: Colors.black38,),
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
                      fontSize: 18,
                    )),
                contentPadding: const EdgeInsets.fromLTRB(20, 5, 0, 5),
                leading: const Icon(Icons.shopping_cart_outlined,size: 30,),
                trailing: const Icon(Icons.arrow_right,
                  color: Colors.black38,),
                onTap: () {
                  Navigator.of(context).pop();
                  // Navigator.of(context).push(MaterialPageRoute(
                  //     builder: (BuildContext context) => HomeScreen()));
                },
              ),
              ListTile(
                title: const Text('Orders History',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                    )),
                contentPadding: const EdgeInsets.fromLTRB(20, 5, 0, 5),
                leading: const Icon(Icons.double_arrow_sharp,size: 30,),
                trailing: const Icon(Icons.arrow_right,
                  color: Colors.black38,),
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
                      fontSize: 18,
                    )),
                contentPadding: const EdgeInsets.fromLTRB(20, 5, 0, 5),
                leading: const Icon(Icons.padding,size: 30,),
                trailing: const Icon(Icons.arrow_right,
                  color: Colors.black38,),
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
                      fontSize: 18,
                    )),
                contentPadding: const EdgeInsets.fromLTRB(20, 5, 0, 5),
                leading: const Icon(Icons.card_giftcard_outlined,size: 30,),
                trailing: const Icon(Icons.arrow_right,
                  color: Colors.white,),
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
                      fontSize: 18,
                    )),
                contentPadding: const EdgeInsets.fromLTRB(20, 5, 0, 5),
                leading: const Icon(Icons.shopping_cart_outlined,size: 30,),
                trailing: const Icon(Icons.arrow_right,
                  color: Colors.white,),
                onTap: () {
                  Navigator.of(context).pop();
                  // Navigator.of(context).push(MaterialPageRoute(
                  //     builder: (BuildContext context) => HomeScreen()));
                },
              ),
            ],
          ),
        ),
      ),

      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.pending,size: 30,), label: "Pending", backgroundColor: Colors.red),
          BottomNavigationBarItem(icon: Icon(Icons.watch_later_outlined,color: Colors.black,size: 30,), label: "Upcoming"),
          BottomNavigationBarItem(icon: Icon(Icons.check,color: Colors.black,size: 30,), label: "Completed"),

        ],

      ),

               );



  }
}
