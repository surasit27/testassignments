import 'dart:convert';

import 'package:flutter/services.dart' as rooBundle;
import 'package:testassignments/model/data_model.dart';

class SearchApi {
  static Future<List<DataModel>> getDataSuggestions(String query) async {
    final response =
        await rooBundle.rootBundle.loadString('assets/example_data.json');
    final List result = json.decode(response);

    return result.map((json) => DataModel.fromJson(json)).where((searchdata) {
      final nameLower = searchdata.name.toLowerCase();
      final queryLower = query.toLowerCase();
      return nameLower.contains(queryLower);
    }).toList();
  }
}
