import 'package:flutter/material.dart';
import 'package:core/core.dart';

class BuildIndicator extends StatelessWidget {
  const BuildIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width - 100,
            height: 7,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [kYellowColor, kGreenColor, kRedColor]),
            ),
          ),
          const SizedBox(
            height: 5.0,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width - 75,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: 5,
                        height: 10,
                        decoration: const BoxDecoration(color: Colors.white),
                      ),
                      const SizedBox(
                        height: 5.0,
                      ),
                      const Text(
                        'Rendah',
                        style: TextStyle(color: Colors.white),
                      )
                    ],
                  ),
                ),
                Flexible(
                  child: Column(
                    children: [
                      Container(
                        width: 5,
                        height: 10,
                        decoration: const BoxDecoration(color: Colors.white),
                      ),
                      const SizedBox(
                        height: 5.0,
                      ),
                      const Text(
                        'Baik',
                        style: TextStyle(color: Colors.white),
                      )
                    ],
                  ),
                ),
                Flexible(
                  child: Column(
                    children: [
                      Container(
                        width: 5,
                        height: 10,
                        decoration: const BoxDecoration(color: Colors.white),
                      ),
                      const SizedBox(
                        height: 5.0,
                      ),
                      const Text(
                        'Tinggi',
                        style: TextStyle(color: Colors.white),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
