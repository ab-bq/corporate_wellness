import 'package:flutter/material.dart';

import '../Home.dart';

class EventWidget extends StatelessWidget {
  final String time;
  final String timeDes;
  final String title;
  final String des;
  final Color bgColor;
  final Color textColor;
  final List<String> avatarList;
  const EventWidget(
      {required this.title,
      required this.des,
      required this.time,
      required this.timeDes,
      required this.bgColor,
      required this.textColor,
      required this.avatarList,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double avatarRadius = 12;
    double avatarWidth = avatarRadius * 2;
    double avatarOverlapDistance = 10;
    return SizedBox(
      height: 120,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            time,
            style: TextStyle(color: textMainColor),
          ),
          const SizedBox(width: 20),
          Expanded(
              child: Container(
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
                color: bgColor, borderRadius: BorderRadius.circular(12)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                          color: textColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 15),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      des,
                      style: TextStyle(color: textColor),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Flexible(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: Stack(
                          alignment: AlignmentDirectional.centerStart,
                          children: [
                            ...List.generate(
                                avatarList.length > 4 ? 3 : avatarList.length,
                                (index) {
                              return Positioned(
                                left: index *
                                    (avatarWidth - avatarOverlapDistance),
                                child: CircleAvatar(
                                  radius: avatarRadius,
                                  backgroundImage:
                                      AssetImage(avatarList[index]),
                                ),
                              );
                            }).reversed,
                            if (avatarList.length > 4) ...[
                              Positioned(
                                  left: ((avatarWidth * 3) -
                                      avatarOverlapDistance * 2),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 4.0),
                                    child: Row(
                                      children: [
                                        Text("+",
                                            style: TextStyle(
                                              color: textColor.withOpacity(.5),
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold,
                                            )),
                                        const SizedBox(width: 4),
                                        CircleAvatar(
                                          radius: avatarRadius,
                                          backgroundColor:
                                              textColor.withOpacity(.3),
                                          child: Text(
                                            (avatarList.length - 3).toString(),
                                            style: TextStyle(
                                              color: textColor,
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ))
                            ]
                          ],
                        ),
                      ),
                      Text(
                        timeDes,
                        style: TextStyle(
                          color: textColor,
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )),
          const SizedBox(width: 20),
        ],
      ),
    );
  }
}
