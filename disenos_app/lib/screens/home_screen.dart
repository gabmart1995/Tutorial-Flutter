import 'package:disenos_app/widgets/background.dart';
import 'package:disenos_app/widgets/page_title.dart';
import 'package:disenos_app/widgets/custom_bottom_navigation.dart';

import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget> [
          // Background
          const Background(),
          _HomeBody()
        ],
      ),
      bottomNavigationBar: const CustomBottomNavigation(),
    );
  }
}

class _HomeBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: const <Widget> [
          // titles
          PageTitle()
        ],
      ),
    );
  }

}