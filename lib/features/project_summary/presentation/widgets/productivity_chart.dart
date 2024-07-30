import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../../core/util/style/colors.dart';

class ProductivityChart extends StatelessWidget {
  const ProductivityChart({super.key});

  @override
  Widget build(BuildContext context) {
    List<_SalesData> data = [
      _SalesData('Jan', 30),
      _SalesData('Feb', 40),
      _SalesData('Mar', 25),
      _SalesData('Apr', 56),
      _SalesData('May', 65),
      _SalesData('Jun', 70)
    ];

    return  Container(
      width: MediaQuery.of(context).size.width,
      color: AppColors.whiteColor,
      padding: const EdgeInsets.all(24),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Prodictivity",
                style: Get.theme.textTheme.bodyLarge!
                    .copyWith(fontWeight: FontWeight.w700),
              ),
              const Spacer(),
              Icon(
                Icons.more_horiz,
                color: AppColors.textColor,
              )
            ],
          ),
          const SizedBox(height: 36),
          SfCartesianChart(
              primaryXAxis: const CategoryAxis(),
              tooltipBehavior: TooltipBehavior(enable: true),
              series: <CartesianSeries<_SalesData, String>>[
                ColumnSeries<_SalesData, String>(
                  dataSource: data,
                  xValueMapper: (_SalesData sales, _) => sales.year,
                  yValueMapper: (_SalesData sales, _) => sales.sales,
                  color: AppColors.grey300Color,
                  width: 1,
                  borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(8),
                      topLeft: Radius.circular(8)),
                  spacing: 0.05,
                  selectionBehavior: SelectionBehavior(
                    enable: true,
                    selectedColor: AppColors.mainColor,
                    unselectedColor: AppColors.grey400Color,
                  ),
                )
              ]),
        ],
      ),
    );
  }
}


class _SalesData {
  _SalesData(this.year, this.sales);

  final String year;
  final double sales;
}
