import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_app/config/app_routes.dart';
import 'package:test_app/utils/custom_widgets/custom_botton.dart';
import 'package:test_app/utils/custom_widgets/custom_divider.dart';
import 'package:test_app/utils/custom_widgets/custom_phone_widget.dart';
import 'package:test_app/utils/custom_widgets/custom_text-form_field.dart';
import 'package:test_app/utils/styles/colors.dart';
import 'package:test_app/utils/styles/fonts.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  bool obscure = true;

  String phoneNumber = '';
  String countryCode = '';

  // Country? country;
  // String flag = AppAssets.lb;

  final TextEditingController nameController = TextEditingController();

  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController codeController = TextEditingController();

  final TextEditingController zipCodeController = TextEditingController();

  final TextEditingController cityController = TextEditingController();

  final TextEditingController countryController = TextEditingController();

  final TextEditingController streetNameController = TextEditingController();

  final TextEditingController apartmentController = TextEditingController();

  final TextEditingController floorNumberController = TextEditingController();

  final TextEditingController locationController = TextEditingController();

  String? selectItem;
  String? newf;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.primaryColor,
          automaticallyImplyLeading: false,
          title: Text(
            'انشاء حساب',
            style: AppFonts.titleScreen.copyWith(height: 0),
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(right: 25.w, left: 25.w, top: 20.h),
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

                Form(
                  key: formKey,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        CustomTextFormFiled(
                          label: 'الاسم',
                          keyboardType: TextInputType.name,
                          controller: nameController,
                          validator: (text) {
                            if (text!.isEmpty) {
                              return "من فضلك أدخل الاسم";
                            }
                          },
                        ),
                        CustomTextFormFiled(
                          label: "الايمل",
                          keyboardType: TextInputType.emailAddress,
                          controller: emailController,
                          validator: (text) {
                            if (text!.isEmpty) {
                              return "من فضلك أدخل الايميل";
                            } else if (!RegExp(
                                "^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9+_.-]+.[com]")
                                .hasMatch(text)) {
                              return 'يرجى إدخال اسم صالح كـ example@gmail.com';
                            }
                          },
                        ),
                        CustomTextFormFiled(
                          label: 'كلمة المرور',
                          keyboardType: TextInputType.visiblePassword,
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
                            ),
                          ),
                          obscureText: obscure,
                          controller: passwordController,
                          validator: (text) {
                            if (text!.isEmpty) {
                              return "من فضلك ادخل كلمة المرور";
                            }
                          },
                        ),
                        SizedBox(height: 20.h),
                        CustomFormField(
                          codeControlere: codeController,
                          hintText:
                          "رقم الهاتف",
                          obsecureText: false,
                          textInputType: TextInputType.phone,
                          controller: phoneNumberController,
                          validator: (text) {
                            if (text!.isEmpty) {
                              return "من فضلك ادخل رقم الهاتف";
                            }
                          },
                        ),
                        // CustomTextFormFiled(
                        //   validator: (text) {},
                        //   label: position == null
                        //       ? AppLocalizations.of(context)!
                        //       .clickthebuttonbelowtobringthecurrentlocationtoyou
                        //       : address ?? 'Loading',
                        //   controller: locationController,
                        //   readOnly: true,
                        //   hintText: position == null
                        //       ? AppLocalizations.of(context)!
                        //       .clickthebuttonbelowtobringthecurrentlocationtoyou
                        //       : address ?? 'Loading',
                        //   suffixIcon: Padding(
                        //     padding: EdgeInsets.all(12.sp),
                        //     child: SvgPicture.asset(
                        //       AppAssets.locationIcon,
                        //       color: AppColors.primaryColor,
                        //     ),
                        //   ),
                        // ),
                        // SizedBox(height: 15.h),
                        // CustomButtonWidget(
                        //   onPressed: () async {
                        //     setState(() {
                        //       // position != null;
                        //     });
                        //     // registerCubit.getPlaceAndPosition();
                        //   },
                        //   color: AppColors.primaryColor,
                        //   borderRadius: 10.r,
                        //   width: 335.w,
                        //   height: 49.h,
                        //   text: AppLocalizations.of(context)!.pressHere,
                        // ),
                        SizedBox(height: 10.h),
                        // Padding(
                        //   padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
                        //   child: Directionality(
                        //     // textDirection: MyCache.getString(key: CacheKeys.lang) == 'ar'
                        //     //     ? TextDirection.rtl
                        //     //     : TextDirection.ltr,
                        //     textDirection: TextDirection.rtl,
                        //     child: Container(
                        //       padding: EdgeInsets.symmetric(horizontal: 0.w),
                        //       decoration: BoxDecoration(
                        //         border: Border.all(color: Colors.grey),
                        //         borderRadius: BorderRadius.circular(5.r),
                        //       ),
                        //       child: PopupMenuButton(
                        //         elevation: 1.sp,
                        //
                        //         child: ListTile(
                        //           title: Text(
                        //             selectItem ?? AppLocalizations.of(context)!.choosetheclienttype,
                        //             style: GoogleFonts.cairo(
                        //               fontWeight: FontWeight.w600,
                        //               fontSize: 16.sp,
                        //               height: 1.h,
                        //             ),
                        //           ),
                        //           trailing: const Icon(Icons.arrow_drop_down),
                        //         ),
                        //         itemBuilder: (BuildContext context) {
                        //           return list.map((item) {
                        //             return PopupMenuItem(
                        //               value: item,
                        //               child: Text(
                        //                 item,
                        //                 style: GoogleFonts.cairo(
                        //                   fontWeight: FontWeight.w600,
                        //                   fontSize: 18.sp,
                        //                 ),
                        //               ),
                        //             );
                        //           }).toList();
                        //         },
                        //         onSelected: (newValue) {
                        //           setState(() {
                        //             selectItem = newValue;
                        //             newf = newValue;
                        //           });
                        //         },
                        //       ),
                        //     ),
                        //   ),
                        // ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                CustomButtonWidget(
                  onPressed: () async {
                    // if (formKey.currentState!.validate()) {
                    //   if (position != null && address != null) {
                    //     print(address);
                    //     if (newf == null || newf == '') {
                    //       CustomSnackBar.showMessage(
                    //         context,
                    //         message: AppLocalizations.of(context)!
                    //             .youmustchooseaclienttype,
                    //         messageColor: Colors.red,
                    //       );
                    //     } else {
                    //       await registerCubit.signUpFunction(
                    //         name: nameController.text,
                    //         email: emailController.text,
                    //         password: passwordController.text,
                    //         passwordConfirm: passwordController.text,
                    //         phone: codeController.text + phoneNumberController.text,
                    //         lat: position!.latitude,
                    //         lng: position!.longitude,
                    //         address: address!,
                    //         role: newf ==
                    //             AppLocalizations.of(context)!
                    //                 .retailclient
                    //             ? 'user-normal'
                    //             : newf ==
                    //             AppLocalizations.of(context)!
                    //                 .wholesalecustomer
                    //             ? 'user-wholesale'
                    //             : '',
                    //       );
                    //       print(codeController.text + phoneNumberController.text);
                    //     }
                    //   } else {
                    //     CustomSnackBar.showMessage(
                    //       context,
                    //       message: AppLocalizations.of(context)!
                    //           .youmustchoosethecurrentlocation,
                    //       messageColor: Colors.red,
                    //     );
                    //   }
                    // }
                  },
                  borderRadius: 10.r,
                  text: 'انشاء حساب جديد',
                  width: 335.w,
                  height: 49.h,
                ),
                Row(
                  children: [
                    Expanded(
                      child: CustomDevider(
                        thicness: 0.3,
                        color: AppColors.grey,
                      ),
                    ),
                    Text(
                      "او",
                      style: AppFonts.bodyText,
                    ),
                    Expanded(
                      child: CustomDevider(
                        thicness: 0.3,
                        color: AppColors.grey,
                      ),
                    ),
                  ],
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, RouteName.loginRoute);
                  },
                  child: Text(
                    "تسجيل الدخول",
                    style: AppFonts.primarytext.copyWith(
                      fontWeight: FontWeight.bold,
                      fontSize: 18.sp,
                    ),
                  ),
                ),
                CustomDevider(
                  thicness: 0.3,
                  color: AppColors.grey,
                ),
                SizedBox(height: 10.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
