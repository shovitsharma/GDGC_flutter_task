import 'dart:convert';

import 'package:college_app/secret_key.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomeCards extends StatefulWidget {
  const HomeCards({super.key});

  @override
  State<HomeCards> createState() => _HomeCardsState();
}

class _HomeCardsState extends State<HomeCards> {
  @override
  void initState() {
    super.initState();
    getCurrentWeather();
  }

  Future<Map<String, dynamic>> getCurrentWeather() async {
    try {
      String cityName = 'Silchar, IN';
      final res = await http.get(
        Uri.parse(
          'https://api.openweathermap.org/data/2.5/forecast?q=$cityName&appid=$secretKey&units=metric',
        ),
      );
      final data = jsonDecode(res.body);
      if (data['cod'].toString() != '200') {
        throw data['message'];
      }
      return data;
    } catch (e) {
      throw e.toString();
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getCurrentWeather(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator.adaptive());
        }
        if (snapshot.hasError) {
          return Center(child: Text(snapshot.error.toString()));
        }

        final data = snapshot.data!;
        final current = data['list'][0];
        final currentTemp = current['main']['temp'];
        final currentSky = current['weather'][0]['main'];
        final cityname = data['city']['name'];

        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.27,
                    child: Text(
                      cityname,
                      textAlign: TextAlign.right,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              Card(
                elevation: 6,
                child: Container(
                  width: 150,
                  padding: const EdgeInsets.all(8.0),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                  ),
                  child: Column(
                    children: [
                      Text(
                        currentTemp.toString(),
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 8),
                      Icon(
                        currentSky == 'Clouds' || currentSky=='Rain' ?
                            Icons.cloud : Icons.sunny,
                        size: 32,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        currentSky.toString(),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 24),

              
              const Text(
                'Notice Board',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              SizedBox(
                height: 150,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 5, 
                  itemBuilder: (context, index) {
                    return Container(
                      width: 220,
                      margin: const EdgeInsets.only(right: 12),
                      child: Card(
                        elevation: 4,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Notice ${index + 1}',
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                              const SizedBox(height: 6),
                              const Text(
                                'Notice preview. For more Info. go to Events.',
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
