import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'loginProvider.dart';

class LoginPage extends StatelessWidget {
 LoginPage({Key? key}) : super(key: key);

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  color: Colors.blueAccent,
                  borderRadius:
                      BorderRadius.only(bottomRight: Radius.circular(50))),
              child: Column(
                children: [
                  // Expanded(
                  //     child: Image.network(
                  //         "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTk9P_M-SOz_szeG8WYFEhcbC9Sbsxtp_QboA&usqp=CAU"))
                ],
              ),
            ),
          ),
          Expanded(
              flex: 2,
              child: Container(
                color: Colors.blueAccent,
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(15.0),
                    child: Column(
                      children: [
                        Column(
                          children: [
                            Text(
                              "SignIn",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blue),
                            ),
                            SizedBox(height: 5),
                            Text("Welcome Back! please Enter your credentials")
                          ],
                        ),
                        SizedBox(height: 20),
                        Container(
                          child: Form(
                            key: formKey,
                            child: Column(
                              children: [
                                TextFormField(
                                    controller:
                                        Provider.of<LoginProvider>(context)
                                            .usercontroller,
                                    decoration: InputDecoration(
                                        hintText: "Username",
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(15)))),
                                SizedBox(height: 10),
                                TextFormField(
                                    controller:
                                        Provider.of<LoginProvider>(context)
                                            .passcontroller,
                                    decoration: InputDecoration(
                                        hintText: "Password",
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(15))))
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 5),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            MaterialButton(
                              onPressed: () {
                                if (formKey.currentState!.validate()) {
                                  Provider.of<LoginProvider>(context,
                                          listen: false)
                                      .Login(
                                    context: context,
                                    user: Provider.of<LoginProvider>(context,
                                            listen: false)
                                        .usercontroller
                                        .text,
                                    password: Provider.of<LoginProvider>(
                                            context,
                                            listen: false)
                                        .passcontroller
                                        .text,
                                  );
                                }
                              },
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                              color: Colors.blue,
                              child: Text(
                                "Login Now",
                                style: TextStyle(color: Colors.black),
                              ),
                            ),
                            Text("Forget Password ?")
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              )),
        ],
      ),
    );
  }
}
