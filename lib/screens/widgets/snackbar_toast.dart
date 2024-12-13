import 'package:flutter/material.dart';

ScaffoldFeatureController<SnackBar, SnackBarClosedReason> toast(
    String msg, context,
    {Color color = Colors.black87}) {
  return ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: color,
      content: Text(
        msg,
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
      ),
      behavior: SnackBarBehavior.fixed,
      duration: Duration(milliseconds: 1500),
      showCloseIcon: true,
      closeIconColor: Colors.white,
    ),
  );
}
