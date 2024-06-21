import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:workouit/models/stats_model.dart';
import '../providers/stats_provider.dart';

class StatsScreen extends StatefulWidget {
  const StatsScreen({Key? key}) : super(key: key);

  @override
  _StatsScreenState createState() => _StatsScreenState();
}

class _StatsScreenState extends State<StatsScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => StatsProvider(),
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Theme.of(context).colorScheme.background,
          appBar: AppBar(
            backgroundColor: Theme.of(context).colorScheme.primary,
            title: Text('Your Statistics',
                style:
                    TextStyle(color: Theme.of(context).colorScheme.secondary)),
            bottom: TabBar(
              controller: _tabController,
              indicatorColor: Theme.of(context).colorScheme.secondary,
              labelColor: Theme.of(context).colorScheme.secondary,
              unselectedLabelColor: Theme.of(context).colorScheme.onPrimary,
              tabs: [
                Tab(text: 'Daily'),
                Tab(text: 'Weekly'),
                Tab(text: 'Monthly'),
                Tab(text: 'Yearly'),
              ],
            ),
          ),
          body: TabBarView(
            controller: _tabController,
            children: [
              StatsContent(timeFrame: 'Daily'),
              StatsContent(timeFrame: 'Weekly'),
              StatsContent(timeFrame: 'Monthly'),
              StatsContent(timeFrame: 'Yearly'),
            ],
          ),
        ),
      ),
    );
  }
}

class StatsContent extends StatelessWidget {
  final String timeFrame;

