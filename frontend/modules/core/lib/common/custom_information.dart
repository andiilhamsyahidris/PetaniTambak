import 'package:core/core.dart';
import 'package:flutter/material.dart';

class CustomInformation extends StatelessWidget {
  final String title;
  final String subtitle;

  const CustomInformation({
    super.key,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      decoration: BoxDecoration(
        color: Colors.red[200],
      ),
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Flexible(
            child: Text(
              title,
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: Colors.red[900],
                    fontWeight: FontWeight.w500,
                  ),
            ),
          ),
          const SizedBox(
            height: 4,
          ),
          SizedBox(
            height: 2,
            width: 180,
            child: Container(
              decoration: BoxDecoration(color: Colors.red[900]),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Flexible(
            child: Text(
              subtitle,
              style: Theme.of(context)
                  .textTheme
                  .bodySmall!
                  .copyWith(color: Colors.red[900]),
            ),
          ),
        ],
      ),
    );
  }
}
