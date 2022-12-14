import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:core/core.dart';
import 'package:monitoring/monitoring.dart';
import 'package:readmore/readmore.dart';

class DetailSaltPage extends StatefulWidget {
  static const routeName = '/detailSalt';

  const DetailSaltPage({super.key});
  @override
  DetailSaltPageState createState() => DetailSaltPageState();
}

class DetailSaltPageState extends State<DetailSaltPage> {
  MqttService mqttService = MqttService();

  @override
  void initState() {
    super.initState();
    mqttService.connect();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kMainColor,
      appBar: AppBar(
        backgroundColor: kSecondaryColor,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
        title: const Text(
          'Petani Tambak',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w400),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        Text(
                          'Salinitas',
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge!
                              .copyWith(color: Colors.white),
                        ),
                        Container(
                          padding: const EdgeInsets.all(20.0),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: kMainColor,
                              border:
                                  Border.all(color: kGreenColor, width: 2.0),
                              boxShadow: const [
                                BoxShadow(
                                    color: kSecondaryColor,
                                    blurRadius: 20.0,
                                    spreadRadius: 3.0)
                              ]),
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
                                  width: 100,
                                ),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              ValueListenableBuilder<String>(
                                builder: (context, value, child) {
                                  return Text(
                                    value,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium!
                                        .copyWith(color: Colors.white),
                                  );
                                },
                                valueListenable: mqttService.dataSalt,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        ReadMoreText(
                          'Kondisi salinitas pada tambakmu cukup rendah',
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall!
                              .copyWith(color: Colors.white),
                          trimLines: 4,
                          trimMode: TrimMode.Line,
                          trimCollapsedText: ' ... Selengkapnya',
                          trimExpandedText: ' Tutup',
                          lessStyle:
                              TextStyle(color: Colors.white.withOpacity(0.5)),
                          moreStyle:
                              TextStyle(color: Colors.white.withOpacity(0.5)),
                          delimiter: '',
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              const Text(
                'Aktivitas',
                style: TextStyle(color: Colors.white),
              ),
              const BuildActivity(),
            ],
          ),
        ),
      ),
    );
  }
}
