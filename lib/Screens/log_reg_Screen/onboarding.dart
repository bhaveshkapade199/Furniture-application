import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:furniture_app/Screens/log_reg_Screen/login_screen.dart';
import 'package:furniture_app/Screens/log_reg_Screen/register.dart';

class OnboardingTabs extends StatefulWidget {
  const OnboardingTabs({super.key, required this.index});
  final int index;

  @override
  State<OnboardingTabs> createState() => _OnboardingTabsState();
}

class _OnboardingTabsState extends State<OnboardingTabs>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  double containerHeight = 534.0;
  double topPosition = 266.0;

  @override
  void initState() {
    super.initState();
    _tabController =
        TabController(length: 2, vsync: this, initialIndex: widget.index);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: Stack(
            children: [
              const SizedBox(
                height: double.infinity,
              ),
              Positioned(
                child: Image.asset(
                  "assets/images/home_page.jpg",
                  height: 386,
                  fit: BoxFit.fill,
                ),
              ),
              Positioned(
                top: topPosition,
                left: 0,
                right: 0,
                bottom: 0,
                child: Container(
                  height: containerHeight,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(28.85),
                      topRight: Radius.circular(28.85),
                    ),
                    color: Colors.white,
                  ),
                  child: Column(
                    children: [
                      TabBar(
                        onTap: (value) {
                          setState(() {
                            if (value == 0) {
                              containerHeight = 534.0.h;
                              topPosition = 255.0;
                            } else {
                              containerHeight = 646.0.h;
                              topPosition = 154.0;
                            }
                          });
                        },
                        dividerColor: Colors.transparent,
                        labelPadding: const EdgeInsets.fromLTRB(40, 15, 40, 0),
                        controller: _tabController,
                        labelColor: const Color.fromRGBO(46, 46, 46, 1),
                        tabs: const [
                          Tab(
                            text: 'Log in',
                          ),
                          Tab(
                            text: 'Register',
                          ),
                        ],
                        indicator: const BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color: Color.fromARGB(255, 0, 119, 119),
                              width: 2.08,
                            ),
                          ),
                        ),
                        indicatorSize: TabBarIndicatorSize.tab,
                        indicatorPadding:
                            const EdgeInsets.symmetric(horizontal: 50),
                        indicatorColor: Colors.black,
                        labelStyle:
                            Theme.of(context).textTheme.bodyMedium!.copyWith(
                                  fontSize: 21,
                                  fontWeight: FontWeight.bold,
                                ),
                      ),
                      Expanded(
                        child: TabBarView(
                          controller: _tabController,
                          children: [
                            LoginScreen(tabController: _tabController),
                            const Register()
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
