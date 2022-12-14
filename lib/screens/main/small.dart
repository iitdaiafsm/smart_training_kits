import 'package:flutter/material.dart';
import 'package:smart_training_kits/helper/date_format_helper.dart';
import 'package:smart_training_kits/helper/responsive_widget.dart';
import 'package:smart_training_kits/helper/shared_files.dart';
import 'package:smart_training_kits/widgets/button.dart';

import '../../helper/color_helper.dart';
import '../../helper/styles.dart';
import '../../widgets/flutter_bounce.dart';
import 'controller.dart';

class Small extends StatelessWidget {
  final MainController controller;

  const Small({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width(context),
      color: Theme.of(context).scaffoldBackgroundColor,
      padding: EdgeInsets.symmetric(horizontal: AppMethods.DEFAULT_PADDING),
      alignment: Alignment.topCenter,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: AppMethods.DEFAULT_PADDING,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(
                "asset/images/logo.jpg",
                width: getWidth(20, context),
              ),
              Center(
                child: Text(
                  "FSM Smart Training Kits",
                  style: textStyle(
                    context: context,
                    isBold: true,
                    fontSize: FontSize.H1,
                  ),
                ),
              ),
              SizedBox(
                width: getWidth(20, context),
              ),
            ],
          ),
          SizedBox(
            height: AppMethods.DEFAULT_PADDING,
          ),
          controller.kitsList.isNotEmpty
              ? Wrap(
                  alignment: WrapAlignment.spaceBetween,
                  spacing: width(context) * 0.070,
                  runSpacing: height(context) * 0.0312,
                  children: List.generate(
                    controller.kitsList.length,
                    (index) => Bounce(
                      onPressed: () {
                        if (controller.kitsList[index].available ?? false) {
                          controller.selectedKitSlot =
                              controller.kitsList[index].id ?? -1;
                          controller.text = "Select training date";
                          controller.update();
                        }
                      },
                      child: Container(
                        width: width(context) * 0.189,
                        decoration: BoxDecoration(
                          color: controller.kitsList[index].id ==
                                  controller.selectedKitSlot
                              ? selectedColor
                              : (controller.kitsList[index].available ?? false)
                                  ? Theme.of(context).scaffoldBackgroundColor
                                  : notAvailableColor,
                          border: Border.all(
                            color: Theme.of(context).shadowColor,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        padding: EdgeInsets.symmetric(
                          vertical: height(context) * 0.0291,
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          controller.kitsList[index].name ?? "",
                          style: textStyle(
                            context: context,
                            fontSize: FontSize.H7,
                            color: controller.kitsList[index].id ==
                                    controller.selectedKitSlot
                                ? Theme.of(context).scaffoldBackgroundColor
                                : Theme.of(context).shadowColor,
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              : Text(
                  "Please wait... Kits Loading",
                  style: textStyle(
                    context: context,
                    isBold: true,
                    fontSize: FontSize.H6,
                    isItalic: true,
                  ),
                ),
          SizedBox(
            height: AppMethods.DEFAULT_PADDING * 2,
          ),
          if (controller.selectedKitSlot != -1) ...[
            Wrap(
              alignment: WrapAlignment.center,
              crossAxisAlignment: WrapCrossAlignment.center,
              runAlignment: WrapAlignment.center,
              spacing: 10,
              runSpacing: 10,
              children: List.generate(
                controller.dates.length,
                (index) {
                  var dateStr = DateFormatHelper.convertDateFromDate(
                      controller.dates[index], "dd/MM/yyyy");
                  bool isOffDay = controller.offDays.contains(dateStr);
                  return Bounce(
                    onPressed: () {
                      if (!isOffDay) {
                        controller.selectedDateTime = controller.dates[index];
                        controller.text = "Select training time";
                        controller.update();
                      }
                    },
                    child: Container(
                      width: ResponsiveWidget.isLargeScreen(context) ? 130 : 90,
                      decoration: BoxDecoration(
                        color: controller.dates[index] ==
                                controller.selectedDateTime
                            ? selectedColor
                            : (!isOffDay)
                                ? Theme.of(context).scaffoldBackgroundColor
                                : notAvailableColor,
                        border: Border.all(
                          color: Theme.of(context).shadowColor,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: EdgeInsets.symmetric(vertical: 5),
                      alignment: Alignment.center,
                      child: Column(
                        children: [
                          Text(
                            DateFormatHelper.convertDateFromDate(
                                controller.dates[index], "dd"),
                            style: textStyle(
                              context: context,
                              fontSize: FontSize.H5,
                              isBold: true,
                              color: controller.dates[index] ==
                                      controller.selectedDateTime
                                  ? Theme.of(context).scaffoldBackgroundColor
                                  : Theme.of(context).shadowColor,
                            ),
                          ),
                          Text(
                            DateFormatHelper.convertDateFromDate(
                                controller.dates[index], "MMMM"),
                            style: textStyle(
                              context: context,
                              fontSize: FontSize.H9,
                              color: controller.dates[index] ==
                                      controller.selectedDateTime
                                  ? Theme.of(context).scaffoldBackgroundColor
                                  : Theme.of(context).shadowColor,
                            ),
                          ),
                          Text(
                            DateFormatHelper.convertDateFromDate(
                                controller.dates[index], "EEE"),
                            style: textStyle(
                              context: context,
                              fontSize: FontSize.H5,
                              isBold: true,
                              color: controller.dates[index] ==
                                      controller.selectedDateTime
                                  ? Theme.of(context).scaffoldBackgroundColor
                                  : Theme.of(context).shadowColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(
              height: AppMethods.DEFAULT_PADDING * 2,
            ),
          ],
          if (controller.selectedKitSlot != -1 &&
              controller.selectedDateTime != DateTime(2000)) ...[
            controller.timeList.isNotEmpty
                ? Wrap(
                    alignment: WrapAlignment.center,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    runAlignment: WrapAlignment.center,
                    spacing: 10,
                    runSpacing: 10,
                    children: List.generate(
                      controller.timeList.length,
                      (index) => Bounce(
                        onPressed: () {
                          if (controller.timeList[index].available ?? false) {
                            controller.selectedTimeSlot =
                                controller.timeList[index].id ?? -1;
                            controller.text = "";
                            controller.update();
                          }
                        },
                        child: Container(
                          width: ResponsiveWidget.isLargeScreen(context)
                              ? 130
                              : 90,
                          decoration: BoxDecoration(
                            color: controller.timeList[index].id ==
                                    controller.selectedTimeSlot
                                ? selectedColor
                                : (controller.timeList[index].available ??
                                        false)
                                    ? Theme.of(context).scaffoldBackgroundColor
                                    : notAvailableColor,
                            border: Border.all(
                              color: Theme.of(context).shadowColor,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          padding: EdgeInsets.symmetric(vertical: 5),
                          alignment: Alignment.center,
                          child: Column(
                            children: [
                              Text(
                                controller.timeList[index].startTime ?? "",
                                style: textStyle(
                                  context: context,
                                  fontSize: FontSize.H5,
                                  isBold: true,
                                  color: controller.timeList[index].id ==
                                          controller.selectedTimeSlot
                                      ? Theme.of(context)
                                          .scaffoldBackgroundColor
                                      : Theme.of(context).shadowColor,
                                ),
                              ),
                              Text(
                                "To",
                                style: textStyle(
                                  context: context,
                                  fontSize: FontSize.H8,
                                  color: controller.timeList[index].id ==
                                          controller.selectedTimeSlot
                                      ? Theme.of(context)
                                          .scaffoldBackgroundColor
                                      : Theme.of(context).shadowColor,
                                ),
                              ),
                              Text(
                                controller.timeList[index].endTime ?? "",
                                style: textStyle(
                                  context: context,
                                  fontSize: FontSize.H5,
                                  isBold: true,
                                  color: controller.timeList[index].id ==
                                          controller.selectedTimeSlot
                                      ? Theme.of(context)
                                          .scaffoldBackgroundColor
                                      : Theme.of(context).shadowColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  )
                : Text(
                    "Please wait... Time Slots Loading",
                    style: textStyle(
                      context: context,
                      isBold: true,
                      fontSize: FontSize.H6,
                      isItalic: true,
                    ),
                  ),
            SizedBox(
              height: AppMethods.DEFAULT_PADDING * 2,
            ),
          ],
          controller.text.trim().isNotEmpty
              ? Text(
                  controller.text,
                  style: textStyle(
                    context: context,
                    isBold: true,
                    fontSize: FontSize.H6,
                    isItalic: true,
                  ),
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AppButton(
                      text: "Proceed",
                      onTap: () {
                        controller.saveOrder(context);
                      },
                      borderRadius: width(context),
                      horizontalPadding: width(context) * 0.05,
                      padding: height(context) * 0.015,
                      buttonBGColor: selectedColor,
                      isLoading: controller.isLoading,
                    ),
                  ],
                ),
        ],
      ),
    );
  }
}
