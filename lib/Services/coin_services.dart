import 'dart:convert';
import 'dart:developer';
import 'package:coin_identification/Model/artical_model.dart';
import 'package:coin_identification/Model/coin_model.dart';
import 'package:http/http.dart' as http;

class CoinServices {
  static const String api = "https://awamisolution.com/coins/api/coindetails.php";
  static const String articalapi = "https://awamisolution.com/coins/api/coinsarticle.php";

  Future<List<CoinModel>> fetchCoin() async {
    final response = await http.get(Uri.parse(api));

    try {
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        if (data['cointypes'] != null) {
          final List<dynamic> fromApi = data['cointypes'];
          return fromApi.map((json) => CoinModel.fromJson(json)).toList();
        } else {
          return [];
        }
      } else {
        throw Exception("Failed To Load ");
      }
    } catch (e) {
      throw Exception("Error $e");
    }
  }

  Future<ArticleModel> fetchArticles() async {
    final response = await http
        .get(Uri.parse("https://awamisolution.com/coins/api/coinsarticle.php"));

    if (response.statusCode == 200) {
      return ArticleModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load articles');
    }
  }
}
