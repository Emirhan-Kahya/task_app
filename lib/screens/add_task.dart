import 'package:flutter/material.dart';
import 'package:task_app/utils/app_colors.dart';
import 'package:task_app/widgets/button_widget.dart';
import 'package:task_app/widgets/textfield_widget.dart';

class AddTask extends StatelessWidget {
  const AddTask({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController();
    TextEditingController taskController = TextEditingController();

    return Scaffold(
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        padding: const EdgeInsets.symmetric(horizontal: 10),
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage("assets/images/addtask1.jpg"),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                const SizedBox(height: 40),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.arrow_back,
                    color: AppColors.maincolor,
                  ),
                ),
              ],
            ),
            Column(
              children: [
                myTextField(
                  textController: nameController,
                  hintText: "Task Name",
                  borderRadius: 20,
                ),
                const SizedBox(height: 15),
                myTextField(
                  textController: taskController,
                  hintText: "Task Detail",
                  borderRadius: 15,
                  maxLines: 4,
                ),
                const SizedBox(height: 20),
                myButton(
                  backgroundColor: AppColors.maincolor,
                  textColor: Colors.white,
                  text: "Add",
                ),
              ],
            ),
            SizedBox(height: MediaQuery.of(context).size.height / 20),
          ],
        ),
      ),
    );
  }
}
