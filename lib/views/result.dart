import 'package:age_calculator/constant/color.dart';
import 'package:age_calculator/controller/age_calculator.dart';
import 'package:age_calculator/global/helper_function.dart';
import 'package:age_calculator/global/utils.dart';
import 'package:age_calculator/widget/app_name.dart';
import 'package:age_calculator/widget/custom_bottom_paint.dart';
import 'package:age_calculator/widget/custom_divider.dart';
import 'package:age_calculator/widget/custom_large_button.dart';
import 'package:age_calculator/widget/custom_list_tile.dart';
import 'package:age_calculator/widget/custom_top_paint.dart';
import 'package:age_calculator/widget/summary_card_builder.dart';
import 'package:flutter/material.dart';

class ResultPage extends StatefulWidget {
  const ResultPage({Key? key}) : super(key: key);

  @override
  _ResultPageState createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              child: Stack(
                children: [
                  CustomPaint(
                    size: Size(width, (350 * 0.31473214285714285).toDouble()),
                    painter: CustomTopPaint(),
                  ),
                  Positioned(
                    top: 30,
                    child: AppName(),
                  )
                ],
              ),
            ),
            Spacer(),
            Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    CustomListTile(
                      leading: "วันเกิดของคุณ:",
                      trailing: getFormatedDate(selectedBithDate),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    CustomListTile(
                      leading: "วันนี้วันที่:",
                      trailing: getFormatedDate(selectedCurrentDate),
                    ),
                  ],
                )),
            Spacer(),
            Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                padding: EdgeInsets.all(15),
                height: 120,
                decoration: BoxDecoration(
                    color: Color(0xff90dce2),
                    borderRadius: BorderRadius.circular(10)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("อายุ"),
                            Text.rich(
                              TextSpan(
                                children: [
                                  TextSpan(
                                    text: AgeCalculator.age(selectedBithDate,
                                            today: selectedCurrentDate)
                                        .years
                                        .toString(),
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 28),
                                  ),
                                  TextSpan(
                                    text: ' ปี',
                                    style: TextStyle(
                                        fontWeight: FontWeight.normal),
                                  ),
                                ],
                              ),
                            ),
                            Text(
                                "${AgeCalculator.age(selectedBithDate, today: selectedCurrentDate).months.toString()} เดือน | ${AgeCalculator.age(selectedBithDate, today: selectedCurrentDate).days.toString()} วัน"),
                          ],
                        ),
                      ),
                    ),
                    CustomDivider(),
                    Expanded(
                      child: Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("วันเกิดที่กำลังจะถึง"),
                            Text(
                              AgeCalculator.findDayName().toString(),
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 24),
                            ),
                            Text(
                                "${AgeCalculator.timeToNextBirthday(selectedBithDate, fromDate: selectedCurrentDate).months} เดือน | ${AgeCalculator.timeToNextBirthday(selectedBithDate, fromDate: selectedCurrentDate).days} วัน"),
                          ],
                        ),
                      ),
                    )
                  ],
                )),
            Spacer(),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                  color: Color(0xff90dce2),
                  borderRadius: BorderRadius.circular(10)),
              child: Column(
                children: [
                  Text(
                    "เวลาทั้งหมดแบบแยกประเภทเวลา",
                    style: TextStyle(
                        color: textColor,
                        fontSize: 18,
                        fontWeight: FontWeight.w700),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SummaryCardBuilder(
                                title: "ปี",
                                subTitle: AgeCalculator.age(selectedBithDate,
                                        today: selectedCurrentDate)
                                    .years
                                    .toString(),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              SummaryCardBuilder(
                                title: "สัปดาห์",
                                subTitle: (AgeCalculator.age(selectedBithDate,
                                                today: selectedCurrentDate)
                                            .years *
                                        52)
                                    .toString(),
                                fontSize: 14,
                              ),
                            ],
                          ),
                        ),
                        Container(
                          child: Column(
                            children: [
                              SummaryCardBuilder(
                                title: "เดือน",
                                subTitle: (AgeCalculator.age(selectedBithDate,
                                                today: selectedCurrentDate)
                                            .years *
                                        12)
                                    .toString(),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              SummaryCardBuilder(
                                title: "ชั่วโมง",
                                subTitle: AgeCalculator.hoursBetween(
                                        selectedBithDate, selectedCurrentDate)
                                    .toString(),
                                fontSize: 14,
                              ),
                            ],
                          ),
                        ),
                        Container(
                          child: Column(
                            children: [
                              SummaryCardBuilder(
                                title: "วัน",
                                subTitle: AgeCalculator.daysBetween(
                                        selectedBithDate, selectedCurrentDate)
                                    .toString(),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              SummaryCardBuilder(
                                title: "นาที",
                                subTitle: AgeCalculator.minutesBetween(
                                        selectedBithDate, selectedCurrentDate)
                                    .toString(),
                                fontSize: 14,
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            Container(
              child: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 80),
                    child: CustomPaint(
                      size: Size(width, (399 * 0.31473214285714285).toDouble()),
                      painter: CustomBottomPaint(),
                    ),
                  ),
                  Positioned(
                    top: 40,
                    child: CustomLargeButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      buttonLevel: "คำนวณอีกครั้ง",
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
