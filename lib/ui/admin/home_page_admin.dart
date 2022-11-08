import 'package:flutter/material.dart';
import 'package:lapor_app/ui/about_page.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';

class HomePageAdmin extends StatefulWidget {
  const HomePageAdmin({super.key});

  @override
  State<HomePageAdmin> createState() => _HomePageAdminState();
}

class _HomePageAdminState extends State<HomePageAdmin> {
  List<_SalesData> data = [
    _SalesData('Jan', 35),
    _SalesData('Feb', 28),
    _SalesData('Mar', 34),
    _SalesData('Apr', 32),
    _SalesData('May', 40),
    _SalesData('Jun', 40),
    _SalesData('Jul', 40),
    _SalesData('Aug', 40),
    _SalesData('Sep', 40),
    _SalesData('Oct', 40),
    _SalesData('Nov', 40),
    _SalesData('Dec', 40),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Admin Page'),
      ),
      body: SafeArea(
        child: Column(
          children: [
            SfCartesianChart(
                primaryXAxis: CategoryAxis(),
                title: ChartTitle(text: 'Laporan Total'),
                legend: Legend(isVisible: true),
                tooltipBehavior: TooltipBehavior(enable: true),
                series: <ChartSeries<_SalesData, String>>[
                  LineSeries<_SalesData, String>(
                      dataSource: data,
                      xValueMapper: (_SalesData sales, _) => sales.year,
                      yValueMapper: (_SalesData sales, _) => sales.sales,
                      name: 'Sales',
                      dataLabelSettings: DataLabelSettings(isVisible: true))
                ]),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SfSparkLineChart.custom(
                  trackball: SparkChartTrackball(
                      activationMode: SparkChartActivationMode.tap),
                  marker: SparkChartMarker(
                      displayMode: SparkChartMarkerDisplayMode.all),
                  labelDisplayMode: SparkChartLabelDisplayMode.all,
                  xValueMapper: (int index) => data[index].year,
                  yValueMapper: (int index) => data[index].sales,
                  dataCount: 5,
                ),
              ),
            )
          ],
        ),
      ),
      drawer: Drawer(
        child: Column(
          children: [
            const UserAccountsDrawerHeader(
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage('assets/LogoKominfoTanpaTeks.png'),
              ),
              accountName: Text('Admin'),
              accountEmail: Text('admin@laporapp.com'),
            ),
            ListTile(
              leading: const Icon(Icons.comment),
              title: const Text('Laporan Masuk'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
                leading: const Icon(Icons.save_alt),
                title: const Text('Tentang Aplikasi'),
                onTap: () => Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const AboutPage()))),
            ListTile(
              onTap: () => Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const AboutPage())),
              leading: const Icon(Icons.info_outline),
              title: const Text('About'),
            ),
          ],
        ),
      ),
    );
  }
}

class _SalesData {
  _SalesData(this.year, this.sales);

  final String year;
  final double sales;
}
