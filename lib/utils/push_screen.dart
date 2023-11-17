import 'package:flutter/material.dart';

Future<dynamic> pushScreen(
    BuildContext context, Widget widget, double heightFactor) async {
  return await showModalBottomSheet(
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(20),
      ),
    ),
    // clipBehavior: Clip.antiAliasWithSaveLayer,
    isScrollControlled: true,
    // enableDrag: false,
    // backgroundColor: Colors.transparent,
    context: context,
    builder: (context) => Padding(
      padding: MediaQuery.of(context).viewInsets,
      child: FractionallySizedBox(
        heightFactor: heightFactor,
        child: widget,
      ),
    ),
  );
}
