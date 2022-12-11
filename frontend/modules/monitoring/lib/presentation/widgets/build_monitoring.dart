import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:core/core.dart';
import 'package:monitoring/monitoring.dart';
import 'package:mqtt_client/mqtt_client.dart';
import 'package:readmore/readmore.dart';

class BuildMonitoring extends StatefulWidget {
  const BuildMonitoring({super.key});

  @override
  State<BuildMonitoring> createState() => _BuildMonitoringState();
}

class _BuildMonitoringState extends State<BuildMonitoring> {
  MqttService mqttService = MqttService();

  @override
  void initState() {
    super.initState();
    mqttService.connect();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 600,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Monitoring',
            style: Theme.of(context)
                .textTheme
                .titleSmall!
                .copyWith(color: Colors.white),
          ),
          const SizedBox(
            height: 20,
          ),
          ListView(
            shrinkWrap: true,
            controller: ScrollController(keepScrollOffset: true),
            children: [
              InkWell(
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
                          padding: const EdgeInsets.all(20.0),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: kMainColor,
                              border:
                                  Border.all(color: kGreenColor, width: 2.0)),
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
                              ValueListenableBuilder<String>(
                                builder: (context, value, child) {
                                  return Text(
                                    '36.35\u00b0',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium!
                                        .copyWith(color: Colors.white),
                                  );
                                },
                                valueListenable: mqttService.dataTemp,
                              ),
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
                                padding:
                                    const EdgeInsets.fromLTRB(0, 14, 16, 0),
                                child: ReadMoreText(
                                  'Kondisi suhu pada tambakmu cukup baik',
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
              const SizedBox(
                height: 5,
              ),
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, DetailSaltPage.routeName);
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
                        Flexible(
                          child: Container(
                            padding: const EdgeInsets.all(20.0),
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: kMainColor,
                                border:
                                    Border.all(color: kGreenColor, width: 2.0)),
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
                                )
                              ],
                            ),
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
                                padding:
                                    const EdgeInsets.fromLTRB(0, 14, 16, 0),
                                child: ReadMoreText(
                                  'Kondisi salinitas pada tambakmu cukup baik',
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
            ],
          ),
        ],
      ),
    );
  }
}
