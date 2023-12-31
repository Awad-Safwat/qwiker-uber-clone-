import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qwiker_rider/core/theaming/app_colors.dart';
import 'package:qwiker_rider/core/theaming/app_fonts.dart';
import 'package:qwiker_rider/core/widgets/custom_button.dart';
import 'package:qwiker_rider/features/request_ride/presentation/manager/confirm_a_ride_cubit/confirm_ride_cubit.dart';
import 'package:qwiker_rider/features/request_ride/presentation/manager/request_a_ride_cubit/request_a_ride_cubit.dart';

class AvailableRidesWidget extends StatefulWidget {
  const AvailableRidesWidget({super.key});

  @override
  State<AvailableRidesWidget> createState() => _AvailableRidesWidgetState();
}

class _AvailableRidesWidgetState extends State<AvailableRidesWidget> {
  String isSelected = '';
  @override
  Widget build(BuildContext context) {
    var requestARideCubit = BlocProvider.of<RequestARideCubit>(context);
    var confirmRideCubit = BlocProvider.of<ConfirmRideCubit>(context);

    return Container(
      decoration: BoxDecoration(
          color: AppColors.whaite,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40.r), topRight: Radius.circular(40.r))),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 10.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Available Rides',
                  style: AppFonts.poppinsMedium_20
                      .copyWith(color: AppColors.black),
                ),
                Text(
                  "${requestARideCubit.totalDistance.toStringAsFixed(2)} KM",
                  style: AppFonts.poppinsMedium_16,
                )
              ],
            ),
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  Card(
                    color: AppColors.whaite,
                    clipBehavior: Clip.hardEdge,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.r)),
                    child: ListTile(
                      title: Text(
                        "Car",
                        style: AppFonts.poppinsMedium_16,
                      ),
                      trailing: Text(
                        r'$'
                        '${(requestARideCubit.totalDistance * 25).toStringAsFixed(2)}',
                        style: AppFonts.poppinsMedium_16,
                      ),
                      subtitle: Text(
                        '4+1 Person',
                        style: AppFonts.poppinsRegularGray_12,
                      ),
                      leading: SizedBox(
                          height: 45.h,
                          width: 65.w,
                          child:
                              Image.asset('assets/images/small_car_image.png')),
                      selected: isSelected == "Car" ? true : false,
                      selectedColor: AppColors.mainBlue,
                      selectedTileColor: AppColors.liteBlue,
                      onTap: () {
                        setState(() {
                          isSelected = 'Car';
                        });
                      },
                    ),
                  ),
                  Card(
                    color: AppColors.whaite,
                    clipBehavior: Clip.hardEdge,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.r)),
                    child: ListTile(
                      title: Text(
                        "TokTok",
                        style: AppFonts.poppinsMedium_16,
                      ),
                      trailing: Text(
                        r'$'
                        '${(requestARideCubit.totalDistance * 15).toStringAsFixed(2)}',
                        style: AppFonts.poppinsMedium_16,
                      ),
                      subtitle: Text(
                        '2+1 Person',
                        style: AppFonts.poppinsRegularGray_12,
                      ),
                      leading: SizedBox(
                          height: 45.h,
                          width: 65.w,
                          child: Image.asset('assets/images/toktok_image.png')),
                      selected: isSelected == "TokTok" ? true : false,
                      selectedColor: AppColors.mainBlue,
                      selectedTileColor: AppColors.liteBlue,
                      onTap: () {
                        setState(() {
                          isSelected = 'TokTok';
                        });
                      },
                    ),
                  ),
                  Card(
                    color: AppColors.whaite,
                    clipBehavior: Clip.hardEdge,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.r)),
                    child: ListTile(
                      title: Text(
                        "Bike",
                        style: AppFonts.poppinsMedium_16,
                      ),
                      trailing: Text(
                        r'$'
                        '${(requestARideCubit.totalDistance * 10).toStringAsFixed(2)}',
                        style: AppFonts.poppinsMedium_16,
                      ),
                      subtitle: Text(
                        '1 Person',
                        style: AppFonts.poppinsRegularGray_12,
                      ),
                      leading: SizedBox(
                          height: 45.h,
                          width: 65.w,
                          child: Image.asset('assets/images/bike_image.png')),
                      selected: isSelected == "Bike" ? true : false,
                      selectedColor: AppColors.mainBlue,
                      selectedTileColor: AppColors.liteBlue,
                      onTap: () {
                        setState(() {
                          isSelected = 'Bike';
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
            Center(
              child: CustomButton(
                height: 55.h,
                onPressed: () {
                  confirmRideCubit.bookRide();
                },
                title: "Book Ride",
              ),
            )
          ],
        ),
      ),
    );
  }
}
