import 'package:flutter/material.dart';

class FilterPage extends StatefulWidget{
  const FilterPage({Key? key}) : super(key: key);

  @override
  State<FilterPage> createState() => FilterPageState();
}

class FilterPageState extends State<FilterPage>{

  List vehicleList = ["Car", "Bike", "Scooter", "Truck", "Truck/Bus"];
  TextEditingController searchController = TextEditingController();

  @override
Widget build (BuildContext context){
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back,),
          onPressed: () {
            Navigator.pop(context);//  this too  pop on buy tyre screen
          },),
        title: const Text('Filter', style: TextStyle(fontSize: 20),),
        actions: [
          IconButton(
            icon: const Icon(Icons.cancel_outlined,),
            onPressed: () {
             // Navigator.pop(context); this has to pop on the buy tyre screen
            },),
        ],
      ),
      body: Column(
        children: [
          const SizedBox(height: 8,),
          Container( height: 20,
            child: Text('Select Vehicle Category',textAlign: TextAlign.start,),),
          Row(
            children: List<Widget>.generate(
                vehicleList.length, // place the length of the array here
                    (int index) {
                  return Container(
                    margin: const EdgeInsets.all(2.0),
                    child: GestureDetector(
                      onTap: () {
                       // tappedCategory(index);
                      },
                      child: Chip(
                          label: Text(vehicleList[index])
                      ),
                    ),
                  );
                }).toList(),
          ),
          GestureDetector(
            onTap: (){
              _presentBottomSheet(context);
            },
            child: Container(
              margin: const EdgeInsets.all(8),
              child: Card(
                child: ListTile(
                  leading: const Icon(Icons.search),
                  title: const TextField(
                    //controller: searchController,
                    decoration: InputDecoration(
                        hintText: 'Search', border: InputBorder.none),

                      //onChanged: (text) {
                      // if (text.isNotEmpty) {
                      //   searching = true;
                      //   filtered.value = [];
                      //   users.forEach((user) {
                      //     if (user['name']
                      //         .toString()
                      //         .toLowerCase()
                      //         .contains(text.toLowerCase()) ||
                      //         user['tel'].toString().contains(text)) {
                      //       filtered.value.add(user);
                      //     }
                      //   });
                      // } else {
                      //   searching = false;
                      //   filtered.value = [];
                      // }
                    // },
                  ),
                  trailing: IconButton(
                    icon: Icon(Icons.cancel),
                    onPressed: () {

                    },
                  ),
                ),
              ),
            ),
          ),

        ],
      ),
      //searchableUsersWidget(),
      // bottomSheet: BottomSheet(
      //   onClosing: () { },
      //   builder: (BuildContext context) {
      //     return searchableUsersWidget();
      //   },),
      bottomNavigationBar: Card(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children: [
               TextButton(
                 onPressed: () {  },
                  child: const Text("Clear",style: TextStyle(fontSize: 20,color: Colors.red,),),),
               SizedBox(width: 40,),
               SizedBox(
                 height: 40,
                 width: 220,
                 child: ElevatedButton(
                   style: ElevatedButton.styleFrom(
                       padding: const EdgeInsets.all(10)
                   ),
                  onPressed: (){},
                   child: const Text(
              "Apply" ,style: TextStyle(fontSize: 17,),),
          ),
               ),
    ],
  ),
),
    );
  }

}

void _presentBottomSheet(BuildContext context){
  showModalBottomSheet(
      shape: const RoundedRectangleBorder( // <-- SEE HERE
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(25.0),
        ),
      ),
      context: context,
      builder: (context) => ListView(
        scrollDirection: Axis.vertical,
        children: const [
          ListTile(
            leading: Icon(Icons.trip_origin_rounded),
            title: Text('MRF'),
          ),
          ListTile(
            leading: Icon(Icons.edit),
            title: Text('YOKOHOMA'),
          ),
          ListTile(
            leading: Icon(Icons.edit),
            title: Text('CEAT'),
          ),
          ListTile(
            leading: Icon(Icons.edit),
            title: Text('APOLLO'),
          ),
        ],
      ));
}

// Widget searchableUsersWidget() {
//   List<Map> users = [
//     {'name': 'James', 'tel': '9010'},
//     {'name': 'Michael', 'tel': '9011'},
//     {'name': 'Jane', 'tel': '9013'},
//     {'name': 'Vinit', 'tel': '9014'},
//     {'name': 'Harry', 'tel': '9015'},
//     {'name': 'Tony', 'tel': '9016'},
//
//   ];
//   ValueNotifier<List<Map>> filtered = ValueNotifier<List<Map>>([]);
//   TextEditingController searchController = TextEditingController();
//   FocusNode searchFocus = FocusNode();
//   bool searching = false;
//   return ValueListenableBuilder<List>(
//       valueListenable: filtered,
//       builder: (context, value, _) {
//         return Container(
//           margin: const EdgeInsets.only(top: 10),
//           decoration: BoxDecoration(
//             color: Colors.white,
//             borderRadius:  const BorderRadius.only(
//                 topLeft: Radius.circular(20),
//                 topRight: Radius.circular(20)),
//             boxShadow: [
//               BoxShadow(
//                 color: Colors.white.withOpacity(0.5),
//                 spreadRadius: 4,
//                 blurRadius: 6,
//                 offset: const Offset(0, 3), // changes position of shadow
//               ),
//             ],
//           ),
//           child: Column(
//             children: [
//               Container(
//                 margin: const EdgeInsets.all(8),
//                 child: Card(
//                   child: ListTile(
//                     leading: const Icon(Icons.search),
//                     title: TextField(
//                       controller: searchController,
//                       decoration: const InputDecoration(
//                           hintText: 'Search', border: InputBorder.none),
//                       onChanged: (text) {
//                         if (text.isNotEmpty) {
//                           searching = true;
//                           filtered.value = [];
//                           users.forEach((user) {
//                             if (user['name']
//                                 .toString()
//                                 .toLowerCase()
//                                 .contains(text.toLowerCase()) ||
//                                 user['tel'].toString().contains(text)) {
//                               filtered.value.add(user);
//                             }
//                           });
//                         } else {
//                           searching = false;
//                           filtered.value = [];
//                         }
//                       },
//                     ),
//                     trailing: IconButton(
//                       icon: Icon(Icons.cancel),
//                       onPressed: () {
//                         searchController.clear();
//                         searching = false;
//                         filtered.value = [];
//                         if (searchFocus.hasFocus) searchFocus.unfocus();
//                       },
//                     ),
//                   ),
//                 ),
//               ),
//               Expanded(
//                 child: ListView.builder(
//                     itemCount: searching
//                         ? filtered.value.length
//                         : users.length,
//                     itemBuilder: (context, index) {
//                       final item = searching
//                           ? filtered.value[index]
//                           : users[index];
//                       return ListTile(
//                         leading: const CircleAvatar(
//
//                         ),
//                         title: Text(item['name']),
//                         subtitle: Text(item['tel']),
//                         onTap: () {},
//                       );
//                     }),
//               ),
//             ],
//           ),
//         );
//       });
// }