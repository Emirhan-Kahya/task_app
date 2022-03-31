import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_app/screens/add_task.dart';
import 'package:task_app/screens/all_tasks.dart';
import 'package:task_app/utils/app_colors.dart';
import 'package:task_app/widgets/button_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 100, horizontal: 30),
        width: double.maxFinite,
        height: double.maxFinite,
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage("assets/images/welcome.jpg"),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RichText(
              text: TextSpan(
                text: "Hello",
                style: TextStyle(
                  color: AppColors.maincolor,
                  fontSize: 60,
                  fontWeight: FontWeight.bold,
                ),
                children: [
                  TextSpan(
                    text: "\nstart your beautiful day",
                    style: TextStyle(
                      color: AppColors.smallTextColor,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
            Column(
              children: [
                InkWell(
                  onTap: () {
                    Get.to(
                      () => AddTask(),
                      transition: Transition.zoom,
                      duration: Duration(milliseconds: 400),
                    );
                  },
                  child: myButton(
                    backgroundColor: AppColors.maincolor,
                    textColor: Colors.white,
                    text: "Add Task",
                  ),
                ),
                const SizedBox(height: 10),
                InkWell(
                  onTap: () {
                    Get.to(
                      () => AllTasks(),
                      transition: Transition.fade,
                      duration: Duration(seconds: 1),
                    );
                  },
                  child: myButton(
                    backgroundColor: Colors.white,
                    textColor: AppColors.maincolor,
                    text: "View All",
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
