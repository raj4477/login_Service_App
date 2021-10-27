import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:form_field_validator/form_field_validator.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: Home(),
      
    );
  }
}

class Home extends StatefulWidget {
  const Home({ Key? key }) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  final passwordValidator = MultiValidator([
    RequiredValidator(errorText: 'password is required'),
    MinLengthValidator(8, errorText: 'password must be at least 8 digits long'),
    PatternValidator(r'(?=.*?[#?!@$%^&*-])',
        errorText: 'passwords must have at least one special character')
  ]);
  bool validateEmail(String value) {
    var pattern =
        r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
        r"{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]"
        r"{0,253}[a-zA-Z0-9])?)*$";
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(value) || value == null)
      return true;
    else
      return false;
  }

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
                    Container(
                      child: Stack(
                        children :<Widget> [
                         Container (
                           padding: EdgeInsets.fromLTRB(16.0, 75.0, 0.0, 0.0),
                           child: Text("Hello",
                        style: TextStyle(
                           fontSize: 80.0, fontWeight: FontWeight.bold
                                ),
                             ),
                         ),
                          Container(
                            padding: EdgeInsets.fromLTRB(16.0, 175.0, 0.0, 0.0),
                            child: Text('There',
                                style: TextStyle(
                                    fontSize: 80.0, fontWeight: FontWeight.bold)),
                          ),
                          Container(
                            padding: EdgeInsets.fromLTRB(220.0, 175.0, 0.0, 0.0),
                            child: Text('.',
                                style: TextStyle(
                                    fontSize: 80.0,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xffB2340D)
                                )
                            ),
                          )
                       ]
                      ),
                    ),

          Padding(
            padding: EdgeInsets.all(20.0),
            child: Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  SizedBox(height: 25,),
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0,right: 10.0),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(32)),
                        // boxShadow: [
                        //   BoxShadow(
                        //     color: Color(0xff34D4D4),
                        //     blurRadius: 20,
                        //     offset: const Offset(0, 8),
                        //   ),
                        // ],
                      ),
                      child: TextFormField(
                        // obscureText: true,
                        // enabled: false,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                          hintText: "example123@gmai.com",
                          // disabledBorder: OutlineInputBorder(
                          //   borderRadius: BorderRadius.all(Radius.circular(4)),
                          //   borderSide: BorderSide(width: 1,color: Colors.orange),
                          // ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(32)),
                            borderSide: BorderSide(
                                width: 1, color: Color(0xffB2340D)),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(32.0),
                            borderSide: new BorderSide(color: Colors.teal, width: 5),

                          ),
                          prefixIcon: const Icon(
                            Icons.mail_outline, color: Color(0xffB2340D),),
                          labelText: 'Email',
                        ),

                        // The validator receives the text that the user has entered.
                        validator: (value) {
                          if (validateEmail(value!)) {
                            return "Enter Validate Email";
                          }
                          else
                            return null;
                        },


                      ),
                    ),
                  ),
                  SizedBox(height: 20,),
                  Padding(
            padding: const EdgeInsets.only(left: 10.0,right: 10.0),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(32)),
                        // boxShadow: [
                        //   BoxShadow(
                        //     color: Color(0xff34D4D4),
                        //     blurRadius: 20,
                        //     offset: const Offset(0, 08),
                        //   ),
                        // ],
                      ),
                      child: TextFormField(
                        obscureText: true,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                          hintText: "Password",
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(32)),
                            borderSide: BorderSide(
                                width: 1, color: Color(0xffB2340D)),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(32.0),
                            borderSide: new BorderSide(color: Colors.teal, width: 5),

                          ),
                          prefixIcon: const Icon(
                            Icons.vpn_key_outlined, color: Color(0xffB2340D),),
                          labelText: 'Password',
                        ),

                        // The validator receives the text that the user has entered.
                        validator: passwordValidator,

                      ),
                    ),
                  ),
                  // SizedBox(height: 20,),
                  // SizedBox(height: 20,),
                  // ElevatedButton(
                  //   style: ButtonStyle(
                  //     backgroundColor: MaterialStateProperty.all(Color(0xff34D4D4)),
                  //     // padding: MaterialStateProperty.all(EdgeInsets.all(50)),
                  //     // textStyle: MaterialStateProperty.all(TextStyle(fontSize: 30)
                  //     // )
                  //   ),
                  //   onPressed: () {
                  //     // Validate returns true if the form is valid, or false otherwise.
                  //     if (_formKey.currentState!.validate()) {
                  //       // If the form is valid, display a snackbar. In the real world,
                  //       // you'd often call a server or save the information in a database.
                  //       ScaffoldMessenger.of(context).showSnackBar(
                  //         const SnackBar(content: Text('Processing Data')),
                  //       );
                  //     }
                  //   },
                  //   child: const Text('Login', style: TextStyle(
                  //       color: Color(0xff181f29)
                  //   ),
                  //   ),
                  // ),

                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 20.0,bottom: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children:  <Widget>[
                GestureDetector(
                  onTap: (){},
                  child: Text('Forgot password',
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                      color: Color(0xffB2340D)
                    ),
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: 10.0,),
          Padding(
            padding: const EdgeInsets.only(left: 75),

            child: Column(

              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap:  () {
                    // Validate returns true if the form is valid, or false otherwise.
                     if (_formKey.currentState!.validate()) {
                 // If the form is valid, display a snackbar. In the real world,
                  // you'd often call a server or save the information in a database.
                          ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Processing Data')),
                         );
                      }
                    } ,
                  child: Container(
                       height: 45.0,
                    width: 200.0,
                    // margin: EdgeInsets.only(left: 90),
                    // color: Colors.redAccent,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(32)),
                      color: Color(0xffB2340D) //Colors.brown

                  ),
                  child:   Center(
                    child:  const Text('Login', style: TextStyle(
                     color: Colors.white,
                      fontWeight: FontWeight.bold
                         ),
                      ),
                  ),
                ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Container(
                  height: 45.0,
                  width: 200.0,


              decoration: BoxDecoration(
         borderRadius: BorderRadius.all(Radius.circular(32)),
         // color: Color(0xffB2340D),
             border: Border.all(color: const Color(0xffB2340D),width: 3.0)
         ),


                  // color:  Colors.red,
                  child: Center(
                    child: Text("Login with google ",
                            style: TextStyle(
                              color: Color(0xffB2340D
                              ),
                              fontWeight: FontWeight.bold
                            ),
                    ),
                  ),

                ),
       SizedBox(
         height: 20.0,
       ),
       GestureDetector(
         onTap: (){
           // print('hello');
           },
         child: Text.rich(
         TextSpan(
         text: 'New To App?',
              // style: TextStyle(fontSize: 50),
        children: <TextSpan>[
        TextSpan(
      text: 'Register',

      style: TextStyle(
       color: Color(0xffB2340D
      ) ,
       fontWeight: FontWeight.bold,
       decoration: TextDecoration.underline,
          ),
        ),
        ],
       ),
       ),
       ),

        ],
            ),
          ),
        ]
      ),
    );

  }
}
 
