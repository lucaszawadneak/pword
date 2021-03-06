import 'package:flutter/material.dart';
import 'package:get/get.dart';
import './GeneralButton.dart';

class StoreAlert {
  Future<void> alert(context, String alertTitle, Function handleTextChange,
      Function handleStore) async {
    await showDialog(
        context: context,
        builder: (BuildContext context) {
          return SimpleDialog(
            title: Text(alertTitle, style: TextStyle(fontSize: 18.0)),
            children: [
              Padding(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    children: [
                      SizedBox(
                        child: TextField(
                          onChanged: (text) => handleTextChange(text),
                          decoration:
                              InputDecoration(hintText: 'input_description'.tr),
                        ),
                        height: 50,
                        width: 300,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      GeneralButton("Ok", handleStore),
                    ],
                  ))
            ],
          );
        });
  }
}
