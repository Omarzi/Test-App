import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_app/config/app_routes.dart';
import 'package:test_app/utils/custom_widgets/custom_botton.dart';
import 'package:test_app/utils/custom_widgets/custom_text-form_field.dart';
import 'package:test_app/utils/styles/colors.dart';
import 'package:test_app/utils/styles/fonts.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  bool obscure = true;

  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.primaryColor,
          title: Text('تسجيل الدخول', style: AppFonts.titleScreen),
          centerTitle: true,
        ),

        body: Padding(
          padding: EdgeInsets.only(right: 25.w, left: 25.w, top: 40.h),
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    'أدخل تفاصيل الحساب أدناه',
                    style: AppFonts.bodyText,
                  ),
                ],
              ),

              SizedBox(height: 10.h),

              Form(
                key: formKey,
                child: Column(
                  children: [
                    CustomTextFormFiled(
                      hintText: '(يجب ادخال المفاتح الخاص بالدولة)',
                      label: 'الايميل او رقم الهاتف',
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
                      validator: (text) {
                        if (text!.isEmpty) {
                          return 'من فضلك أدخل الايميل او رقم الهاتف';
                        }
                      },
                    ),
                    CustomTextFormFiled(
                      label: 'كلمة المرور',
                      controller: passwordController,
                      suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              obscure = !obscure;
                            });
                          },
                          icon: obscure
                              ? Icon(
                            Icons.visibility_off,
                            size: 24.sp,
                          )
                              : Icon(
                            Icons.visibility,
                            size: 24.sp,
                          )),
                      obscureText: obscure,
                      validator: (text) {
                        if (text!.isEmpty) {
                          return 'من فضلك أدخل كلمة المرور';
                        }
                      },
                    ),

                    Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10.w),
                          child: GestureDetector(
                            onTap: () {

                            },
                            child: Text(
                              'هل نسيت كلمة المرور',
                              style: AppFonts.primarytext.copyWith(
                                  color: AppColors.primaryColor),
                            ),
                          ),
                        ),

                      ],
                    ),

                  ],
                ),
              ),

              SizedBox(height: 30.h),

              CustomButtonWidget(
                onPressed: () {

                },
                borderRadius: 10.r,
                text: 'تسجيل الدخول',
                width: 335.w,
                height: 49.h,
              ),

              SizedBox(height: 12.h),

              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, RouteName.registerRoute);
                },

                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'ليس لديك حساب؟',
                        style: AppFonts.primarytext,
                      ),
                      TextSpan(
                        text: ' انشاء حساب',
                          style: AppFonts.primarytext.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                      )
                    ]
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