  const StatsContent({Key? key, required this.timeFrame}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final statsProvider = Provider.of<StatsProvider>(context);

    List<BarDataModel> barData;
    if (timeFrame == 'Daily') {
      barData = statsProvider.dailyBarData;
    } else if (timeFrame == 'Weekly') {
      barData = statsProvider.weeklyBarData;
    } else if (timeFrame == 'Monthly') {
      barData = statsProvider.monthlyBarData;
    } else {
      barData = statsProvider.yearlyBarData;
    }

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Stat Cards Section
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              StatCard(
                title: 'Workouts',
                value: '120',
                width: MediaQuery.of(context).size.width / 2.5,
              ),
              StatCard(
                title: 'Total Duration',
                value: '50 hrs',
                width: MediaQuery.of(context).size.width / 2.5,
              ),
            ],
          ),
          SizedBox(height: 20),

          // Progress Over Time Section
          Card(
            color: Color(0xFF3C3C3C), // Slightly lighter Dark Gray background
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Progress Over Time',
                    style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                          color: Theme.of(context)
                              .colorScheme
                              .secondary, // Neon Yellow
                        ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    height: 200,
                    child:
                        LineChart(_buildLineChart(context, barData, timeFrame)),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 20),

          // Workout Breakdown Section
          Card(
            color: Color(0xFF3C3C3C), // Slightly lighter Dark Gray background
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Workout Breakdown',
                    style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                          color: Theme.of(context)
                              .colorScheme
                              .secondary, // Neon Yellow
                        ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    height: 200,
                    child: PieChart(
                      PieChartData(
                        sections: statsProvider.pieData.map((data) {
                          return PieChartSectionData(
                            color: data.label == 'Cardio'
                                ? Theme.of(context).colorScheme.secondary
                                : data.label == 'Strength'
                                    ? Theme.of(context).colorScheme.primary
                                    : data.label == 'Yoga'
                                        ? Color(0xFF757575) // Medium Gray
                                        : Color(0xFF9E9E9E), // Light Gray
                            value: data.value,
                            title: data.label,
                            titleStyle: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                  color: data.label == 'Cardio'
                                      ? Theme.of(context)
                                          .colorScheme
                                          .onSecondary
                                      : Theme.of(context).colorScheme.onPrimary,
                                  fontWeight: FontWeight.bold,
                                ),
                          );
                        }).toList(),
                        sectionsSpace: 2,
                        centerSpaceRadius: 40,
                        borderData: FlBorderData(
                          show: false,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 20),

          // Goals Section
          Card(
            color: Color(0xFF3C3C3C), // Slightly lighter Dark Gray background
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Goals',
                    style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                          color: Theme.of(context)
                              .colorScheme
                              .secondary, // Neon Yellow
                        ),
                  ),
                  SizedBox(height: 10),
                  GridView.count(
                    shrinkWrap: true,
                    crossAxisCount: 2,
                    childAspectRatio: 1.5,
                    children: statsProvider.goalsData.map((data) {
                      return GoalProgressIndicator(
                        label: data.label,
                        progress: data.progress,
                      );
                    }).toList(),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  LineChartData _buildLineChart(
      BuildContext context, List<BarDataModel> data, String timeFrame) {
    List<Color> gradientColors = [
      Colors.blue.withOpacity(0.1),
      Colors.blue,
    ];

    return LineChartData(
      gridData: FlGridData(
        show: true,
        drawVerticalLine: true,
        horizontalInterval: timeFrame == 'Daily'
            ? 100
            : timeFrame == 'Weekly'
                ? 1
                : timeFrame == 'Monthly'
                    ? 1000
                    : 5000,
        verticalInterval: timeFrame == 'Daily'
            ? 1
            : timeFrame == 'Weekly'
                ? 1
                : timeFrame == 'Monthly'
                    ? 1
                    : 1,
        getDrawingHorizontalLine: (value) {
          return FlLine(
            color: Colors.grey.withOpacity(0.5),
            strokeWidth: 1,
          );
        },
        getDrawingVerticalLine: (value) {
          return FlLine(
            color: Colors.grey.withOpacity(0.5),
            strokeWidth: 1,
          );
        },
      ),
      titlesData: FlTitlesData(
        show: true,
        rightTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 30,
            interval: 1,
            getTitlesWidget: (value, meta) {
              const style = TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 12,
                color: Colors.white,
              );
              Widget text;
              if (timeFrame == 'Daily') {
                switch (value.toInt()) {
                  case 0:
                    text = Text('0h', style: style);
                    break;
                  case 6:
                    text = Text('6h', style: style);
                    break;
                  case 12:
                    text = Text('12h', style: style);
                    break;
                  case 18:
                    text = Text('18h', style: style);
                    break;
                  case 23:
                    text = Text('23h', style: style);
                    break;
                  default:
                    text = Text('', style: style);
                    break;
                }
              } else if (timeFrame == 'Weekly') {
                switch (value.toInt()) {
                  case 0:
                    text = Text('Mon', style: style);
                    break;
                  case 1:
                    text = Text('Tue', style: style);
                    break;
                  case 2:
                    text = Text('Wed', style: style);
                    break;
                  case 3:
                    text = Text('Thu', style: style);
                    break;
                  case 4:
                    text = Text('Fri', style: style);
                    break;
                  case 5:
                    text = Text('Sat', style: style);
                    break;
                  case 6:
                    text = Text('Sun', style: style);
                    break;
                  default:
                    text = Text('', style: style);
                    break;
                }
              } else if (timeFrame == 'Monthly') {
                text = Text('${value.toInt() + 1}', style: style);
              } else {
                switch (value.toInt()) {
                  case 0:
                    text = Text('Jan', style: style);
                    break;
                  case 1:
                    text = Text('Feb', style: style);
                    break;
                  case 2:
                    text = Text('Mar', style: style);
                    break;
                  case 3:
                    text = Text('Apr', style: style);
                    break;
                  case 4:
                    text = Text('May', style: style);
                    break;
                  case 5:
                    text = Text('Jun', style: style);
                    break;
                  case 6:
                    text = Text('Jul', style: style);
                    break;
                  case 7:
                    text = Text('Aug', style: style);
                    break;
                  case 8:
                    text = Text('Sep', style: style);
                    break;
                  case 9:
                    text = Text('Oct', style: style);
                    break;
                  case 10:
                    text = Text('Nov', style: style);
                    break;
                  case 11:
                    text = Text('Dec', style: style);
                    break;
                  default:
                    text = Text('', style: style);
                    break;
                }
              }
              return SideTitleWidget(
                axisSide: meta.axisSide,
                child: text,
              );
            },
          ),
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            interval: timeFrame == 'Daily'
                ? 100
                : timeFrame == 'Weekly'
                    ? 1
                    : timeFrame == 'Monthly'
                        ? 1000
                        : 5000,
            getTitlesWidget: (value, meta) {
              const style = TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 12,
                color: Colors.white,
              );
              String text;
              if (timeFrame == 'Daily') {
                switch (value.toInt()) {
                  case 1:
                    text = '100';
                    break;
                  case 3:
                    text = '300';
                    break;
                  case 5:
                    text = '500';
                    break;
                  default:
                    return Container();
                }
              } else if (timeFrame == 'Weekly') {
                text = '${value.toInt()}';
              } else if (timeFrame == 'Monthly') {
                switch (value.toInt()) {
                  case 1000:
                    text = '1K';
                    break;
                  case 2000:
                    text = '2K';
                    break;
                  case 3000:
                    text = '3K';
                    break;
                  case 4000:
                    text = '4K';
                    break;
                  case 5000:
                    text = '5K';
                    break;
                  default:
                    return Container();
                }
              } else {
                switch (value.toInt()) {
                  case 5000:
                    text = '5K';
                    break;
                  case 10000:
                    text = '10K';
                    break;
                  case 15000:
                    text = '15K';
                    break;
                  case 20000:
                    text = '20K';
                    break;
                  case 25000:
                    text = '25K';
                    break;
                  default:
                    return Container();
                }
              }
              return Text(text, style: style, textAlign: TextAlign.left);
            },
            reservedSize: 42,
          ),
        ),
      ),
      borderData: FlBorderData(
        show: true,
        border: Border.all(color: Colors.black),
      ),
      minX: 0,
      maxX: timeFrame == 'Daily'
          ? 23
          : timeFrame == 'Weekly'
              ? 6
              : timeFrame == 'Monthly'
                  ? 29
                  : 11,
      minY: 0,
      maxY: timeFrame == 'Daily'
          ? 500
          : timeFrame == 'Weekly'
              ? 7
              : timeFrame == 'Monthly'
                  ? 5000
                  : 25000,
      lineBarsData: [
        LineChartBarData(
          spots: data
              .map((d) => FlSpot(data.indexOf(d).toDouble(), d.value))
              .toList(),
          isCurved: true,
          gradient: LinearGradient(
            colors: gradientColors,
          ),
          barWidth: 5,
          isStrokeCapRound: true,
          dotData: FlDotData(
            show: true,
          ),
          belowBarData: BarAreaData(
            show: true,
            gradient: LinearGradient(
              colors: gradientColors
                  .map((color) => color.withOpacity(0.3))
                  .toList(),
            ),
          ),
        ),
      ],
    );
  }
}

