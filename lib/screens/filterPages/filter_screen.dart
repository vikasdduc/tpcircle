import 'package:flutter/material.dart';

class FilterPage extends StatefulWidget{
  const FilterPage({Key? key}) : super(key: key);

  @override
  State<FilterPage> createState() => FilterPageState();
}

class FilterPageState extends State<FilterPage>{
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
      body: searchableUsersWidget(),
      // bottomNavigationBar: BottomNavigationBar(
      //   items: [
      //   ],),
    );
  }

}

Widget searchableUsersWidget() {
  List<Map> users = [
    {'name': 'James', 'tel': '9010'},
    {'name': 'Michael', 'tel': '9011'},
    {'name': 'Jane', 'tel': '9013'},

  ];
  ValueNotifier<List<Map>> filtered = ValueNotifier<List<Map>>([]);
  TextEditingController searchController = TextEditingController();
  FocusNode searchFocus = FocusNode();
  bool searching = false;
  return ValueListenableBuilder<List>(
      valueListenable: filtered,
      builder: (context, value, _) {
        return Container(
          margin: const EdgeInsets.only(top: 10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius:  const BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20)),
            boxShadow: [
              BoxShadow(
                color: Colors.white.withOpacity(0.5),
                spreadRadius: 4,
                blurRadius: 6,
                offset: const Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.all(8),
                child: Card(
                  child: ListTile(
                    leading: const Icon(Icons.search),
                    title: TextField(
                      controller: searchController,
                      decoration: const InputDecoration(
                          hintText: 'Search', border: InputBorder.none),
                      onChanged: (text) {
                        if (text.isNotEmpty) {
                          searching = true;
                          filtered.value = [];
                          users.forEach((user) {
                            if (user['name']
                                .toString()
                                .toLowerCase()
                                .contains(text.toLowerCase()) ||
                                user['tel'].toString().contains(text)) {
                              filtered.value.add(user);
                            }
                          });
                        } else {
                          searching = false;
                          filtered.value = [];
                        }
                      },
                    ),
                    trailing: IconButton(
                      icon: Icon(Icons.cancel),
                      onPressed: () {
                        searchController.clear();
                        searching = false;
                        filtered.value = [];
                        if (searchFocus.hasFocus) searchFocus.unfocus();
                      },
                    ),
                  ),
                ),
              ),
              Expanded(
                child: ListView.builder(
                    itemCount: searching
                        ? filtered.value.length
                        : users.length,
                    itemBuilder: (context, index) {
                      final item = searching
                          ? filtered.value[index]
                          : users[index];
                      return ListTile(
                        leading: const CircleAvatar(

                        ),
                        title: Text(item['name']),
                        subtitle: Text(item['tel']),
                        onTap: () {},
                      );
                    }),
              ),
            ],
          ),
        );
      });
}