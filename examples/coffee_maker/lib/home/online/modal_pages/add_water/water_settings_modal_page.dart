import 'package:coffee_maker/home/online/modal_pages/add_water/widgets/water_quantity_temperature_input.dart';
import 'package:coffee_maker/home/online/modal_pages/add_water/widgets/water_source_list.dart';
import 'package:demo_ui_components/demo_ui_components.dart';
import 'package:flutter/material.dart';
import 'package:wolt_modal_sheet/wolt_modal_sheet.dart';

class WaterSettingsModalPage {
  WaterSettingsModalPage._();

  static WoltModalSheetPage build(
    String coffeeOrderId, {
    required VoidCallback onFinishAddingWater,
  }) {
    final buttonEnabledListener = ValueNotifier(false);
    const pageTitle = 'Water settings';

    return WoltModalSheetPage(
      stickyActionBar: ValueListenableBuilder<bool>(
        valueListenable: buttonEnabledListener,
        builder: (_, isEnabled, __) {
          return Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
            child: WoltElevatedButton(
              onPressed: onFinishAddingWater,
              enabled: isEnabled,
              child: const Text('Finish adding water'),
            ),
          );
        },
      ),
      pageTitle: const ModalSheetTitle(pageTitle),
      trailingNavBarWidget: const WoltModalSheetCloseButton(),
      leadingNavBarWidget: const WoltModalSheetBackButton(),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 120),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const ModalSheetSubtitle('Water quantity'),
            WaterQuantityTemperatureInput(
              suffixText: 'ml',
              controller: TextEditingController(),
              scrollPadding: const EdgeInsets.only(top: 100),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: WaterSourceList(
                onWaterSourceSelected: (source) =>
                    buttonEnabledListener.value = source.isSelected,
              ),
            ),
            const ModalSheetSubtitle('Water temperature'),
            WaterQuantityTemperatureInput(
              suffixText: '°C',
              controller: TextEditingController(),
              scrollPadding: const EdgeInsets.only(top: 100),
            ),
          ],
        ),
      ),
    );
  }
}
