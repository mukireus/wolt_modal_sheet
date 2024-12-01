import 'package:coffee_maker/home/online/modal_pages/grind/reject_order_reason.dart';
import 'package:demo_ui_components/demo_ui_components.dart';
import 'package:flutter/material.dart';
import 'package:wolt_modal_sheet/wolt_modal_sheet.dart';

class RejectOrderModalPage {
  RejectOrderModalPage._();

  static WoltModalSheetPage build({
    required String coffeeOrderId,
    required VoidCallback onRejectOrderTapped,
  }) {
    final buttonEnabledListener = ValueNotifier(false);

    return WoltModalSheetPage(
      stickyActionBar: ValueListenableBuilder<bool>(
        valueListenable: buttonEnabledListener,
        builder: (_, isEnabled, __) {
          return Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
            child: Builder(builder: (context) {
              return WoltElevatedButton(
                onPressed: onRejectOrderTapped,
                theme: WoltElevatedButtonTheme.secondary,
                colorName: WoltColorName.red,
                enabled: isEnabled,
                child: const Text('Reject'),
              );
            }),
          );
        },
      ),
      pageTitle: const ModalSheetTitle('Reject order'),
      trailingNavBarWidget: const WoltModalSheetCloseButton(),
      leadingNavBarWidget: const WoltModalSheetBackButton(),
      child: Padding(
        padding: const EdgeInsets.only(bottom: 120),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(bottom: 24),
                child: ModalSheetContentText(
                    'Please select a reason for rejecting the order'),
              ),
              WoltSelectionList<RejectOrderReason>.singleSelect(
                itemTileDataGroup: WoltSelectionListItemDataGroup(
                  group: RejectOrderReason.values
                      .map(
                        (e) => WoltSelectionListItemData(
                          title: e.title,
                          subtitle: e.subtitle,
                          leadingIcon: e.leadingIcon,
                          value: e,
                          isSelected: false,
                        ),
                      )
                      .toList(),
                ),
                onSelectionUpdateInSingleSelectionList: (selectedItemData) {
                  buttonEnabledListener.value = selectedItemData.isSelected;
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
