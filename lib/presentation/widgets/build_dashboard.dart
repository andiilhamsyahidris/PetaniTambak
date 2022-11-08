import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:core/core.dart';

class BuildDashboard extends StatefulWidget {
  const BuildDashboard({super.key});

  @override
  State<BuildDashboard> createState() => _BuildDashboardState();
}

class _BuildDashboardState extends State<BuildDashboard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: kSecondaryColor, borderRadius: BorderRadius.circular(20.0)),
      padding: const EdgeInsets.all(20.0),
      child: Row(
        children: [
          SizedBox(
            width: 180,
            height: 80,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                timeNow(),
                Expanded(
                  child: Text(
                    'Petani Tambak',
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        color: Colors.white, fontWeight: FontWeight.w500),
                  ),
                ),
                Expanded(
                  child: Text(
                    'Bagaimana kondisi tambakmu hari ini?',
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall!
                        .copyWith(color: Colors.white.withOpacity(0.5)),
                  ),
                )
              ],
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          Expanded(
            child: SvgPicture.asset(
              'assets/dashboard.svg',
              width: 140,
            ),
          ),
        ],
      ),
    );
  }

  Flexible timeNow() {
    var time = DatetimeHelper.dateTimeScheduled();
    if (time.hour >= 6 && time.hour < 10) {
      return Flexible(
        child: Text(
          'Selamat Pagi',
          style: Theme.of(context)
              .textTheme
              .bodySmall!
              .copyWith(color: Colors.white.withOpacity(0.5)),
        ),
      );
    } else if (time.hour >= 10 && time.hour < 15) {
      return Flexible(
        child: Text(
          'Selamat Siang',
          style: Theme.of(context)
              .textTheme
              .bodySmall!
              .copyWith(color: Colors.white.withOpacity(0.5)),
        ),
      );
    } else if (time.hour >= 15 && time.hour < 18) {
      return Flexible(
        child: Text(
          'Selamat Sore',
          style: Theme.of(context)
              .textTheme
              .bodySmall!
              .copyWith(color: Colors.white.withOpacity(0.5)),
        ),
      );
    } else {
      return Flexible(
        child: Text(
          'Selamat Malam',
          style: Theme.of(context)
              .textTheme
              .bodySmall!
              .copyWith(color: Colors.white.withOpacity(0.5)),
        ),
      );
    }
  }
}
