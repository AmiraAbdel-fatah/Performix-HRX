import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../../core/Utils/app_colors.dart';

class BuildSecondIllustration extends StatelessWidget {
  const BuildSecondIllustration({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200.h,
      width: 220.w,
      child: SfCartesianChart(
        plotAreaBorderWidth: 0,
        margin: EdgeInsets.zero,
        primaryXAxis: const CategoryAxis(isVisible: false),
        primaryYAxis: const NumericAxis(
          isVisible: false,
          minimum: 0,
          maximum: 120,
        ),
        series: <CartesianSeries<_ChartData, String>>[
          ColumnSeries<_ChartData, String>(
            dataSource: [
              _ChartData('1', 50, AppColors.primary),
              _ChartData('2', 80, AppColors.chartBlue),
              _ChartData('3', 95, AppColors.warning),
            ],
            xValueMapper: (_ChartData data, _) => data.x,
            yValueMapper: (_ChartData data, _) => data.y,
            pointColorMapper: (_ChartData data, _) => data.color,
            borderRadius: BorderRadius.circular(8.r),
            animationDuration: 1000,
            width: .6,
          ),
          LineSeries<_ChartData, String>(
            dataSource: [
              _ChartData('1', 65, AppColors.success),
              _ChartData('2', 90, AppColors.success),
              _ChartData('3', 110, AppColors.success),
            ],
            xValueMapper: (_ChartData data, _) => data.x,
            yValueMapper: (_ChartData data, _) => data.y,
            color: AppColors.success,
            width: 4.w,
            markerSettings: MarkerSettings(
              isVisible: true,
              height: 10.r,
              width: 10.r,
              shape: DataMarkerType.circle,
              color: AppColors.success,
              borderWidth: 0,
            ),
            animationDuration: 1000,
          ),
        ],
      ),
    );
  }
}

class _ChartData {
  _ChartData(this.x, this.y, this.color);

  final String x;
  final double y;
  final Color color;
}
