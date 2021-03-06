import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/safe.dart';
import '../widgets/SafeBox.dart';
import '../widgets/Alert.dart';
import '../widgets/DeleteAlert.dart';
import '../widgets/SecondaryButton.dart';

class Safe extends StatefulWidget {
  @override
  SafeState createState() => SafeState();
}

class SafeState extends State<Safe> {
  final SafeController controller = Get.put(SafeController());

  @override
  Widget build(BuildContext context) {
    void handleGoBack() {
      Navigator.pop(context);
    }

    double width = MediaQuery.of(context).size.width;

    void handleDelete(int index) {
      controller.sub(index);
      Navigator.pushNamed(context, '/');
      Alert().alert(context, 'confirm_delete'.tr);
    }

    void handleConfirmDelete(int index) {
      DeleteAlert().alert(context, 'ask_delete'.tr, () => handleDelete(index));
    }

    return Scaffold(
        body: Center(
            child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: EdgeInsets.only(top: 60),
          child: Text(
            'pass_safe'.tr,
            style: TextStyle(
                fontFamily: "OpenSans",
                fontWeight: FontWeight.w700,
                fontSize: 21.0),
          ),
        ),
        SecondaryButton('back'.tr, handleGoBack),
        Container(
            child: Expanded(
          flex: 1,
          child: Padding(
            child: GetBuilder<SafeController>(
              builder: (item) => ListView.builder(
                itemCount: item.passwords.length,
                itemBuilder: (_, int index) {
                  return SafeBox(
                      item.passwords[index].description,
                      item.passwords[index].password,
                      () => handleConfirmDelete(index));
                },
              ),
            ),
            padding: EdgeInsets.symmetric(horizontal: 30),
          ),
        )),
      ],
    )));
  }
}
