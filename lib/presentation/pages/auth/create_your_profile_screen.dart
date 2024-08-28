import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:stoxplay/shared/widgets/common_background.dart';
import 'package:stoxplay/shared/widgets/common_reverse_button.dart';

import '../../../shared/shared.dart';

class CreateYourProfileScreen extends StatefulWidget {
  CreateYourProfileScreen({super.key});

  @override
  State<CreateYourProfileScreen> createState() =>
      _CreateYourProfileScreenState();
}

class _CreateYourProfileScreenState extends State<CreateYourProfileScreen> {
  TextEditingController userNameController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  TextEditingController dobController = TextEditingController();

  XFile? image;

  @override
  Widget build(BuildContext context) {
    return CommonBackground(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.transparent,
        body: Column(
          children: [
            SizedBox(
              height: 175.h,
            ),
            TextView(
              text: Strings.createYourProfile,
              fontWeight: FontWeight.w500,
              fontSize: 20.sp,
            ),
            SizedBox(
              height: 20.h,
            ),
            GradientContainer(
              height: MediaQuery.of(context).size.height / 1.4.h,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 20.h,
                  ),
                  GestureDetector(
                    onTap: () {
                      uploadPhotoBottomSheet();
                    },
                    child: UploadPhoto(),
                  ),
                  CommonTextfield(
                      controller: userNameController, title: Strings.userName),
                  SizedBox(
                    height: 10.h,
                  ),
                  CommonTextfield(
                      controller: emailController, title: Strings.email),
                  SizedBox(
                    height: 10.h,
                  ),
                  CommonTextfield(
                    controller: dobController,
                    title: Strings.dob,
                    readOnly: true,
                    hintText: Strings.ddMMYYYY,
                    onTap: () async {
                      await datePicker();
                    },
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  CommonButton(
                    title: Strings.upload,
                    onTap: () {
                      Navigator.pushNamedAndRemoveUntil(
                          context, RouteList.dashboardScreen, (route) => false);
                    },
                  )
                ],
              ),
            ),
          ],
        ).paddingSymmetric(horizontal: 20.w),
      ),
    );
  }

  Future<void> datePicker() async {
    var date = await showDatePicker(
        context: context,
        firstDate: DateTime(1900),
        lastDate: DateTime(DateTime.now().year - 18, DateTime.now().month,
            DateTime.now().day));
    if (date != null) {
      dobController.text = DateFormat('dd/MM/yyyy').format(date);
    }
  }

  Widget UploadPhoto() {
    return Center(
      child: Column(
        children: [
          CircleAvatar(
            backgroundColor: AppColors.white,
            radius: 35.r,
            child: image != null
                ? ClipOval(
                    child: Image.file(
                      File(image!.path),
                      height: 70.h,
                      width: 70.w,
                      fit: BoxFit.cover,
                    ),
                  )
                : Image.asset(
                    'assets/images/app_icon.png',
                    height: 50.h,
                    width: 50.w,
                  ).paddingSymmetric(horizontal: 10.w),
          ),
          SizedBox(
            height: 10.h,
          ),
          TextView(
            text: Strings.uploadPhoto,
            fontSize: 13.sp,
            fontWeight: FontWeight.w600,
            fontColor: AppColors.grey,
          )
        ],
      ),
    );
  }

  Future<void> uploadPhotoBottomSheet() {
    return showModalBottomSheet(
        isDismissible: false,
        enableDrag: false,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20.r),
                topRight: Radius.circular(20.r))),
        context: context,
        builder: (context) {
          return SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 20.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(),
                    TextView(
                      text: Strings.uploadYourPhoto,
                      fontColor: AppColors.black,
                      fontSize: 20.sp,
                    ),
                    GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Icon(Icons.close))
                  ],
                ),
                SizedBox(
                  height: 10.h,
                ),
                Row(
                  children: [
                    Expanded(
                        child: CommonReverseButton(
                            title: Strings.camera,
                            onTap: () async {
                              ImagePicker imagePicker = ImagePicker();
                              await imagePicker
                                  .pickImage(
                                      imageQuality: 100,
                                      source: ImageSource.camera)
                                  .then((value) {
                                image = value;
                                Navigator.pop(context);
                                setState(() {});
                              });
                            })),
                    SizedBox(
                      width: 10.w,
                    ),
                    Expanded(
                        child: CommonButton(
                            title: Strings.gallery,
                            onTap: () async {
                              ImagePicker imagePicker = ImagePicker();
                              await imagePicker
                                  .pickImage(
                                      imageQuality: 100,
                                      source: ImageSource.gallery)
                                  .then((value) {
                                image = value;
                                Navigator.pop(context);
                                setState(() {});
                              });
                            })),
                  ],
                ),
                SizedBox(
                  height: 20.h,
                ),
              ],
            ).paddingSymmetric(horizontal: 20.w),
          );
        });
  }
}
