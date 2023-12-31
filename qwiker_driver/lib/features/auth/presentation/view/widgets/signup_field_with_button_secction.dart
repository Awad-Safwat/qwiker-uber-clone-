import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:qwiker_driver/core/widgets/custom_button.dart';
import 'package:qwiker_driver/features/auth/presentation/manager/auth_cubit/auth_cubit.dart';

import '../../../../../core/theaming/app_colors.dart';
import '../../../../../core/theaming/app_fonts.dart';
import 'custom_text_form_field.dart';

class SignUpFieldWithButtonSecction extends StatefulWidget {
  const SignUpFieldWithButtonSecction({super.key});

  @override
  State<SignUpFieldWithButtonSecction> createState() =>
      _SignUpFieldWithButtonSecctionState();
}

class _SignUpFieldWithButtonSecctionState
    extends State<SignUpFieldWithButtonSecction> {
  final TextEditingController _controller = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      key: _formKey,
      child: Column(
        children: [
          CustomTextFormField(
            textController: _controller,
            validator: (val) {
              if (val == null || val.isEmpty) {
                return 'Please enter A phone Number';
              } else if (val.length != 11) {
                return 'Phone Number need to be 11 numbers';
              } else {
                return null;
              }
            },
            onChanged: (val) {},
            onSave: (val) {},
            keyboardType: TextInputType.phone,
            fillColor: AppColors.whaite,
            hintText: 'Full Name',
            hintStyle: AppFonts.poppinsRegularGray_14,
            borderRadius: 50.r,
            enabledBorderColor: AppColors.liteGray,
            focusBorderColor: AppColors.mainBlue,
          ),
          Gap(30.h),
          CustomTextFormField(
            textController: _controller,
            validator: (val) {
              if (val == null || val.isEmpty) {
                return 'Please enter A phone Number';
              } else if (val.length != 11) {
                return 'Phone Number need to be 11 numbers';
              } else {
                return null;
              }
            },
            onChanged: (val) {},
            onSave: (val) {},
            keyboardType: TextInputType.phone,
            fillColor: AppColors.whaite,
            hintText: 'Email',
            hintStyle: AppFonts.poppinsRegularGray_14,
            borderRadius: 50.r,
            enabledBorderColor: AppColors.liteGray,
            focusBorderColor: AppColors.mainBlue,
          ),
          Gap(30.h),
          CustomTextFormField(
            textController: _controller,
            validator: (val) {
              if (val == null || val.isEmpty) {
                return 'Please enter A phone Number';
              } else if (val.length != 11) {
                return 'Phone Number need to be 11 numbers';
              } else {
                return null;
              }
            },
            onChanged: (val) {},
            onSave: (val) {},
            keyboardType: TextInputType.phone,
            fillColor: AppColors.whaite,
            hintText: 'phone Number',
            hintStyle: AppFonts.poppinsRegularGray_14,
            borderRadius: 50.r,
            enabledBorderColor: AppColors.liteGray,
            focusBorderColor: AppColors.mainBlue,
          ),
          Gap(30.h),
          CustomButton(
            onPressed: () {
              BlocProvider.of<AuthCubit>(context).logOut();
            },
            title: 'Sign Up',
            backgroundColor: AppColors.mainBlue,
            titleStyle:
                AppFonts.poppinsMedium_18.copyWith(color: AppColors.whaite),
          ),
        ],
      ),
    );
  }
}
