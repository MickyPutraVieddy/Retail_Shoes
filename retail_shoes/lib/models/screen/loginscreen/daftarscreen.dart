import 'package:flutter/material.dart';
import 'package:retail_shoes/models/colour/colour.dart';
import 'package:get/get.dart';
import 'package:retail_shoes/models/screen/authentication/authentation.dart';
import 'package:retail_shoes/models/screen/dashboard/dashboard.dart';

class daftarscreen extends StatefulWidget {
  const daftarscreen({super.key});

  @override
  State<daftarscreen> createState() => _daftarscreenState();
}

class _daftarscreenState extends State<daftarscreen> {
  // lalu membypass nya di sini tinggal pilih RXnya
  final authC = Get.find<AuthenticationController>();
  // untuk bypass datanya menggunakan rx
  final roleData = Get.find<homebody>();
  // membuat visible
  var _isvisible = true;
  // membuat obscure text
  var _obscure = false;

  // untuk default dropdown
  List<String> valueDropdown = [
    'User',
    'Seller',
  ];

  String? selected;

  @override
  Widget build(BuildContext context) {
    // final Textedit = TextEditingController();
    // ini buat button on pressed

// ini buat signup ke authenhication
    final AuthenticationController authController =
        Get.put(AuthenticationController());

    return Scaffold(
      backgroundColor: Color(
        hexcolour("#1F1D2B"),
      ),
      body: SingleChildScrollView(
          child: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 25,
            ),
            Container(
              padding: EdgeInsets.only(
                left: 20,
              ),
              alignment: Alignment.centerLeft,
              width: 250,
              margin: EdgeInsets.only(right: 130),
              child: Column(children: [
                Text(
                  "Sign up",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 25),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: EdgeInsets.only(),
                  child: Text(
                    "Sign Up to make Account",
                    style: TextStyle(
                        fontSize: 16, color: Color(hexcolour("#999999"))),
                  ),
                )
              ]),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 260),
              child: Text(
                "Full Name",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    color: Colors.white),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Center(
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(width: 1, color: Colors.grey)),
                height: 50,
                width: 350,
                child: TextFormField(
                  style: TextStyle(color: Colors.white),
                  controller: authController.fullnameController,
                  decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.account_circle,
                        color: Color(hexcolour("#6C5ECF")),
                      ),
                      hintText: "Your Full Name",
                      hintStyle: TextStyle(color: Color(hexcolour("504F5E")))),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 270),
              child: Text(
                "Username",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    color: Colors.white),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Center(
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(width: 1, color: Colors.grey)),
                height: 50,
                width: 350,
                child: TextFormField(
                  controller: authController.usernameController,
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.adjust_rounded,
                        color: Color(hexcolour("#6C5ECF")),
                      ),
                      hintText: "Your Username",
                      hintStyle: TextStyle(color: Color(hexcolour("504F5E")))),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 260),
              child: Text(
                "Email Adress",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    color: Colors.white),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Center(
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(width: 1, color: Colors.grey)),
                height: 50,
                width: 350,
                child: TextFormField(
                  // ini untuk warna text input
                  style: TextStyle(color: Colors.white),

                  controller: authController.emailControllerSignup,
                  decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.email_outlined,
                        color: Color(hexcolour("#6C5ECF")),
                      ),
                      hintText: "Your Email Adress",
                      hintStyle: TextStyle(color: Color(hexcolour("504F5E")))),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 280),
              child: Text(
                "Password",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    color: Colors.white),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Center(
              child: Flexible(
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(width: 1, color: Colors.grey)),
                  height: 50,
                  width: 350,
                  child: TextFormField(
                    // ini untuk warna text input
                    style: TextStyle(color: Colors.white),
                    controller: authController.passwordControllerSignup,
                    decoration: InputDecoration(
                        prefixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                _isvisible = !_isvisible;
                              });
                            },
                            icon: Icon(
                              _isvisible == false
                                  ? Icons.lock
                                  : Icons.lock_open,
                              color: Color(hexcolour("#6C5ECF")),
                            )),
                        hintText: "Your Password",
                        hintStyle:
                            TextStyle(color: Color(hexcolour("504F5E")))),
                    obscureText: _obscure = !_obscure,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 310),
              child: Text(
                "Role",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    color: Colors.white),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Center(
                child: Container(
              // alignment: Alignment.center,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(width: 1, color: Colors.grey)),
              height: 50,
              width: 350,
              child: DropdownButton(
                style: TextStyle(color: Colors.black),
                isExpanded: true,
                alignment: Alignment.center,
                hint: Text(
                  "Role Kamu",
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
                value: selected,
                items: valueDropdown.map((value) {
                  return DropdownMenuItem(
                    alignment: Alignment.center,
                    child: Text(value,
                        style: TextStyle(
                          fontSize: 20,
                          color: value == selected
                              ? Colors.white // Selected item color
                              : Colors.black, // Default item color),
                        )),
                    value: value,
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    selected = value;
                    authC.selectedRole.value = value!;
                    // roleData.
                  });
                },
              ),
            )),
            SizedBox(
              height: 20,
            ),
            Container(
              height: 45,
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(100)),
              width: 350,
              child: ElevatedButton(
                // style: ElevatedButton.styleFrom(
                //     primary: Color(hexcolour("#6C5ECF"))),
                onPressed: () {
                  // authC.Signup(, Username, Email, Password)
                  authC.signUp();
                },
                child: Text(
                  "Sign Up",
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Row(
                children: [
                  SizedBox(
                    width: 21,
                  ),
                  SizedBox(
                    width: 170,
                    child: Divider(
                      thickness: 1,
                      color: Colors.grey,
                      height: 20,
                      endIndent: 20,
                    ),
                  ),
                  Text(
                    "OR",
                    style: TextStyle(
                        fontSize: 16, color: Color(hexcolour("#999999"))),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  SizedBox(
                    width: 170,
                    child: Divider(
                      thickness: 1,
                      color: Colors.grey,
                      height: 20,
                      endIndent: 20,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 40,
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    "Already have an Account? ",
                    style: TextStyle(color: Color(hexcolour("#999999"))),
                  ),
                  TextButton(
                    onPressed: () {
                      Get.toNamed('/page2');
                    },
                    child: Text(
                      "Sign in",
                      style: TextStyle(color: Color(hexcolour("#6C5ECF"))),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      )),
    );
  }
}
