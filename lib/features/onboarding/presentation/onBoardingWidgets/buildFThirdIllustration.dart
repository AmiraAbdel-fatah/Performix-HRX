import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../../core/Utils/app_colors.dart';
import '../../../../core/Utils/app_styles.dart';

class BuildThirdIllustration extends StatefulWidget {
  final double progress;

  const BuildThirdIllustration({super.key, this.progress = 100});

  @override
  State<BuildThirdIllustration> createState() => _BuildThirdIllustrationState();
}

class _BuildThirdIllustrationState extends State<BuildThirdIllustration>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2500),
    );

    _animation =
        Tween<double>(begin: 0, end: widget.progress).animate(
          CurvedAnimation(
            parent: _controller,
            curve: Curves.easeInOutCubic,
          ),
        )..addListener(() {
          setState(() {});
        });

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 220.h,
      width: 220.w,
      child: SfCircularChart(
        margin: EdgeInsets.zero,
        series: <CircularSeries<_ChartData, String>>[
          RadialBarSeries<_ChartData, String>(
            dataSource: [
              _ChartData('Progress', _animation.value, AppColors.primary),
            ],
            xValueMapper: (_ChartData data, _) => data.x,
            yValueMapper: (_ChartData data, _) => data.y,
            pointColorMapper: (_ChartData data, _) => data.color,
            maximumValue: 100,
            radius: '100%',
            innerRadius: '80%',
            trackColor: AppColors.primary.withValues(alpha: 0.1),
            cornerStyle: CornerStyle.bothCurve,
            animationDuration: 0,
          ),
        ],
        annotations: <CircularChartAnnotation>[
          CircularChartAnnotation(
            widget: Text(
              '${_animation.value.round()}%',
              style: AppStyles.h1.copyWith(
                fontSize: 32.sp,
                color: AppColors.textPrimary,
                fontWeight: FontWeight.w800,
              ),
            ),
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
