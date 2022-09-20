// import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:letmeyoureyes/constants/colors.dart';
import 'package:letmeyoureyes/screens/MapPage.dart';
import 'package:qr_flutter/qr_flutter.dart';
// import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class QRPage extends StatefulWidget {
  bool passed = false;
  // const QRPage({Key? key}) : super(key: key);

  @override
  State<QRPage> createState() => QRPageState();
}

class QRPageState extends State<QRPage> {
  var result = "";
  TextEditingController controller = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    var ins = FirebaseFirestore.instance.collection("users");
    print(ins.snapshots().first);
    // widget.passed =
    //     FirebaseFirestore.instance.collection("users").doc("passed");
    if (widget.passed == true) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const MapPage()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // title: const Text("QR"),
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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //todo: qr code
            // Image.asset(
            //   "",
            //   width: 150,
            //   height: 150,
            // ),
            const Text(
              "your QR code",
              style: TextStyle(
                  color: MainColors.secondColor,
                  fontSize: 15,
                  fontWeight: FontWeight.w700),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 10,
            ),
            QrImage(
              data: controller.text,
              version: QrVersions.auto,
              size: 140,
              gapless: true,
              backgroundColor: Colors.white,
              errorStateBuilder: (cxt, err) {
                return const Center(
                  child: Text(
                    "Uh oh! Something went wrong...",
                    textAlign: TextAlign.center,
                  ),
                );
              },
              embeddedImage:
                  const AssetImage('assets/images/my_embedded_image.png'),
              embeddedImageStyle: QrEmbeddedImageStyle(
                size: Size(80, 80),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            // ElevatedButton(
            //
            //    onPressed: () {}, child: const Text("غيِّر الرَّمز")),
            Stack(
              children: [
                Center(
                  child: Container(
                    height: 44,
                    width: 100.5,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                      color: MainColors.secondColor,
                    ),
                  ),
                ),
                Center(
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: const Color.fromRGBO(184, 178, 178, 1),
                            width: 1),
                        borderRadius: BorderRadius.circular(5)),
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: MainColors.primaryColor,
                            shadowColor: MainColors.secondColor,
                            elevation: 9.0,
                            padding: const EdgeInsets.only(
                                top: 20, bottom: 20, left: 15, right: 15)),
                        onPressed: () {
                          print(controller.value.text);
                        },
                        child: const Text(
                          "Change QR",
                          style: TextStyle(color: Colors.white, fontSize: 14),
                          textAlign: TextAlign.center,
                        )),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              "Try Again",
              style: TextStyle(
                  color: MainColors.secondColor,
                  fontSize: 15,
                  fontWeight: FontWeight.w700),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 20,
            ),

            Stack(
              children: [
                Center(
                  child: Container(
                    height: 44,
                    width: 95.0,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                      color: MainColors.secondColor,
                    ),
                  ),
                ),
                Center(
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: const Color.fromRGBO(184, 178, 178, 1),
                            width: 1),
                        borderRadius: BorderRadius.circular(5)),
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: MainColors.primaryColor,
                            shadowColor: MainColors.secondColor,
                            elevation: 9.0,
                            padding: const EdgeInsets.only(
                                top: 20, bottom: 20, left: 25, right: 25)),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text(
                          "Cancel",
                          style: TextStyle(color: Colors.white, fontSize: 14),
                          textAlign: TextAlign.center,
                        )),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void letToPass({required bool passed, var location}) async {
    final docUser =
        FirebaseFirestore.instance.collection("users").doc("passed");

    final json = {
      'passed': passed,
      'location': location,
    };

    /// Create document and write data to firebase
    await docUser.set(json);
  }
}
