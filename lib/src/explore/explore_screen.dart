import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:healthy_sizes/src/main/main_screen_controller.dart';
import 'package:healthy_sizes/utils/constants.dart';
import 'package:healthy_sizes/widgets/custom_async_btn.dart';
import 'package:healthy_sizes/widgets/screen_bg_widget.dart';

class ExploreScreen extends StatefulWidget {
  static const String routeName = '/explore';

  ExploreScreen({super.key});

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  final _mainScreenCtrl = Get.put(MainScreenController());

  final _searchTextController = TextEditingController();

  int _index = 0;

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
              height: 900,
              child: ScreenBgWidget(isHideHeading: true),
            ),
            Positioned(
              top: 52.0,
              left: 20.0,
              right: 20.0,
              child: SizedBox(
                height: 1000,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
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
                          DefaultTabController(
                            length: 3,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Container(
                                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(kBorderRadius),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.3),
                                        spreadRadius: 3,
                                        blurRadius: 5,
                                        offset: const Offset(0, 2),
                                      ),
                                    ],
                                  ),
                                  child: TabBar(
                                    indicatorWeight: 1.0,
                                    indicatorColor: Colors.white,
                                    labelColor: Colors.white,
                                    labelStyle: kBodyStyle,
                                    unselectedLabelColor: Colors.grey.shade800,
                                    controller: null,
                                    onTap: (selected) {
                                      setState(() {
                                        _index = selected;
                                      });
                                    },
                                    tabs: [
                                      Container(
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                          color: _index == 0 ? kPrimaryColor : Colors.white,
                                          borderRadius: BorderRadius.circular(kBorderRadius),
                                        ),
                                        child: const Tab(text: "Foods"),
                                      ),
                                      Container(
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                          color: _index == 1 ? kPrimaryColor : Colors.white,
                                          borderRadius: BorderRadius.circular(kBorderRadius),
                                        ),
                                        child: const Tab(text: "Favorites"),
                                      ),
                                      Container(
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                          color: _index == 2 ? kPrimaryColor : Colors.white,
                                          borderRadius: BorderRadius.circular(kBorderRadius),
                                        ),
                                        child: const Tab(text: "Dishes"),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 600, // MediaQuery.of(context).size.height,
                                  child: TabBarView(
                                    physics: const NeverScrollableScrollPhysics(),
                                    children: [
                                      _buidItemView(),
                                      _buidItemView(),
                                      _buidItemView(),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
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

  Widget _buidItemView() {
    return Column(
      children: [
        ListTile(
          contentPadding: EdgeInsets.zero,
          leading: DropdownButton<String>(
            value: '100g',
            items: const [
              DropdownMenuItem(
                value: '100g',
                child: Text('100g'),
              ),
              DropdownMenuItem(
                value: '50g',
                child: Text('50g'),
              ),
            ],
            onChanged: (value) {},
          ),
          title: Text(
            'Coffe with milk',
            style: kBodyStyle.copyWith(color: kPrimaryColor),
          ),
          subtitle: const Text('299 kcal'),
          trailing: const Icon(Icons.add_box, color: kPrimaryColor),
        ),
        ListTile(
          contentPadding: EdgeInsets.zero,
          leading: DropdownButton<String>(
            value: '100g',
            items: const [
              DropdownMenuItem(
                value: '100g',
                child: Text('100g'),
              ),
              DropdownMenuItem(
                value: '50g',
                child: Text('50g'),
              ),
            ],
            onChanged: (value) {},
          ),
          title: Text(
            'Sandwich',
            style: kBodyStyle.copyWith(color: kPrimaryColor),
          ),
          subtitle: const Text('300 kcal'),
          trailing: const Icon(Icons.add_box, color: kPrimaryColor),
        ),
        ListTile(
          contentPadding: EdgeInsets.zero,
          leading: DropdownButton<String>(
            value: '1',
            items: const [
              DropdownMenuItem(
                value: '1',
                child: Text('1'),
              ),
              DropdownMenuItem(
                value: '2',
                child: Text('2'),
              ),
            ],
            onChanged: (value) {},
          ),
          title: Text(
            'Tomato',
            style: kBodyStyle.copyWith(color: kPrimaryColor),
          ),
          subtitle: const Text('50 kcal'),
          trailing: const Icon(Icons.add_box, color: kPrimaryColor),
        ),
        ListTile(
          contentPadding: EdgeInsets.zero,
          leading: DropdownButton<String>(
            value: '1',
            items: const [
              DropdownMenuItem(
                value: '1',
                child: Text('1'),
              ),
              DropdownMenuItem(
                value: '2',
                child: Text('2'),
              ),
            ],
            onChanged: (value) {},
          ),
          title: Text(
            'Cucumber',
            style: kBodyStyle.copyWith(color: kPrimaryColor),
          ),
          subtitle: const Text('50 kcal'),
          trailing: const Icon(Icons.add_box, color: kPrimaryColor),
        ),
        ListTile(
          contentPadding: EdgeInsets.zero,
          leading: DropdownButton<String>(
            value: '100g',
            items: const [
              DropdownMenuItem(
                value: '100g',
                child: Text('100g'),
              ),
              DropdownMenuItem(
                value: '50g',
                child: Text('50g'),
              ),
            ],
            onChanged: (value) {},
          ),
          title: Text(
            'Tea without sugar',
            style: kBodyStyle.copyWith(color: kPrimaryColor),
          ),
          subtitle: const Text('0 kcal'),
          trailing: const Icon(Icons.add_box, color: kPrimaryColor),
        ),
        ListTile(
          contentPadding: EdgeInsets.zero,
          leading: DropdownButton<String>(
            value: '1',
            items: const [
              DropdownMenuItem(
                value: '1',
                child: Text('1'),
              ),
              DropdownMenuItem(
                value: '2',
                child: Text('2'),
              ),
            ],
            onChanged: (value) {},
          ),
          title: Text(
            'Boiled edd',
            style: kBodyStyle.copyWith(color: kPrimaryColor),
          ),
          subtitle: const Text('96 kcal'),
          trailing: const Icon(Icons.add_box, color: kPrimaryColor),
        ),
        ListTile(
          contentPadding: EdgeInsets.zero,
          leading: DropdownButton<String>(
            value: '100g',
            items: const [
              DropdownMenuItem(
                value: '100g',
                child: Text('100g'),
              ),
              DropdownMenuItem(
                value: '50g',
                child: Text('50g'),
              ),
            ],
            onChanged: (value) {},
          ),
          title: Text(
            'Avocado',
            style: kBodyStyle.copyWith(color: kPrimaryColor),
          ),
          subtitle: const Text('250 kcal'),
          trailing: const Icon(Icons.add_box, color: kPrimaryColor),
        ),
        CustomAsyncBtn(
          btnTxt: 'Add to breakfast',
          onPress: () {},
        ),
      ],
    );
  }
}
