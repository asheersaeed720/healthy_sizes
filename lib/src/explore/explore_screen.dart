import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:healthy_sizes/src/main/main_screen_controller.dart';
import 'package:healthy_sizes/utils/constants.dart';
import 'package:healthy_sizes/widgets/custom_async_btn.dart';
import 'package:healthy_sizes/widgets/screen_bg_widget.dart';

class ExploreScreen extends StatelessWidget {
  static const String routeName = '/explore';

  ExploreScreen({super.key});

  final _mainScreenCtrl = Get.put(MainScreenController());

  final _searchTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Image.asset('assets/icons/plan.png'),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Image.asset('assets/icons/explore.png'),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Image.asset('assets/icons/shop.png'),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Image.asset('assets/icons/menu.png'),
            label: '',
          ),
        ],
        currentIndex: _mainScreenCtrl.selectedIndex,
        selectedItemColor: kPrimaryColor,
        unselectedItemColor: Colors.grey.shade700,
        selectedIconTheme: const IconThemeData(color: kPrimaryColor),
        unselectedIconTheme: IconThemeData(color: Colors.grey.shade700),
        onTap: _mainScreenCtrl.onItemTapped,
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            const SizedBox(
              height: 720,
              child: ScreenBgWidget(isHideHeading: true),
            ),
            Positioned(
              top: 52.0,
              left: 20.0,
              right: 20.0,
              child: SizedBox(
                height: 1010,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // CustomInputField(
                    //   hintText: 'hintText',
                    //   controller: _searchTextController,
                    //   keyboardType: TextInputType.text,
                    // ),
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: 'What did you eat?',
                        hintStyle: const TextStyle(fontSize: 14.0),
                        filled: true,
                        fillColor: Colors.white,
                        contentPadding: const EdgeInsets.only(left: 12.0, top: 12.0),
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(kBorderRadius),
                        ),
                        suffixIcon: const Icon(Icons.qr_code_scanner_rounded, color: kPrimaryColor),
                        prefixIcon: const Icon(Icons.search),
                      ),
                    ),
                    const SizedBox(height: 16.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Breakfast', style: kTitleStyle),
                        Text('0 Kcal', style: kBodyStyle),
                      ],
                    ),
                    const SizedBox(height: 16.0),
                    Container(
                      // height: 740,
                      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 32.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(kBorderRadius),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          ListTile(
                            title: Text(
                              'Coffe with milk',
                              style: kBodyStyle.copyWith(color: kPrimaryColor),
                            ),
                            subtitle: Text('299 kcal'),
                            trailing: Icon(Icons.add_box, color: kPrimaryColor),
                          ),
                          ListTile(
                            title: Text(
                              'Coffe with milk',
                              style: kBodyStyle.copyWith(color: kPrimaryColor),
                            ),
                            subtitle: Text('299 kcal'),
                            trailing: Icon(Icons.add_box, color: kPrimaryColor),
                          ),
                          ListTile(
                            title: Text(
                              'Coffe with milk',
                              style: kBodyStyle.copyWith(color: kPrimaryColor),
                            ),
                            subtitle: Text('299 kcal'),
                            trailing: Icon(Icons.add_box, color: kPrimaryColor),
                          ),
                          ListTile(
                            title: Text(
                              'Coffe with milk',
                              style: kBodyStyle.copyWith(color: kPrimaryColor),
                            ),
                            subtitle: Text('299 kcal'),
                            trailing: Icon(Icons.add_box, color: kPrimaryColor),
                          ),
                          ListTile(
                            title: Text(
                              'Coffe with milk',
                              style: kBodyStyle.copyWith(color: kPrimaryColor),
                            ),
                            subtitle: Text('299 kcal'),
                            trailing: Icon(Icons.add_box, color: kPrimaryColor),
                          ),
                          ListTile(
                            title: Text(
                              'Coffe with milk',
                              style: kBodyStyle.copyWith(color: kPrimaryColor),
                            ),
                            subtitle: Text('299 kcal'),
                            trailing: Icon(Icons.add_box, color: kPrimaryColor),
                          ),
                          CustomAsyncBtn(
                            btnTxt: 'Add to breakfast',
                            onPress: () {},
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
