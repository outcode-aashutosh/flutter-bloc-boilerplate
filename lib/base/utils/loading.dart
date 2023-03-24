import 'package:flutter/material.dart';

class CustomLoaderDialog {
  Widget showLoaderDialog() {
    return Stack(
      children: const [
        Opacity(
          opacity: 0.5,
          child: ModalBarrier(
            dismissible: false,
            color: Colors.black,
          ),
        ),
        Center(
          child: Card(
            elevation: 8,
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: CircularProgressIndicator.adaptive(),
            ),
          ),
        )
      ],
    );
  }
}

Widget showLoaderDialog() {
  return Stack(
    children: const [
      Opacity(
        opacity: 0.7,
        child: ModalBarrier(
          dismissible: false,
          color: Colors.black,
        ),
      ),
      Center(
        child: Card(
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: CircularProgressIndicator(),
          ),
        ),
      )
    ],
  );
}