class StatCard extends StatelessWidget {
  final String title;
  final String value;
  final double width;

  const StatCard(
      {Key? key, required this.title, required this.value, required this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color(0xFF3C3C3C), // Slightly lighter Dark Gray background
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Container(
        width: width,
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              value,
              style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                    color: Theme.of(context)
                        .colorScheme
                        .secondary, // Neon Yellow text
                  ),
            ),
            SizedBox(height: 8),
            Text(
              title,
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    color:
                        Theme.of(context).colorScheme.onPrimary, // White text
                  ),
            ),
          ],
        ),
      ),
    );
  }
}

class GoalProgressIndicator extends StatelessWidget {
  final String label;
  final double progress;

  const GoalProgressIndicator({
    Key? key,
    required this.label,
    required this.progress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: 75,
          height: 75,
          child: Stack(
            fit: StackFit.expand,
            children: [
              CircularProgressIndicator(
                value: progress,
                strokeWidth: 6,
                backgroundColor: Theme.of(context).colorScheme.surface,
                valueColor: AlwaysStoppedAnimation(
                    Theme.of(context).colorScheme.secondary), // Neon Yellow
              ),
              Center(
                child: Text(
                  '${(progress * 100).toInt()}%',
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        color: Theme.of(context)
                            .colorScheme
                            .onPrimary, // White text
                      ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 8),
        Text(
          label,
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                color: Theme.of(context).colorScheme.onPrimary, // White text
              ),
        ),
      ],
    );
  }
}
