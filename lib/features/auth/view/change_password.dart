import 'package:flutter/material.dart';
import 'package:streamview/core/themes/app_colors.dart';
import 'package:get/get.dart';
import 'package:streamview/core/themes/app_text_styles.dart';
import 'package:streamview/core/widgets/text_field_widget.dart';

class ChangePassword extends StatelessWidget {
  const ChangePassword({super.key});

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
          'Change Password',
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
            TextFieldWidget(
              hintText: 'Current Password',
              labelText: 'Current Password',
            ),
            const SizedBox(height: 10),
            TextFieldWidget(
              hintText: 'New Password',
              labelText: 'New Password',
            ),
            const SizedBox(height: 10),
            TextFieldWidget(
              hintText: 'Confirm New Password',
              labelText: 'Confirm New Password',
            ),
            const Spacer(),
            ElevatedButton(onPressed: () {}, child: Text('Save Changes')),
          ],
        ),
      ),
    );
  }
}
