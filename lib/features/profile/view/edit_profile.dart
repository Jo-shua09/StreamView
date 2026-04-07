import 'package:flutter/material.dart';
import 'package:streamview/core/themes/app_colors.dart';
import 'package:get/get.dart';
import 'package:streamview/core/themes/app_text_styles.dart';
import 'package:streamview/core/widgets/text_field_widget.dart';

class EditProfile extends StatelessWidget {
  const EditProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        centerTitle: true,
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: Icon(Icons.arrow_back_ios_outlined),
        ),
        title: Text(
          'Edit Profile',
          style: AppTextStyles.h6Bold.copyWith(color: AppColors.black),
        ),
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.more_vert))],
        elevation: 0,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1.0),
          child: Container(color: AppColors.gray10, height: 1.0),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 10, 20, 35),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            Center(
              child: GestureDetector(
                onTap: () {
                  // Handle profile picture change
                },
                child: CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage('assets/images/profile.jpg'),
                ),
              ),
            ),
            const SizedBox(height: 20),
            TextFieldWidget(hintText: 'Joshua Onyeka', labelText: 'Name'),
            const SizedBox(height: 10),
            TextFieldWidget(hintText: 'email@example.com', labelText: 'Email'),
            const SizedBox(height: 10),
            TextFieldWidget(hintText: '+1 234 567 890', labelText: 'Phone'),
            const Spacer(),
            ElevatedButton(onPressed: () {}, child: Text('Save Changes')),
          ],
        ),
      ),
    );
  }
}
