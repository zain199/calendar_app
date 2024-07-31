import 'package:flutter/material.dart';
import 'package:task/core/util/style/colors.dart';
import 'package:task/core/util/widgets/general_button.dart';
import 'package:task/features/project_summary/presentation/widgets/productivity_chart.dart';
import 'package:task/features/project_summary/presentation/widgets/projects_info_widget.dart';
import 'package:task/features/project_summary/presentation/widgets/search_widget.dart';

class ProjectSummeryScreen extends StatefulWidget {
  const ProjectSummeryScreen({super.key});

  @override
  State<ProjectSummeryScreen> createState() => _ProjectSummeryScreenState();
}

class _ProjectSummeryScreenState extends State<ProjectSummeryScreen> {
  @override
  Widget build(BuildContext context) {

    return  Column(
      children: [
        Divider(color: AppColors.grey200Color),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SearchWidget(),
              const ProjectsInfoWidget(),
              const SizedBox(height: 24),
              GeneralButton(
                text: "View All Project",
                onPressed: () {},
                backgroundColor: Colors.transparent,
                borderColor: AppColors.textColor,
                textColor: AppColors.textColor,
                height: 50,
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
        const ProductivityChart(),
      ],
    );
  }
}
