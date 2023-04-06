import 'package:demo/utility.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class ProgressContainer extends StatelessWidget {
  final String percentText;
  final String title;
  final String dec;
  final Color bgColor;
  final Color bodyColor;
  final double percent;
  const ProgressContainer({
    required this.percentText,
    required this.title,
    required this.dec,
    required this.bgColor,
    required this.bodyColor,
    required this.percent,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      margin: const EdgeInsets.only(bottom: 20),
      width: 150,
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(15),
        boxShadow: const [
          BoxShadow(color: Colors.black12, spreadRadius: 0, blurRadius: 5),
        ],
      ),
      child: InkWell(
        onTap: () {
          openDialogBox(context);
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CircularPercentIndicator(
              radius: 32.0,
              lineWidth: 5.0,
              percent: percent,
              center: Text(
                percentText,
                style: TextStyle(color: bodyColor),
              ),
              progressColor: bodyColor,
              backgroundColor: Colors.transparent,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 18,
                    color: bodyColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  dec,
                  style: TextStyle(
                    fontSize: 12,
                    color: bodyColor,
                    fontWeight: FontWeight.normal,
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

openDialogBox(BuildContext context) {
  Color textColor = HexColor("#2B275C");
  TextStyle buttonText = TextStyle(
    height: 1.5,
    fontSize: 18,
    fontWeight: FontWeight.bold,
    color: textColor,
  );
  return showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20))),
          insetPadding: const EdgeInsets.all(30.0),
          child: Padding(
            padding: const EdgeInsets.all(25),
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Align(
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 15),
                    child: InkWell(
                      onTap: () {Navigator.of(context).pop();},
                      child: Container(
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            color: Colors.grey.shade300,
                            borderRadius: BorderRadius.circular(12)),
                        child: Icon(
                          Icons.close,
                          color: textColor,
                        ),
                      ),
                    ),
                  ),
                ),
                Image.asset(
                  "assets/dialogImage.jpg",
                  height: 200,
                ),
                Text(
                  "Oh, you need\nsome rest!",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: textColor,
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  "Coffee machine can make\na cappuccino especially for you in\n 5 minutes. Do you want some coffee?",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    height: 1.5,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: textColor.withOpacity(.5),
                  ),
                ),
                SizedBox(height: 40),
                Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Container(
                        height: 60,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 3,
                            color: textColor,
                          ),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          "No, later",
                          style: buttonText,
                        ),
                      ),
                    ),
                    SizedBox(width: 20),
                    Expanded(
                      flex: 2,
                      child: Container(
                        alignment: Alignment.center,
                        height: 60,
                        decoration: BoxDecoration(
                          color: HexColor("#FFD364"),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          "Yes, thanks!",
                          style: buttonText,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        );
      });
}
