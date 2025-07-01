import 'package:flutter/material.dart';

class ClubProvider extends ChangeNotifier {
  final List<Map<String, String>> _joinedClubs = [];

  List<Map<String, String>> get joinedClubs => _joinedClubs;

  void addClub(Map<String, String> club) {
    if (!_joinedClubs.contains(club)) {
      _joinedClubs.add(club);
      notifyListeners();
    }
  }
}
