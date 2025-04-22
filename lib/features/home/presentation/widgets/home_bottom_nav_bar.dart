import 'package:dalel/core/utils/assets.dart';
import 'package:dalel/core/utils/colors.dart';
import 'package:dalel/features/cart/presentation/views/cart_view.dart';
import 'package:dalel/features/home/presentation/views/home_view.dart';
import 'package:dalel/features/home/presentation/view_model/cubit/home_cubit.dart';
import 'package:dalel/features/profile/presentation/views/profile_view.dart';
import 'package:dalel/features/search/presentation/views/search_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

class HomeBottomNavBar extends StatelessWidget {
  HomeBottomNavBar({super.key});

  final PersistentTabController _controller = PersistentTabController();
  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      controller: _controller,
      screens: _buildScreens(),
      items: _navBarsItems(),
      confineToSafeArea: true,
      hideNavigationBarWhenKeyboardAppears: true,
      backgroundColor: MyAppColors.primaryColor,
      navBarStyle: NavBarStyle.style12,
      decoration: const NavBarDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
        colorBehindNavBar: Colors.white,
      ),
    );
  }

  List<Widget> _buildScreens() {
    return [
      BlocProvider(
        create: (context) => HomeCubit()..getHistoricalPeriods(),
        child: const HomeView(),
      ),
      const CartView(),
      const SearchView(),
      const ProfileView(),  
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: SvgPicture.asset(MyAppAssets.assetsImagesHome),
        inactiveIcon: SvgPicture.asset(MyAppAssets.assetsImagesHomeInactive),
      ),
      PersistentBottomNavBarItem(
        icon: SvgPicture.asset(MyAppAssets.assetsImagesCart),
        inactiveIcon: SvgPicture.asset(MyAppAssets.assetsImagesCartInactive),
      ),
      PersistentBottomNavBarItem(
        icon: SvgPicture.asset(MyAppAssets.assetsImagesSearch),
        inactiveIcon: SvgPicture.asset(MyAppAssets.assetsImagesSearchInactive),
      ),
      PersistentBottomNavBarItem(
        icon: SvgPicture.asset(MyAppAssets.assetsImagesProfile),
        inactiveIcon: SvgPicture.asset(MyAppAssets.assetsImagesProfileInactive),
      ),
    ];
  }
}
