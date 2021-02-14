import 'dart:async';
import 'dart:convert';
import 'package:NASAAstronomyPictureoftheDay/core/base/constants.dart';
import 'package:NASAAstronomyPictureoftheDay/core/models/apod.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:NASAAstronomyPictureoftheDay/core/services/file_utils.dart';

final String apiUrl = 'https://api.nasa.gov/planetary/apod?api_key=$API_KEY';

final DateFormat formatter = DateFormat('yyyy-MM-dd');

final String daysBefore = formatter.format(DateTime.now().subtract(Duration(days: 6)));
final String currentDay = formatter.format(DateTime.now());

final FileUtils fileUtils = FileUtils();

Future<List<Apod>> fetchApod(http.Client client) async {
  final response = await client.get('$apiUrl&start_date=$daysBefore&end_date=$currentDay&thumbs=true');
  return compute(parseApod, response.body);
}

List<Apod> parseApod(String responseBody) {
  final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();
  return parsed.map<Apod>((json) => Apod.fromJson(json)).toList();
}
