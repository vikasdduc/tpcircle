import 'package:flutter/material.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';

class OtpPage extends StatefulWidget {
  const OtpPage({Key? key}) : super(key: key);

  @override
  OtpPageState createState() => OtpPageState ();
}
OtpFieldController otpController = OtpFieldController();

class OtpPageState  extends State<OtpPage>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Otp  Screen',style: TextStyle(fontSize: 20,color: Colors.white)),
          leading: IconButton(
            onPressed: () {
            Navigator.pop(context);
          },
            icon: const Icon(Icons.arrow_back, color: Colors.red,),),
        ),

        floatingActionButton: FloatingActionButton(
          onPressed: () {
          print("Floating button was pressed.");
          otpController.clear();
          // otpController.set(['2', '3', '5', '5', '7']);
          // otpController.setValue('3', 0);
          // otpController.setFocus(1);
        },
          child: const Icon(Icons.add,size: 30,color: Colors.black,),
        ),

        resizeToAvoidBottomInset : false,
        body: Container(
          color: Colors.white,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset('assets/tyre.png'),

                Container(
                  padding: const EdgeInsets.all(10),
                  child: OTPTextField(
                    controller: otpController,
                    length: 5,
                    width: MediaQuery.of(context).size.width,
                    textFieldAlignment: MainAxisAlignment.spaceAround,
                    fieldWidth: 45,
                    fieldStyle: FieldStyle.box,
                    outlineBorderRadius: 15,
                    style: const TextStyle(fontSize: 17),
                    onChanged: (pin) {
                      print("Changed: $pin");
                    },
                    onCompleted: (pin) {
                      print("Completed: $pin");
                    }),
                ),

                Container(
                  margin: const EdgeInsets.only(top: 20),
                  child: Center(
                    child: SizedBox(
                        height:60, //height of button
                        width:300, //width of button
                        child:ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              primary: Colors.lightBlue, //background color of button
                              side: const BorderSide(width: 2, color:Colors.black), //border width and color
                              elevation: 3, //elevation of button
                              shape: RoundedRectangleBorder( //to set border radius to button
                                  borderRadius: BorderRadius.circular(30)
                              ),
                              padding: const EdgeInsets.all(20) //content padding inside button
                          ),
                          onPressed: (){

                          },
                          child: const Text("Next"),
                        )
                    ),

                  ),
                ),



                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('Developed by', style: TextStyle(color: Colors.black),),
                        TextButton(onPressed: (){}, child: const Text('Tyreplex',style: TextStyle( color: Colors.green),) ),
                      ],
                    ),
                  ],
                ),

              ],
                ),


            ),
          ),
        );
  }

}