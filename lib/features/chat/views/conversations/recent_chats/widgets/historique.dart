import 'package:flutter/material.dart';
import 'package:mentalhealth_app/utils/constants/colors.dart';
import 'package:mentalhealth_app/utils/constants/ensembles/months.dart';
import 'package:mentalhealth_app/utils/constants/sizes.dart';

class Historique extends StatelessWidget {
  const Historique({
    super.key,
    required this.date,
    required this.hstate,
    required this.nbMsg,
  });

  final DateTime date;
  final String hstate;
  final int nbMsg;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width * 0.9,
        height: 90,
        decoration: BoxDecoration(
          color: MhColors.white,
          borderRadius: BorderRadius.circular(30),
          boxShadow: const [
            BoxShadow(
              color: Color.fromARGB(20, 75, 52, 37),
              spreadRadius: 0,
              blurRadius: 16,
              offset: Offset(0, 8), // changes position of shadow
            ),
          ],
        ),
        child: Stack(alignment: Alignment.center, children: [
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
                  height: 60,
                  width: 55,
                  decoration: BoxDecoration(
                    color: MhColors.light,
                    borderRadius: BorderRadius.circular(35),
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
                  flex: 5,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(hstate,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: MhColors.blue,
                          )),
                      const SizedBox(height: MhSizes.spaceBetweenItems / 3),
                      Row(
                        children: [
                          const Icon(
                            Icons.chat,
                            color: MhColors.orange,
                          ),
                          const SizedBox(width: MhSizes.spaceBetweenItems / 2),
                          Text(
                            "$nbMsg Total",
                            style: TextStyle(fontSize: 12, color: MhColors.orange),
                            
                          )
                        ],
                      )
                    ],
                  )),
              Flexible(
                flex: 1,
                child: Center(
                  child: IconButton(
                    icon: const Icon(
                      Icons.arrow_forward_ios,
                      size: 30,
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    color: MhColors.blue,
                  ),
                ),
              )
            ],
          )
        ]));
  }
}
