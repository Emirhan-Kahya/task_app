import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_app/utils/app_colors.dart';
import 'package:task_app/widgets/button_widget.dart';
import 'package:task_app/widgets/task_widget.dart';

class AllTasks extends StatelessWidget {
  const AllTasks({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List myData = [
      "Try Harder",
      "Try Smarter",
    ];

    final leftEditIcon = Container(
      margin: const EdgeInsets.only(bottom: 10),
      color: const Color(0xFF2e3253).withOpacity(0.5),
      child: const Icon(Icons.edit, color: Colors.white),
      alignment: Alignment.centerLeft,
    );
    final rightEditIcon = Container(
      margin: const EdgeInsets.only(bottom: 10),
      color: Colors.redAccent,
      child: const Icon(Icons.delete, color: Colors.white),
      alignment: Alignment.centerRight,
    );
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            alignment: Alignment.topLeft,
            width: double.maxFinite,
            height: MediaQuery.of(context).size.height / 3.2,
            padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 20),
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage("assets/images/header1.jpg"),
              ),
            ),
            child: InkWell(
              onTap: (){
                Get.back();
              },
              child: Icon(Icons.arrow_back, color: AppColors.secondaryColor),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.home,
                      color: AppColors.secondaryColor,
                      size: 25,
                    ),
                    SizedBox(width: 10),
                    Container(
                      width: 20,
                      height: 20,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12.5),
                          color: AppColors.maincolor.withOpacity(0.8)),
                      child: Icon(Icons.add, color: Colors.white, size: 20),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Icon(
                      Icons.calendar_month_sharp,
                      color: AppColors.secondaryColor,
                      size: 25,
                    ),
                    SizedBox(width: 5),
                    Text(
                      "2",
                      style: TextStyle(
                        fontSize: 20,
                        color: AppColors.secondaryColor,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Flexible(
            child: ListView.builder(
              itemCount: myData.length,
              itemBuilder: (context, index) {
                return Dismissible(
                  background: leftEditIcon,
                  secondaryBackground: rightEditIcon,
                  key: ObjectKey(index),
                  onDismissed: (DismissDirection direction) {},
                  confirmDismiss: (DismissDirection direction) async {
                    if (direction == DismissDirection.startToEnd) {
                      showModalBottomSheet(
                        backgroundColor: Colors.transparent,
                        barrierColor: Colors.transparent,
                        context: context,
                        builder: (_) {
                          return Container(
                            height: MediaQuery.of(context).size.width,
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            decoration: BoxDecoration(
                              color: const Color(0xFF2e3253).withOpacity(0.3),
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(20),
                                topLeft: Radius.circular(20),
                              ),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                myButton(
                                  backgroundColor: AppColors.maincolor,
                                  textColor: Colors.white,
                                  text: "View",
                                ),
                                SizedBox(height: 10),
                                myButton(
                                  backgroundColor: AppColors.maincolor,
                                  textColor: Colors.white,
                                  text: "Edit",
                                ),
                              ],
                            ),
                          );
                        },
                      );
                      return false;
                    } else {
                      return Future.delayed(Duration(milliseconds: 300),
                          () => direction == DismissDirection.endToStart);
                    }
                  },
                  child: Container(
                    margin:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                    child: TaskWidget(
                      text: myData[index],
                      color: Colors.blueGrey,
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
