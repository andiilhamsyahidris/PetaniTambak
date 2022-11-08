import 'package:flutter/material.dart';
import 'package:core/core.dart';

class BuildActivity extends StatelessWidget {
  const BuildActivity({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      controller: ScrollController(keepScrollOffset: true),
      children: [
        const SizedBox(
          height: 20,
        ),
        ListTile(
          tileColor: kSecondaryColor,
          contentPadding: const EdgeInsets.all(10.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          leading: Image.asset('assets/test.png'),
          title: Text(
            'Title',
            style: Theme.of(context)
                .textTheme
                .titleMedium!
                .copyWith(color: Colors.white, fontWeight: FontWeight.w500),
          ),
          subtitle: Text(
            'Lorem Ipsum dolor sit Amet',
            style: Theme.of(context)
                .textTheme
                .bodySmall!
                .copyWith(color: Colors.white),
          ),
        ),
      ],
    );
  }
}
