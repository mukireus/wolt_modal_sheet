import 'package:demo_ui_components/demo_ui_components.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(
  name: 'Default',
  path: 'Buttons',
  type: WoltElevatedButton,
)
Widget buildWoltCircularElevatedButtonUseCase(BuildContext context) {
  return Center(
    child: WoltElevatedButton(
      onPressed: () {},
      colorName: context.knobs.list(
        label: 'Color name',
        options: WoltColorName.values,
        initialOption: WoltColorName.blue,
      ),
      enabled: context.knobs.boolean(
        label: 'Enabled',
        initialValue: true,
      ),
      theme: context.knobs.list(
        label: 'Theme',
        options: WoltElevatedButtonTheme.values,
        initialOption: WoltElevatedButtonTheme.primary,
      ),
      height: context.knobs.double.slider(
        label: 'Height',
        initialValue: 56,
        min: 56,
        max: 100,
      ),
      child: Text(
        context.knobs.string(
          label: 'Label',
          initialValue: 'Cancel order',
        ),
      ),
    ),
  );
}
