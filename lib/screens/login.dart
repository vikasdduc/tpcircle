import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  LoginPageState createState() => LoginPageState();
}
TextEditingController mobileController = TextEditingController();

class LoginPageState extends State<LoginPage>{
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Signin Screen',style: TextStyle(fontSize: 20,color: Colors.white)),
          leading: IconButton( onPressed: () { },
            icon: const Icon(Icons.arrow_back, color: Colors.white,),),
        ),

        resizeToAvoidBottomInset : false,
        body: Container(
          color: Colors.white,
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(height: 5,),
                Image.asset('assets/tyre.png'),
                Column(
                 mainAxisAlignment: MainAxisAlignment.start,
                  children: const [
                      Text('Enter 10 digit mobile number', style: TextStyle(fontSize: 15,color: Colors.black),),
                      SizedBox(height: 10,),
                     Text('An OTP will be sent to this mobile number', style: TextStyle(fontSize: 14,color: Colors.black38),),

                         ],
                        ),
                Container(
                  padding: const EdgeInsets.all(10),
                  child: TextFormField(
                    maxLength: 10,
                    controller: mobileController,
                    decoration: InputDecoration(
                        border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        labelText: 'Mobile Number',

                      suffixIcon: IconButton(
                        icon: const Icon( Icons.phone, ),
                        onPressed: () {
                          // setState(() {
                          // });
                        },
                      ),
                    ),

                  ),
                ),


                Container(
                  margin: const EdgeInsets.only(top: 20),
                  child: Center(
                      child: SizedBox(
                        width: 350,
                          height:60, //height of button
                          // width:300, //width of button
                          child:ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  primary: Theme.of(context).primaryColor, //background color of button
                                  side: const BorderSide(width: 2,), //border width and color
                                  elevation: 3, //elevation of button
                                  shape: RoundedRectangleBorder( //to set border radius to button
                                      borderRadius: BorderRadius.circular(30)
                                  ),
                                  padding: const EdgeInsets.all(5) //content padding inside button
                              ),
                              onPressed: (){
                                //
                                if (_formKey.currentState!.validate()){
                                  if (mobileController.text.isEmpty ){
                                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                                      content: Text("{Mobile Number Can't be empty}"),
                                    ));
                                  } else if (mobileController.text.length < 10) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        const SnackBar(
                                          content: Text(
                                              "{Enter 10 digit Phone Number}"),
                                        ));
                                  } else if (mobileController.text.length > 10) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        const SnackBar(
                                          content: Text(
                                              "{Enter Less Than 10 digit Phone Number}"),
                                        ));
                                  } else if (mobileController.text.length == 10){
                                    Navigator.pushNamed(context, 'otpPageview');
                                  }

                                };
                              },
                              child: const Text("Next"),
                          )
                      ),

                  ),
                ),
                const SizedBox(height: 30,),



                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: const [
                          Text('Developed by', style: TextStyle(color: Colors.black),),
                          Text('TyrePlex', style: TextStyle(color: Colors.green),),
                        ],
                      ),
                    ],
                  ),

              ],
            ),
          ),
        ));
  }

}