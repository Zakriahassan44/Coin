import 'package:coin_identification/Model/coin_model.dart';
import 'package:coin_identification/Utils/toast.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class FavoriteCoinsProvider with ChangeNotifier {
  final Box<CoinModel> _box = Hive.box<CoinModel>("coinCollection");

  List<CoinModel> getFavorite() {
    return _box.values.toList();
  }

  bool isFavorite(CoinModel model) {
    return _box.containsKey(model.id);
  }

  void toggleFavorite(CoinModel model, BuildContext context) {
    if (isFavorite(model)) {
      _box.delete(model.id);
      customToast(context, "Removed Successfully");
    } else {
      _box.put(model.id, model);
      customToast(context, "Added to Collection Successfully");
    }
    notifyListeners();
  }
}
