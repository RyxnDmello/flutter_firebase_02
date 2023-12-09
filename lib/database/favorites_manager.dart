import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uuid/uuid.dart';

import '../models/weather_model.dart';
import '../models/favorite_model.dart';

import './account_manager.dart';

const _uuid = Uuid();

class _FavoritesManager {
  _FavoritesManager() : _account = null;

  DocumentReference? _account;

  Future<String?> addFavorite({
    required WeatherModel weather,
  }) async {
    _account = accountManager.firestoreAccount;

    if (_account == null) return null;

    final favoriteID = _uuid.v4();

    await _account!.collection("favorites").doc(favoriteID).set(
      {
        "location": weather.location.location,
        "latitude": weather.location.latitude,
        "longitude": weather.location.longitude,
        "timezone": weather.location.timezone,
      },
    );

    return favoriteID;
  }

  Future<bool> removeFavorite({required String favoriteID}) async {
    _account = accountManager.firestoreAccount;

    if (_account == null) return false;
    await _account!.collection("favorites").doc(favoriteID).delete();

    return true;
  }

  Future<List<FavoriteModel>?> favorites() async {
    _account = accountManager.firestoreAccount;

    if (_account == null) return null;

    final docs = await _account!.collection("favorites").get().then(
          (value) => value.docs,
        );

    final favorites = docs.map((doc) {
      return FavoriteModel(
        id: doc.id,
        location: doc.data()["location"],
        latitude: doc.data()["latitude"],
        longitude: doc.data()["longitude"],
        timezone: doc.data()["timezone"],
      );
    }) as List<FavoriteModel>;

    return favorites;
  }
}

final favoritesManager = _FavoritesManager();
