import "package:flutter/material.dart";
import 'package:flutter/services.dart';
import 'package:letmeyoureyes/constants/colors.dart';
// import "package:font_awesome_flutter/font_awesome_flutter.dart";

import 'package:letmeyoureyes/screens/MapPage.dart';

class OTPVerificationPage extends StatefulWidget {
  const OTPVerificationPage({Key? key}) : super(key: key);

  @override
  State<OTPVerificationPage> createState() => _OTPVerificationPageState();
}

class _OTPVerificationPageState extends State<OTPVerificationPage> {
  bool _n1 = true, _n2 = false, _n3 = false, _n4 = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("QR"),
          leading: Builder(
            builder: (BuildContext context) {
              return IconButton(
                icon: const Icon(Icons.menu),
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
                tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
              );
            },
          ),
          centerTitle: true,
          flexibleSpace: Container(
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: <Color>[
                  MainColors.secondColor,
                  MainColors.primaryColor
                ])),
          ),
        ),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: 150,
                  width: 300,
                  // margin: const EdgeInsets.only(top: 20),
                  padding: const EdgeInsets.only(left: 20, right: 20, top: 35),
                  color: Colors.white,
                  child: Center(
                      child: Column(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "OTP Verification",
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.w900),
                      ),

                      // Text(
                      //   "We sent your code to +1 898 860 ***\n This code will expired in ",
                      //   textAlign: TextAlign.center,
                      // style: TextStyle(
                      //     fontSize: 12,
                      //     fontWeight: FontWeight.w900,
                      //     color: Color.fromRGBO(150, 145, 145, 1)),
                      // ),
                      RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                              text:
                                  "We sent your code to +1 898 860 *** This code will expired in ",
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                  color: Color.fromRGBO(150, 145, 145, 1)),
                              children: <TextSpan>[
                                TextSpan(
                                    text: "00.13",
                                    style: TextStyle(
                                        color: Colors.deepOrange[400],
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500))
                              ]))
                    ],
                  )),
                ),
                SizedBox(
                  height: 50,
                ),
                Container(
                    width: 300,
                    margin: const EdgeInsets.only(top: 20),
                    // padding: const EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const SizedBox(),
                        SizedBox(
                          width: 50,
                          child: TextField(
                            keyboardType: TextInputType.number,
                            autofocus: true,
                            textAlign: TextAlign.center,
                            style: const TextStyle(fontSize: 15),
                            onChanged: (_) =>
                                FocusScope.of(context).nextFocus(),
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: const BorderSide(
                                        color: MainColors.primaryColor,
                                        width: 1,
                                        style: BorderStyle.solid))),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        SizedBox(
                          width: 50,
                          child: TextField(
                            keyboardType: TextInputType.number,
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 15),
                            autofocus: true,
                            onChanged: (_) =>
                                FocusScope.of(context).nextFocus(),
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: const BorderSide(
                                        color: Colors.grey,
                                        width: 1,
                                        style: BorderStyle.solid))),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        SizedBox(
                          width: 50,
                          child: TextField(
                            keyboardType: TextInputType.number,
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 15),
                            autofocus: true,
                            onChanged: (_) =>
                                FocusScope.of(context).nextFocus(),
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: const BorderSide(
                                        color: Colors.grey,
                                        width: 1,
                                        style: BorderStyle.solid))),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        SizedBox(
                          width: 50,
                          child: TextField(
                            keyboardType: TextInputType.number,
                            autofocus: true,
                            onChanged: (_) =>
                                FocusScope.of(context).nextFocus(),
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 15),
                            // autocorrect: _n4,
                            // maxLength: 1,
                            // autofocus: _n4,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: const BorderSide(
                                        color: Colors.grey,
                                        width: 1,
                                        style: BorderStyle.solid))),
                          ),
                        ),
                        const SizedBox(
                            // width: 10,
                            ),
                      ],
                    )),
                const SizedBox(
                  height: 100,
                ),
                TextButton(
                    style: TextButton.styleFrom(
                        backgroundColor: Colors.deepOrange[400],
                        padding: const EdgeInsets.only(
                            left: 105, right: 105, top: 15, bottom: 15),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20))),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const MapPage()));
                    },
                    child: const Text("Continue",
                        style: TextStyle(color: Colors.white, fontSize: 16))),
                const SizedBox(
                  height: 80,
                ),
                TextButton(
                    onPressed: () {},
                    child: Text(
                      "Resend OTP Code",
                      style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey[700],
                          decoration: TextDecoration.underline),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
