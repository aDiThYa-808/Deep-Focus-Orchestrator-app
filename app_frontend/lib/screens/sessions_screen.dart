import 'package:app_frontend/theme/colors.dart';
import 'package:app_frontend/widgets/date_item.dart';
import 'package:flutter/material.dart';

class SessionsScreen extends StatefulWidget {
  const SessionsScreen({super.key});

  @override
  State<SessionsScreen> createState() => _SessionsScreenState();
}

class _SessionsScreenState extends State<SessionsScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      
      body: Column(
        children: [
           buildDateScroll(), // Add this line
          //Expanded(child: buildTaskList()),

        ],
      ),

    
      floatingActionButton: FloatingActionButton(
        onPressed: (){},
        backgroundColor: AppColors.primaryButtonColor,
        child: const Icon(
          Icons.add_rounded,
          color: AppColors.constantIconColor,
          ),
      ),
    
    );
  }

  Widget buildDateScroll() {
  final today = DateTime.now();
  return SizedBox(
    height: 72, // Fixed height for the date scroller
    child: ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: 14, // 2 weeks of dates
      itemBuilder: (context, index) {
        final date = today.add(Duration(days: index));
        final isSelected = index == 0; // Auto-select today
        return DateItem(date: date, isSelected: isSelected);
      },
    ),
  );
}

}