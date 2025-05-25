import 'package:app_frontend/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateItem extends StatelessWidget {
  final DateTime date;
  final bool isSelected;
  const DateItem({required this.date, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: Container(
        width: 48, // Fixed width for each date box
        decoration: BoxDecoration(
          color:
              isSelected ? AppColors.primaryButtonColor : AppColors.secondary,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Weekday abbreviation (Mon, Tue)
            Text(
              DateFormat('E').format(date), // Requires intl package
              style: TextStyle(
                color:
                    isSelected
                        ? AppColors.primaryTextColor
                        : AppColors.secondaryTextColor,
                fontSize: 12,
              ),
            ),
            const SizedBox(height: 4),
            // Date number
            Text(
              date.day.toString(),
              style: TextStyle(
                color:
                    isSelected
                        ? AppColors.primaryTextColor
                        : AppColors.secondaryTextColor,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
