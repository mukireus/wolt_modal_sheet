import 'package:demo_ui_components/demo_ui_components.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(
  name: 'Default',
  path: 'Buttons',
  type: WoltCircularElevatedButton,
)
Widget buildWoltCircularElevatedButtonUseCase(BuildContext context) {
  return WoltCircularElevatedButton(
    icon: Icons.arrow_back_rounded,
    onPressed: () {},
  );
}
