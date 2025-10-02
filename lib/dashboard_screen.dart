import 'package:flutter/material.dart';
import 'theme.dart';
import 'utils/responsive.dart';
import 'widgets/sidebar.dart';
import 'widgets/main_content.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            if (context.isDesktop) {
              return Row(
                children: const [
                  Expanded(flex: 2, child: SideMenu()),
                  Expanded(flex: 6, child: MainContent()),
                  Expanded(flex: 3, child: RightSidebar()),
                ],
              );
            } else if (context.isTablet) {
              return Row(
                children: const [
                  Expanded(flex: 2, child: SideMenu()),
                  Expanded(flex: 7, child: MainContent()),
                ],
              );
            } else {
              return _MobileScaffold();
            }
          },
        ),
      ),
    );
  }
}

class _MobileScaffold extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Drawer(child: SideMenu()),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: false,
        title: const Text(
          'Home',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.notifications_none),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.settings_outlined),
          ),
        ],
      ),
      body: const MainContent(isMobile: true),
      backgroundColor: AppColors.bg,
    );
  }
}