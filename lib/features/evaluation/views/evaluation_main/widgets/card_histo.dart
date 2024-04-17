import 'package:flutter/material.dart';

import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/ensembles/months.dart';
import '../../../../../utils/constants/sizes.dart';

class MhCardHisto extends StatelessWidget {
  const MhCardHisto({
    super.key,
    required this.date,
    required this.hstate,
    required this.nbsugg,
    required this.percentage,
    required this.icon,
    required this.mood, required this.color,
  });

  final DateTime date;
  final String hstate;
  final int percentage;
  final int nbsugg;
  final Color color;
  final IconData icon;
  final String mood;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.9,
      height: 90,
      decoration: BoxDecoration(
        color: MhColors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: const [
          BoxShadow(
            color: Color.fromARGB(20, 75, 52, 37),
            spreadRadius: 0,
            blurRadius: 16,
            offset: Offset(0, 8), // changes position of shadow
          ),
        ],
      ),
      child: 
      Stack(alignment: Alignment.center, children: [
        Flex(
          direction: Axis.horizontal,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const SizedBox(height: MhSizes.spaceBetweenItems / 4),

            /// Date
            Flexible(
              flex: 2,
              child: Container(
                height: 70,
                width: 50,
                decoration: BoxDecoration(
                  color: MhColors.light,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(monthDictionary[date.month]!,
                        style: const TextStyle(
                          fontSize: 12.0,
                          fontWeight: FontWeight.w400,
                          color: MhColors.blue,
                        )),
                    Text('${date.day}',
                        style: const TextStyle(
                          fontSize: 14.0,
                          fontWeight: FontWeight.w600,
                          color: MhColors.blue,
                        )),
                  ],
                ),
              ),
            ),
            const SizedBox(height: MhSizes.spaceBetweenItems / 4),

            /// Health State
            Flexible(
              flex: 4,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(hstate,
                      style: const TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w600,
                        color: MhColors.blue,
                      )),
                  const SizedBox(height: MhSizes.spaceBetweenItems / 2),
                  Stack(
                    children: [
                      Container(
                          width: 200,
                          height: 10,
                          decoration: BoxDecoration(
                              color: MhColors.grey,
                              borderRadius: BorderRadius.circular(20))),
                      Container(
                        width: 200 * (percentage / 100),
                        height: 10,
                        decoration: BoxDecoration(
                          color: MhColors.blue,
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: MhSizes.spaceBetweenItems / 4),
                  Row(
                    children: [
                      const Icon(
                        Icons.lightbulb_rounded,
                        color: MhColors.orange,
                        size: 15,
                      ),
                      Text(
                        '$nbsugg' ' Suggestions',
                        style: const TextStyle(
                          color: MhColors.orange,
                          fontSize: 12.0,
                          fontWeight: FontWeight.w400,
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),

            /// Mood and %
            Flexible(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(height: MhSizes.spaceBetweenItems / 2),
                  Container(
                  constraints: const BoxConstraints.tightFor(width: double.infinity),
                    height: 20,
                    decoration: BoxDecoration(
                      color: color,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(width: MhSizes.spaceBetweenItems / 8),
                        Icon(
                          icon,
                          color: MhColors.white,
                          size: 15,
                        ),
                        const SizedBox(width: 1),
                        Text(
                          mood,
                          style: const TextStyle(
                            fontSize: 11.0,
                            fontWeight: FontWeight.w500,
                            color: MhColors.white,
                          ),
                        ),
                        const SizedBox(width: MhSizes.spaceBetweenItems / 4),
                      ],
                    ),
                  ),
                  const SizedBox(height: MhSizes.spaceBetweenItems / 3),
                  Text('$percentage%',
                      style: const TextStyle(
                        fontSize: 22.0,
                        fontWeight: FontWeight.w600,
                        color: MhColors.blue,
                      ))
                ],
              ),
            ),
            const SizedBox(height: MhSizes.spaceBetweenItems / 4),
          ],
        )
      ]),
    );
  }
}
