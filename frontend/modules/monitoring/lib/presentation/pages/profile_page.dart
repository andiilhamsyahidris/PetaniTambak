import 'package:auth/auth.dart';
import 'package:auth/service.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:core/core.dart';
import 'package:monitoring/monitoring.dart';
import 'package:readmore/readmore.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  static const routeName = '/profile';

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kMainColor,
      appBar: AppBar(
        backgroundColor: kSecondaryColor,
        shadowColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Service.signOut();
              Navigator.pop(context);
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => const LoginPage()));
            },
            icon: const Icon(
              Icons.logout,
              color: Colors.white,
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height / 3,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                color: kSecondaryColor,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(50.0),
                  bottomRight: Radius.circular(50.0),
                ),
              ),
              child: Column(
                children: [
                  const Hero(
                    tag: 'profile',
                    child: Icon(
                      Icons.account_circle_sharp,
                      color: Colors.white,
                      size: 150,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Petani Tambak',
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge!
                        .copyWith(color: Colors.white),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildMonitoring(),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    'Aktivitas',
                    style: TextStyle(color: Colors.white),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ListView(
                    shrinkWrap: true,
                    controller: ScrollController(keepScrollOffset: true),
                    children: [
                      ListTile(
                        tileColor: kSecondaryColor,
                        contentPadding: const EdgeInsets.all(10.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        leading: CachedNetworkImage(
                          imageUrl:
                              'https://firebasestorage.googleapis.com/v0/b/petanitambak-cf143.appspot.com/o/test.png?alt=media&token=112fc3da-9dad-4598-88df-cbc5107a923b',
                          placeholder: (context, url) =>
                              const CircularProgressIndicator(),
                        ),
                        title: Row(
                          children: [
                            Text(
                              'Title',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium!
                                  .copyWith(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            CachedNetworkImage(
                              imageUrl:
                                  'https://firebasestorage.googleapis.com/v0/b/petanitambak-cf143.appspot.com/o/mark.png?alt=media&token=044531dc-3623-4fbc-9fc5-0d7219a84ee1',
                              placeholder: (context, url) =>
                                  const CircularProgressIndicator(),
                              width: 15,
                            ),
                            Text(
                              ' Salinitas',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .copyWith(
                                      color: kYelllow2Color,
                                      fontWeight: FontWeight.w300),
                            ),
                          ],
                        ),
                        subtitle: Text(
                          'Lorem Ipsum dolor sit Amet',
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall!
                              .copyWith(color: Colors.white),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
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
                          placeholder: (context, url) =>
                              const CircularProgressIndicator(),
                        ),
                        title: Row(
                          children: [
                            Text(
                              'Title',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium!
                                  .copyWith(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            CachedNetworkImage(
                              imageUrl:
                                  'https://firebasestorage.googleapis.com/v0/b/petanitambak-cf143.appspot.com/o/mark.png?alt=media&token=044531dc-3623-4fbc-9fc5-0d7219a84ee1',
                              placeholder: (context, url) =>
                                  const CircularProgressIndicator(),
                              width: 15,
                            ),
                            Text(
                              ' pH air',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .copyWith(
                                      color: kYelllow2Color,
                                      fontWeight: FontWeight.w300),
                            ),
                          ],
                        ),
                        subtitle: Text(
                          'Lorem Ipsum dolor sit Amet ',
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall!
                              .copyWith(color: Colors.white),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
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
                          placeholder: (context, url) =>
                              const CircularProgressIndicator(),
                        ),
                        title: Row(
                          children: [
                            Text(
                              'Title',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium!
                                  .copyWith(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            CachedNetworkImage(
                              imageUrl:
                                  'https://firebasestorage.googleapis.com/v0/b/petanitambak-cf143.appspot.com/o/mark.png?alt=media&token=044531dc-3623-4fbc-9fc5-0d7219a84ee1',
                              placeholder: (context, url) =>
                                  const CircularProgressIndicator(),
                              width: 15,
                            ),
                            Text(
                              ' pH air',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .copyWith(
                                      color: kYelllow2Color,
                                      fontWeight: FontWeight.w300),
                            ),
                          ],
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
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  SizedBox _buildMonitoring() {
    return SizedBox(
      height: 170,
      child: ListView(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        controller: ScrollController(keepScrollOffset: true),
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width - 15,
            child: InkWell(
              onTap: () {
                Navigator.pushNamed(context, DetailPage.routeName);
              },
              child: Card(
                color: kSecondaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(22.0),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: kMainColor,
                            border: Border.all(color: kGreenColor, width: 2.0)),
                        child: Column(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(10.0),
                              decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: kSecondaryColor,
                                  boxShadow: [
                                    BoxShadow(
                                        color: kSecondaryColor,
                                        blurRadius: 10.0,
                                        spreadRadius: 3.0)
                                  ]),
                              child: CachedNetworkImage(
                                imageUrl:
                                    'https://firebasestorage.googleapis.com/v0/b/petanitambak-cf143.appspot.com/o/thermometer.png?alt=media&token=c923d6cb-b5bc-4d49-9399-8b8001e54baa',
                                placeholder: (context, url) =>
                                    const CircularProgressIndicator(),
                                width: 50,
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            const Text(
                              '27\u00b0',
                              style: TextStyle(color: Colors.white),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        width: 25,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              'Suhu',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge!
                                  .copyWith(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 14, 16, 0),
                              child: ReadMoreText(
                                'Lorem ipsum dolor sit amet',
                                trimLines: 4,
                                trimMode: TrimMode.Line,
                                trimCollapsedText: ' ... Selengkapnya',
                                trimExpandedText: ' Tutup',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall!
                                    .copyWith(color: Colors.white),
                                lessStyle: TextStyle(
                                    color: Colors.white.withOpacity(0.5)),
                                moreStyle: TextStyle(
                                    color: Colors.white.withOpacity(0.5)),
                                delimiter: '',
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width - 20,
            child: InkWell(
              onTap: () {
                Navigator.pushNamed(context, DetailPage.routeName);
              },
              child: Card(
                color: kSecondaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(22.0),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: kMainColor,
                            border:
                                Border.all(color: kYellowColor, width: 2.0)),
                        child: Column(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(10.0),
                              decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: kSecondaryColor,
                                  boxShadow: [
                                    BoxShadow(
                                        color: kSecondaryColor,
                                        blurRadius: 10.0,
                                        spreadRadius: 3.0)
                                  ]),
                              child: CachedNetworkImage(
                                imageUrl:
                                    'https://firebasestorage.googleapis.com/v0/b/petanitambak-cf143.appspot.com/o/salt.png?alt=media&token=3bf63aec-6172-42cf-990a-8a564d7429c9',
                                placeholder: (context, url) =>
                                    const CircularProgressIndicator(),
                                width: 50,
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            const Text(
                              '27\u00b0',
                              style: TextStyle(color: Colors.white),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        width: 25,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              'Salinitas',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge!
                                  .copyWith(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 14, 16, 0),
                              child: ReadMoreText(
                                'Lorem ipsum dolor sit amet',
                                trimLines: 4,
                                trimMode: TrimMode.Line,
                                trimCollapsedText: ' ... Selengkapnya',
                                trimExpandedText: ' Tutup',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall!
                                    .copyWith(color: Colors.white),
                                lessStyle: TextStyle(
                                    color: Colors.white.withOpacity(0.5)),
                                moreStyle: TextStyle(
                                    color: Colors.white.withOpacity(0.5)),
                                delimiter: '',
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width - 20,
            child: InkWell(
              onTap: () {
                Navigator.pushNamed(context, DetailPage.routeName);
              },
              child: Card(
                color: kSecondaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(22.0),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: kMainColor,
                            border: Border.all(color: kRedColor, width: 2.0)),
                        child: Column(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(10.0),
                              decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: kSecondaryColor,
                                  boxShadow: [
                                    BoxShadow(
                                        color: kSecondaryColor,
                                        blurRadius: 10.0,
                                        spreadRadius: 3.0)
                                  ]),
                              child: CachedNetworkImage(
                                imageUrl:
                                    'https://firebasestorage.googleapis.com/v0/b/petanitambak-cf143.appspot.com/o/ph.png?alt=media&token=392979fc-0a8d-432a-84d3-f112fe8daae0',
                                placeholder: (context, url) =>
                                    const CircularProgressIndicator(),
                                width: 50,
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            const Text(
                              '27\u00b0',
                              style: TextStyle(color: Colors.white),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        width: 25,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              'pH air',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge!
                                  .copyWith(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 14, 16, 0),
                              child: ReadMoreText(
                                'Lorem ipsum dolor sit amet',
                                trimLines: 4,
                                trimMode: TrimMode.Line,
                                trimCollapsedText: ' ... Selengkapnya',
                                trimExpandedText: ' Tutup',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall!
                                    .copyWith(color: Colors.white),
                                lessStyle: TextStyle(
                                    color: Colors.white.withOpacity(0.5)),
                                moreStyle: TextStyle(
                                    color: Colors.white.withOpacity(0.5)),
                                delimiter: '',
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
