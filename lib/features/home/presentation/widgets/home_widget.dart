import 'package:file_manager/app/resources/color_manager.dart';
import 'package:file_manager/app/resources/styles_manager.dart';
import 'package:file_manager/app/resources/values_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeWidget extends StatelessWidget {
  const HomeWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: GridView(
        physics: const BouncingScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1 / 1,
          mainAxisSpacing: 10.0,
          crossAxisSpacing: 10.0,
          mainAxisExtent: 200.0,
        ),
        children: [
          GestureDetector(
            onTap: () {},
            child: Container(
              padding: const EdgeInsetsDirectional.all(10.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.0),
                color: ColorManager.lightGrey,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    CupertinoIcons.group,
                    size: AppSize.s40,
                    color: ColorManager.white,
                  ),
                  Text(
                    'Group One',
                    style: getBoldStyle(
                        color: ColorManager.primary, fontSize: AppPadding.p28),
                  ),
                  const SizedBox(
                    height: 8.0,
                  ),
                  Text(
                    '20.0 Member',
                    style: getLightStyle(color: ColorManager.white),
                  )
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {},
            child: Container(
              padding: const EdgeInsetsDirectional.all(10.0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.0),
                  color: ColorManager.lightGrey),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    CupertinoIcons.group,
                    size: AppSize.s40,
                    color: ColorManager.white,
                  ),
                  Text(
                    'Group One',
                    style: getBoldStyle(
                        color: ColorManager.primary, fontSize: AppPadding.p28),
                  ),
                  const SizedBox(
                    height: 8.0,
                  ),
                  Text(
                    '20.0 Member',
                    style: getLightStyle(color: ColorManager.white),
                  )
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {},
            child: Container(
              padding: const EdgeInsetsDirectional.all(10.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.0),
                color: ColorManager.lightGrey,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    CupertinoIcons.group,
                    size: AppSize.s40,
                    color: ColorManager.white,
                  ),
                  Text(
                    'Group One',
                    style: getBoldStyle(
                        color: ColorManager.primary, fontSize: AppPadding.p28),
                  ),
                  const SizedBox(
                    height: 8.0,
                  ),
                  Text(
                    '20.0 Member',
                    style: getLightStyle(color: ColorManager.white),
                  )
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {},
            child: Container(
              padding: const EdgeInsetsDirectional.all(10.0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.0),
                  color: ColorManager.lightGrey),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    CupertinoIcons.group,
                    size: AppSize.s40,
                    color: ColorManager.white,
                  ),
                  Text(
                    'Group One',
                    style: getBoldStyle(
                        color: ColorManager.primary, fontSize: AppPadding.p28),
                  ),
                  const SizedBox(
                    height: 8.0,
                  ),
                  Text(
                    '20.0 Member',
                    style: getLightStyle(color: ColorManager.white),
                  )
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {},
            child: Container(
              padding: const EdgeInsetsDirectional.all(10.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.0),
                color: ColorManager.lightGrey,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    CupertinoIcons.group,
                    size: AppSize.s40,
                    color: ColorManager.white,
                  ),
                  Text(
                    'Group One',
                    style: getBoldStyle(
                        color: ColorManager.primary, fontSize: AppPadding.p28),
                  ),
                  const SizedBox(
                    height: 8.0,
                  ),
                  Text(
                    '20.0 Member',
                    style: getLightStyle(color: ColorManager.white),
                  )
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {},
            child: Container(
              padding: const EdgeInsetsDirectional.all(10.0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.0),
                  color: ColorManager.lightGrey),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    CupertinoIcons.group,
                    size: AppSize.s40,
                    color: ColorManager.white,
                  ),
                  Text(
                    'Group One',
                    style: getBoldStyle(
                        color: ColorManager.primary, fontSize: AppPadding.p28),
                  ),
                  const SizedBox(
                    height: 8.0,
                  ),
                  Text(
                    '20.0 Member',
                    style: getLightStyle(color: ColorManager.white),
                  )
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {},
            child: Container(
              padding: const EdgeInsetsDirectional.all(10.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.0),
                color: ColorManager.lightGrey,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    CupertinoIcons.group,
                    size: AppSize.s40,
                    color: ColorManager.white,
                  ),
                  Text(
                    'Group One',
                    style: getBoldStyle(
                        color: ColorManager.primary, fontSize: AppPadding.p28),
                  ),
                  const SizedBox(
                    height: 8.0,
                  ),
                  Text(
                    '20.0 Member',
                    style: getLightStyle(color: ColorManager.white),
                  )
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {},
            child: Container(
              padding: const EdgeInsetsDirectional.all(10.0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.0),
                  color: ColorManager.lightGrey),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    CupertinoIcons.group,
                    size: AppSize.s40,
                    color: ColorManager.white,
                  ),
                  Text(
                    'Group One',
                    style: getBoldStyle(
                        color: ColorManager.primary, fontSize: AppPadding.p28),
                  ),
                  const SizedBox(
                    height: 8.0,
                  ),
                  Text(
                    '20.0 Member',
                    style: getLightStyle(color: ColorManager.white),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
