import 'package:fitness/common/colo_extension.dart';
import 'package:fitness/common_widget/tab_button.dart';
import 'package:fitness/view/main_tab/select_view.dart';
import 'package:flutter/material.dart';

import '../home/home_view.dart';
import '../photo_progress/photo_progress_view.dart';
import '../profile/profile_view.dart';

class MainTabView extends StatefulWidget {
  const MainTabView({super.key});

  @override
  State<MainTabView> createState() => _MainTabViewState();
}

class _MainTabViewState extends State<MainTabView> {
  int selectTab = 0;
  final PageStorageBucket pageBucket = PageStorageBucket();

  // Remove the constant tabs list to avoid reusing widgets
  Widget getCurrentTab() {
    switch (selectTab) {
      case 0:
        return const HomeView();
      case 1:
        return const SelectView();
      case 2:
        return const PhotoProgressView();
      case 3:
        return const ProfileView();
      default:
        return const HomeView();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TColor.white,
      body: PageStorage(
        bucket: pageBucket,
        child: getCurrentTab(),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: SizedBox(
        width: 70,
        height: 70,
        child: InkWell(
          onTap: () {
            // Define your FAB action here if needed
          },
          child: Container(
            width: 65,
            height: 65,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: TColor.primaryG,
              ),
              borderRadius: BorderRadius.circular(35),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 2,
                ),
              ],
            ),
            child: Icon(
              Icons.search,
              color: TColor.white,
              size: 35,
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          decoration: BoxDecoration(color: TColor.white, boxShadow: const [
            BoxShadow(color: Colors.black12, blurRadius: 2, offset: Offset(0, -2))
          ]),
          height: kToolbarHeight,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              TabButton(
                icon: "assets/img/home_tab.png",
                selectIcon: "assets/img/home_tab_select.png",
                isActive: selectTab == 0,
                onTap: () {
                  setState(() {
                    selectTab = 0;
                  });
                },
              ),
              TabButton(
                icon: "assets/img/activity_tab.png",
                selectIcon: "assets/img/activity_tab_select.png",
                isActive: selectTab == 1,
                onTap: () {
                  setState(() {
                    selectTab = 1;
                  });
                },
              ),
              const SizedBox(width: 40), // Space for FAB
              TabButton(
                icon: "assets/img/camera_tab.png",
                selectIcon: "assets/img/camera_tab_select.png",
                isActive: selectTab == 2,
                onTap: () {
                  setState(() {
                    selectTab = 2;
                  });
                },
              ),
              TabButton(
                icon: "assets/img/profile_tab.png",
                selectIcon: "assets/img/profile_tab_select.png",
                isActive: selectTab == 3,
                onTap: () {
                  setState(() {
                    selectTab = 3;
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
