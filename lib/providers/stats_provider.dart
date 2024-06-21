import 'package:flutter/material.dart';
import '../models/stats_model.dart';

class StatsProvider with ChangeNotifier {
  List<BarDataModel> _dailyBarData = [];
  List<BarDataModel> _weeklyBarData = [];
  List<BarDataModel> _monthlyBarData = [];
  List<BarDataModel> _yearlyBarData = [];
  List<PieDataModel> _pieData = [];
  List<GoalDataModel> _goalsData = [];

  StatsProvider() {
    // Initialize with mock data
    _generateMockData();
  }

  List<BarDataModel> get dailyBarData => _dailyBarData;
  List<BarDataModel> get weeklyBarData => _weeklyBarData;
  List<BarDataModel> get monthlyBarData => _monthlyBarData;
  List<BarDataModel> get yearlyBarData => _yearlyBarData;
  List<PieDataModel> get pieData => _pieData;
  List<GoalDataModel> get goalsData => _goalsData;

  void _generateMockData() {
    _dailyBarData = List.generate(
        24,
        (index) =>
            BarDataModel(label: '$index', value: (index * 20).toDouble()));
    _weeklyBarData = List.generate(
        7,
        (index) => BarDataModel(
            label: _getWeekdayLabel(index), value: (index * 10).toDouble()));
    _monthlyBarData = List.generate(
        30,
        (index) => BarDataModel(
            label: '${index + 1}', value: ((index + 1) * 100).toDouble()));
    _yearlyBarData = List.generate(
        12,
        (index) => BarDataModel(
            label: _getMonthLabel(index),
            value: ((index + 1) * 2000).toDouble()));
    _pieData = [
      PieDataModel(label: 'Cardio', value: 40),
      PieDataModel(label: 'Strength', value: 30),
      PieDataModel(label: 'Yoga', value: 20),
      PieDataModel(label: 'Others', value: 10),
    ];
    _goalsData = [
      GoalDataModel(label: 'Goal 1', progress: 0.6),
      GoalDataModel(label: 'Goal 2', progress: 0.8),
      GoalDataModel(label: 'Goal 3', progress: 0.5),
      GoalDataModel(label: 'Goal 4', progress: 0.7),
    ];
  }

  String _getWeekdayLabel(int index) {
    switch (index) {
      case 0:
        return 'Mon';
      case 1:
        return 'Tue';
      case 2:
        return 'Wed';
      case 3:
        return 'Thu';
      case 4:
        return 'Fri';
      case 5:
        return 'Sat';
      case 6:
        return 'Sun';
      default:
        return '';
    }
  }

  String _getMonthLabel(int index) {
    switch (index) {
      case 0:
        return 'Jan';
      case 1:
        return 'Feb';
      case 2:
        return 'Mar';
      case 3:
        return 'Apr';
      case 4:
        return 'May';
      case 5:
        return 'Jun';
      case 6:
        return 'Jul';
      case 7:
        return 'Aug';
      case 8:
        return 'Sep';
      case 9:
        return 'Oct';
      case 10:
        return 'Nov';
      case 11:
        return 'Dec';
      default:
        return '';
    }
  }
}
