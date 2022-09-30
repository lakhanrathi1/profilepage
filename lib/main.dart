import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Profile Page"),
        ),
        body: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const SizedBox(height: 15,),

                  const Text("Enter First Name *",style: TextStyle(color: Colors.grey),),
                  const SizedBox(height: 10,),
                  TextFormField(
                    decoration: const InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey, width: 1.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey, width: 1.0),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red, width: 1.0),
                      ),
                      focusedErrorBorder:OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red, width: 1.0),
                      ),
                      // hintText: 'Enter your full name',
                      //   hintStyle: TextStyle(color: Colors.grey)

                      // labelText: 'Name',
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter first name';
                      }
                      return null;
                    },
                  ),

                  const SizedBox(height: 10,),
                  const Text("Enter Middle Name",style: TextStyle(color: Colors.grey),),
                  const SizedBox(height: 10,),
                  TextFormField(
                    decoration: const InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey, width: 1.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey, width: 1.0),
                      ),
                      // hintText: 'Enter your middle name',
                      // hintStyle: TextStyle(color: Colors.grey)
                      // labelText: 'Name',
                    ),
                    validator: (value) {
                    },
                  ),

                  const SizedBox(height: 10,),
                  const Text("Enter Last Name *",style: TextStyle(color: Colors.grey),),
                  const SizedBox(height: 10,),
                  TextFormField(
                    decoration: const InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey, width: 1.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey, width: 1.0),
                      ),

                        errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red, width: 1.0),
                  ),
              focusedErrorBorder:OutlineInputBorder(
                borderSide: BorderSide(color: Colors.red, width: 1.0),
              ),
                      // hintText: 'Enter your last name',
                      // hintStyle: TextStyle(color: Colors.grey)

                      // labelText: 'Name',
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter last name';
                      }
                      return null;
                    },
                  ),


                  const SizedBox(height: 10,),
                  const Text("Enter Address Line 1 *",style: TextStyle(color: Colors.grey),),
                  const SizedBox(height: 10,),
                  TextFormField(
                    decoration: const InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey, width: 1.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey, width: 1.0),
                        ),

                      errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red, width: 1.0),
                      ),
                      focusedErrorBorder:OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red, width: 1.0),
                      ),
                        // hintText: 'Enter Address Line 1',
                        // hintStyle: TextStyle(color: Colors.grey)

                      // labelText: 'Name',
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter address line 1';
                      }
                      return null;
                    },
                  ),



                  const SizedBox(height: 10,),
                  const Text("Enter Address Line 2",style: TextStyle(color: Colors.grey),),
                  const SizedBox(height: 10,),
                  TextFormField(
                    decoration: const InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey, width: 1.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey, width: 1.0),
                        ),

                      errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red, width: 1.0),
                      ),
                      focusedErrorBorder:OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red, width: 1.0),
                      ),
                      // hintText: 'Enter your last name',
                        // hintStyle: TextStyle(color: Colors.grey)

                      // labelText: 'Name',
                    ),
                    validator: (value) {

                    },
                  ),


                  const SizedBox(height: 10,),
                  const Text("State *",style: TextStyle(color: Colors.grey),),
                  const SizedBox(height: 10,),
                  TextFormField(
                    decoration: const InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey, width: 1.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey, width: 1.0),
                        ),
                        // hintText: 'Enter your last name',
                        // hintStyle: TextStyle(color: Colors.grey)

                      errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red, width: 1.0),
                      ),
                      focusedErrorBorder:OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red, width: 1.0),
                      ),
                      // labelText: 'Name',
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter state name';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 10,),
                  const Text("City  *" ,style: TextStyle(color: Colors.grey),),
                  const SizedBox(height: 10,),
                  TextFormField(
                    decoration: const InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey, width: 1.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey, width: 1.0),
                      ),
                      // hintText: 'Enter your last name',
                      // hintStyle: TextStyle(color: Colors.grey)

                      errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red, width: 1.0),
                      ),
                      focusedErrorBorder:OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red, width: 1.0),
                      ),
                      // labelText: 'Name',
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter city name';
                      }
                      return null;
                    },
                  ),

                  const SizedBox(height: 10,),
                  const Text("Enter Zip code  *",style: TextStyle(color: Colors.grey),),
                  const SizedBox(height: 10,),
                  TextFormField(
                    decoration: const InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey, width: 1.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey, width: 1.0),
                      ),
                      // hintText: 'Enter your last name',
                      // hintStyle: TextStyle(color: Colors.grey)

                      errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red, width: 1.0),
                      ),
                      focusedErrorBorder:OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red, width: 1.0),
                      ),
                      // labelText: 'Name',
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter zip code';
                      }
                      return null;
                    },
                  ),

                  const SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text("Enter Email  *",style: TextStyle(color: Colors.grey),),
                      Text("Change",style: TextStyle(color: Colors.red,decoration: TextDecoration.underline,
                      ),),
                    ],
                  ),
                  const SizedBox(height: 10,),
                  TextFormField(
                    decoration: const InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey, width: 1.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey, width: 1.0),
                      ),
                      // hintText: 'Enter your last name',
                      // hintStyle: TextStyle(color: Colors.grey)

                      errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red, width: 1.0),
                      ),
                      focusedErrorBorder:OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red, width: 1.0),
                      ),
                      // labelText: 'Name',
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter email';
                      }
                      return null;
                    },
                  ),

                  const SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text("Mobile Number  *",style: TextStyle(color: Colors.grey),),
                      Text("Change",style: TextStyle(color: Colors.red,decoration: TextDecoration.underline,
                      ),),
                    ],
                  ),
                  const SizedBox(height: 10,),
                  TextFormField(
                    decoration: const InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey, width: 1.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey, width: 1.0),
                      ),
                      // hintText: 'Enter your last name',
                      // hintStyle: TextStyle(color: Colors.grey)

                      errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red, width: 1.0),
                      ),
                      focusedErrorBorder:OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red, width: 1.0),
                      ),
                      // labelText: 'Name',
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter mobile number';
                      }
                      return null;
                    },
                  ),



                  const SizedBox(height: 10,),
                  const Text("Profession",style: TextStyle(color: Colors.grey),),
                  const SizedBox(height: 10,),
                  TextFormField(
                    decoration: const InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey, width: 1.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey, width: 1.0),
                      ),
                      // hintText: 'Enter your last name',
                      // hintStyle: TextStyle(color: Colors.grey)

                      // labelText: 'Name',
                    ),
                    validator: (value) {
                    },
                  ),
                  const SizedBox(height: 15,),
                  const Text("Select preferred mode for communication",style: TextStyle(color: Colors.black),),
                  const SizedBox(height: 5,),
                  Transform.translate(
                    offset: const Offset(-20, 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                      children: [
                        Expanded(
                          
                          child: CheckboxListTile(
                            
                            controlAffinity: ListTileControlAffinity.leading,  //  <-- leading Checkbox
                            title: Transform.translate(
                                offset: const Offset(-20, 0),
                                child: const Text("WhatsApp")),
                            value: false,
                            onChanged: (value){

                            },

                          ),
                          
                        ),
                        Expanded(
                          // flex: 2,
                          child: CheckboxListTile(
                            controlAffinity: ListTileControlAffinity.leading,  //  <-- leading Checkbox
                            title: Transform.translate(
                                offset: const Offset(-20, 0),

                                child: const Text("Email")),
                            value: false,
                            onChanged: (value){

                            },

                          ),
                        ),
                        Expanded(
                          // flex: 2,
                          child: CheckboxListTile(
                            controlAffinity: ListTileControlAffinity.leading,  //  <-- leading Checkbox
                            title: Transform.translate(
                              offset: const Offset(-20, 0),
                              child: const Text("SMS"),
                            ),
                            value: false,
                            onChanged: (value){

                            },

                          ),
                        ),

                      ],
                    ),
                  ),


                  const SizedBox(height: 15,),
                  const Text("Gender",style: TextStyle(color: Colors.black),),
                  // const SizedBox(height: 5,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,

                    children: [
                      Flexible(

                        child: RadioListTile(
                          onChanged: (value) {  },
                          value: true,
                          groupValue: true,
                          title: Transform.translate(
                              offset: const Offset(-20, 0),
                              child: const Text("Male")),
                        ),
                        flex: 2,
                      ),
                      Flexible(
                        flex: 2,
                        child: RadioListTile(
                          onChanged: (value) {  },
                          value: false,
                          groupValue: true,
                          title: Transform.translate(                                offset: const Offset(-20, 0),
                              child: const Text("Female")),
                        ),
                      ),

                    ],
                  ),


                  const SizedBox(height: 15,),
                  const Text("Select preferred language for communication",style: TextStyle(color: Colors.black),),
                  // const SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,

                    children: [
                      Flexible(
                        flex: 2,
                        child: RadioListTile(
                          onChanged: (value) {  },
                          value: true,
                          groupValue: true,
                          title: Transform.translate(
                              offset: const Offset(-20, 0),
                              child: const Text("English")),
                        ),
                      ),
                      Flexible(
                        flex: 2,
                        child: RadioListTile(
                          onChanged: (value) {  },
                          value: false,
                          groupValue: true,
                          title: Transform.translate(
                              offset: const Offset(-20, 0),
                              child: const Text("Arabic")),
                        ),
                      ),

                    ],
                  ),
                  const SizedBox(height: 15,),
                  const Text("Please complete identity verification for listing your car."),
                  const SizedBox(height: 5,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: TextButton(
                            onPressed: (){},
                            child: const Text('Cancel',style: TextStyle(color: Colors.red),),
                          style: TextButton.styleFrom(
                            side: const BorderSide(color: Colors.red, width: 2),
                          ),
                        ),
                      ),
                      const SizedBox(width: 15,),
                      Expanded(
                        child: TextButton(
                          onPressed: (){
                            _submit();
                          },
                          child: const Text('Save Changes',style: TextStyle(color: Colors.red)),
                          style: TextButton.styleFrom(
                            side: const BorderSide(color: Colors.red, width: 2),
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
  void _submit() {
    final isValid = _formKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    _formKey.currentState!.save();
  }

}
