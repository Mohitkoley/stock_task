import 'package:auto_route/auto_route.dart';
import 'package:common_extension/common_extension.dart';
import 'package:flutter/material.dart';
import 'package:stock_task/const/resource.dart';
import 'package:stock_task/features/dashboard/widgets/bottom_toolbar.dart';

import '../../../core/theme/color_palette.dart';

@RoutePage()
class UserInfoScreen extends StatefulWidget {
  const UserInfoScreen({super.key});

  @override
  State<UserInfoScreen> createState() => _UserInfoScreenState();
}

class _UserInfoScreenState extends State<UserInfoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "User information",
          style: context.textTheme.titleLarge?.copyWith(color: Colors.white),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0).copyWith(bottom: 0, top: 0),
            child: Column(
              crossAxisAlignment: .center,
              mainAxisAlignment: .start,
              children: [
                Align(
                  alignment: .center,
                  child: Container(
                    height: 120,
                    width: 120,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: AssetImage(R.ASSETS_IMAGES_PNG_USER_PNG),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
                Text(
                  "ByeWind",
                  style: context.bodyLarge.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 23,
                  ),
                ),
                20.hBox,
                UserInfoTile(
                  child: Row(
                    mainAxisAlignment: .spaceBetween,
                    children: [
                      Text(
                        "Serial",
                        style: context.titleLarge.copyWith(color: Colors.white),
                      ),
                      Text(
                        "#CM9801",
                        style: context.titleLarge.copyWith(
                          color: ColorPalette.textColor,
                        ),
                      ),
                    ],
                  ),
                ),
                20.hBox,
                UserInfoTile(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: .spaceBetween,
                        children: [
                          Text("Name", style: context.titleLarge.copyWith()),
                          Row(
                            children: [
                              Text(
                                "ByeWind",
                                style: context.titleLarge.copyWith(
                                  color: ColorPalette.textColor,
                                ),
                              ),
                              Icon(
                                Icons.chevron_right_rounded,
                                color: ColorPalette.textColor,
                              ),
                            ],
                          ),
                        ],
                      ),
                      10.hBox,
                      Divider(color: Colors.white.withAlpha(70), thickness: 1),
                      10.hBox,
                      Row(
                        mainAxisAlignment: .spaceBetween,
                        children: [
                          Text("Email", style: context.titleLarge.copyWith()),
                          Row(
                            children: [
                              Text(
                                "byewind@twitter.com",
                                style: context.titleLarge.copyWith(
                                  color: ColorPalette.textColor,
                                ),
                              ),
                              Icon(
                                Icons.chevron_right_rounded,
                                color: ColorPalette.textColor,
                              ),
                            ],
                          ),
                        ],
                      ),
                      10.hBox,
                      Divider(color: Colors.white.withAlpha(70), thickness: 1),
                      10.hBox,
                      Row(
                        mainAxisAlignment: .spaceBetween,
                        children: [
                          Text("Address", style: context.titleLarge.copyWith()),
                          Row(
                            children: [
                              Text(
                                "Meadow Lane Oakland",
                                style: context.titleLarge.copyWith(
                                  color: ColorPalette.textColor,
                                ),
                              ),
                              Icon(
                                Icons.chevron_right_rounded,
                                color: ColorPalette.textColor,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                20.hBox,
                UserInfoTile(
                  child: Row(
                    mainAxisAlignment: .spaceBetween,
                    children: [
                      Text(
                        "Registration date",
                        style: context.titleLarge.copyWith(color: Colors.white),
                      ),
                      Text(
                        overflow: TextOverflow.ellipsis,
                        "Feb 02, 2024,8:00..",
                        style: context.titleLarge.copyWith(
                          color: ColorPalette.textColor,
                        ),
                      ),
                    ],
                  ),
                ),
                20.hBox,
                UserInfoTile(
                  child: Row(
                    mainAxisAlignment: .spaceBetween,
                    children: [
                      Text(
                        "Note",
                        style: context.titleLarge.copyWith(color: Colors.white),
                      ),
                      Icon(
                        Icons.chevron_right_rounded,
                        color: ColorPalette.textColor,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Spacer(),
          BottomToolbar(
            child: Row(
              mainAxisAlignment: .center,

              children: [
                IconButton(
                  onPressed: () {},
                  iconSize: 30,
                  icon: Icon(Icons.delete_rounded),
                ),

                IconButton(
                  iconSize: 30,
                  onPressed: () {},
                  icon: Icon(Icons.content_copy),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class UserInfoTile extends StatelessWidget {
  const UserInfoTile({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),

      decoration: BoxDecoration(
        color: ColorPalette.tileColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: child,
    );
  }
}
