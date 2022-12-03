import 'package:cached_network_image/cached_network_image.dart';
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
          leading: CachedNetworkImage(
            imageUrl:
                'https://firebasestorage.googleapis.com/v0/b/petanitambak-cf143.appspot.com/o/test.png?alt=media&token=112fc3da-9dad-4598-88df-cbc5107a923b',
            placeholder: (context, url) => const CircularProgressIndicator(),
          ),
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
