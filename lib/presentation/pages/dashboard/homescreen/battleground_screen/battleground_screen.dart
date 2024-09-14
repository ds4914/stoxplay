import 'package:stoxplay/shared/widgets/common_icon.dart';

import '../../../../../shared/shared.dart';
import '../../../../../shared/widgets/common_back_button.dart';

class BattlegroundScreen extends StatelessWidget {
  const BattlegroundScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/images/battleground_background.png',
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.fill,
              height: MediaQuery.of(context).size.height,
            ),
          ),
          Column(
            children: [
              appBarRow(context),
              Container(
                height: 40.h,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: AppColors.transparentColor,
                    border: Border.all(color: AppColors.white),
                    borderRadius: BorderRadius.circular(15.r)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextView(
                      text: Strings.points,
                      fontWeight: FontWeight.w700,
                      fontSize: 16.sp,
                    ),
                    TextView(
                      text: Strings.rank,
                      fontWeight: FontWeight.w700,
                      fontSize: 16.sp,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.restart_alt,
                          color: AppColors.white,
                          size: 25.sp,
                        ),
                        SizedBox(
                          width: 5.w,
                        ),
                        Icon(
                          Icons.edit_note_sharp,
                          color: AppColors.white,
                          size: 25.sp,
                        ),
                      ],
                    ),
                  ],
                ).paddingSymmetric(horizontal: 20.w),
              ).paddingSymmetric(horizontal: 14.w, vertical: 10.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  commonCardContainer("Axis Bank", false),
                  commonCardContainer("HDFC Bank", true),
                  commonCardContainer("ICICI Bank", false),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  commonCardContainer("Bandhan Bank", false),
                  commonCardContainer("Bank Of Baroda", false),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  commonCardContainer("BOI Bank", false),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  commonCardContainer("Central Bank", true),
                  commonCardContainer("IDBI Bank", false),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  commonCardContainer("Karnataka Bank", true),
                  commonCardContainer("RBL Bank", false),
                  commonCardContainer("Yes Bank", true),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget commonCardContainer(String title, bool isUp) {
    return Container(
      height: 100.h,
      width: 95.w,
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
            color: isUp ? AppColors.upButtonColor : AppColors.red,
            spreadRadius: 3.0,
            blurRadius: 3.0)
      ], color: AppColors.white, borderRadius: BorderRadius.circular(15.r)),
      child: Container(
        decoration: BoxDecoration(
            color: AppColors.white,
            border: Border.all(color: AppColors.red),
            borderRadius: BorderRadius.circular(15.r)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                  "assets/images/bank_wars/axis_bank.png",
                  height: 40.h,
                  width: 40.w,
                ),
                Column(
                  children: [
                    RichText(
                        text: TextSpan(children: [
                      TextSpan(
                          text: "6.0",
                          style: TextStyle(
                              color: AppColors.black, fontSize: 10.sp)),
                      WidgetSpan(
                        child: Transform.translate(
                          offset: const Offset(0.0, -5.0),
                          child: Text(
                            'p',
                            style:
                                TextStyle(fontSize: 10.sp, color: Colors.red),
                          ),
                        ),
                      ),
                    ])).paddingTop(5.h),
                    SizedBox(
                        width: 30.w,
                        child: Divider(
                          color: AppColors.color999999,
                        )),
                    Image.asset(
                      isUp?"assets/images/up_arrow.png":"assets/images/down_arrow.png",
                      height: 15.h,
                      width: 15.w,
                    ),
                  ],
                ).paddingRight(5.w),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        TextView(
                          text: "₹1,175",
                          fontColor: AppColors.black,
                          fontSize: 12.sp,
                        ),
                        TextView(
                            text: "(0.01%)",
                            fontColor: AppColors.red,
                            fontSize: 10.sp),
                      ],
                    ),
                    Column(
                      children: [
                        TextView(
                          text: "CL",
                          fontColor: AppColors.blue,
                          fontSize: 15.sp,
                          fontWeight: FontWeight.bold,
                        ),
                        TextView(
                          text: Strings.tenX,
                          fontColor: AppColors.blue,
                          fontSize: 10.sp,
                          fontWeight: FontWeight.bold,
                        )
                      ],
                    )
                  ],
                ),
                Center(
                    child: TextView(
                  text: title,
                  overflow: TextOverflow.ellipsis,
                  fontColor: AppColors.black,
                  fontSize: 12.sp,
                ))
              ],
            ).paddingSymmetric(horizontal: 5.w),
          ],
        ),
      ).paddingSymmetric(horizontal: 3.w, vertical: 3.h),
    ).paddingSymmetric(vertical: 4.h);
  }

  Widget appBarRow(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.colorPrimaryYellow,
        gradient: LinearGradient(colors: [
          AppColors.gradientTwo,
          AppColors.gradientOne,
        ]),
        border: Border.all(color: AppColors.color666666),
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(30.r),
            bottomRight: Radius.circular(30.r)),
      ),
      child: Row(
        children: [
          CommonBackButton(onTap: () {
            Navigator.pop(context);
          }),
          SizedBox(
            width: 10.w,
          ),
          Expanded(
            child: TextView(
              text: Strings.bhavesh,
              fontSize: 20.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
          Row(
            children: [
              GestureDetector(
                  onTap: () {},
                  child: Container(
                    height: 30.h,
                    width: 30.w,
                    decoration: BoxDecoration(
                      color: AppColors.transparentColor,
                    ),
                    child: Icon(
                      Icons.share,
                      color: AppColors.white,
                      size: 30.sp,
                    ),
                  )),
              SizedBox(
                width: 10.w,
              ),
              GestureDetector(
                  onTap: () {},
                  child: Container(
                    height: 30.h,
                    width: 30.w,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.gradientOne,
                        boxShadow: [
                          BoxShadow(
                              color: AppColors.white,
                              blurRadius: 0.0,
                              spreadRadius: 0.0)
                        ],
                        border: Border.all(color: AppColors.white)),
                    child: Icon(
                      Icons.question_mark,
                      color: AppColors.white,
                      size: 20.sp,
                    ),
                  )),
            ],
          ),
        ],
      ).paddingTop(20.h).paddingSymmetric(vertical: 10.h, horizontal: 20.w),
    );
  }
}
