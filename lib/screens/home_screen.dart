import 'dart:math';

import 'package:contained_tab_bar_view/contained_tab_bar_view.dart';
import 'package:flutter/material.dart';
import 'package:quds_popup_menu/quds_popup_menu.dart';
import 'package:roqqu_levels/utilities/colors.dart';
import 'package:roqqu_levels/utilities/constants.dart';
import 'package:roqqu_levels/utilities/order_book.dart';
import 'package:roqqu_levels/utilities/recent_trades.dart';
import 'package:roqqu_levels/utilities/toggler.dart';

import '../utilities/charts.dart';
import '../utilities/toggles.dart';
import 'bottom_sheet.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shape: const Border(
          bottom: BorderSide(color: RoqquColors.color6),
        ),
        elevation: 0.0,
        backgroundColor: RoqquColors.color1,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset(
              'assets/icons/logo.png',
              width: 20.76,
              height: 34.0,
            ),
            const SizedBox(
              width: 9.29,
            ),
            const Text('Sisyphus'),
            const SizedBox(
              width: 117.61,
            ),
            Image.asset(
              'assets/icons/avatar.png',
              width: 32.0,
              height: 32.0,
            ),
            const SizedBox(
              width: 16,
            ),
            Image.asset(
              'assets/icons/globe.png',
              width: 24.0,
              height: 24.0,
            ),
            const SizedBox(
              width: 20.8,
            ),
            QudsPopupButton(
              backgroundColor: RoqquColors.color5,
              items: [
                QudsPopupMenuItem(
                  title: const Text('Exchange'),
                  onPressed: () {},
                ),
                QudsPopupMenuItem(
                  title: const Text('Wallets'),
                  onPressed: () {},
                ),
                QudsPopupMenuItem(
                  title: const Text('Roqqu Hub'),
                  onPressed: () {},
                ),
                QudsPopupMenuItem(
                  title: const Text('Log out'),
                  onPressed: () {},
                ),
              ],
              child: Image.asset(
                'assets/icons/menu.png',
                width: 22.4,
                height: 19.2,
              ),
            ),
          ],
        ),
      ),
      body: ListView(
        children: [
          Column(
            children: [
              Container(
                padding: const EdgeInsets.only(left: 16.0),
                width: double.infinity,
                height: 145.0,
                decoration: const BoxDecoration(
                  color: RoqquColors.color1,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      children: [
                        Image.asset(
                          'assets/icons/coingroup.png',
                          width: 44.0,
                          height: 24.0,
                        ),
                        const SizedBox(
                          width: 8.0,
                        ),
                        const Text(
                          'BTC/USDT',
                          style: kText0,
                        ),
                        const SizedBox(
                          width: 8.0,
                        ),
                        const Icon(Icons.keyboard_arrow_down_sharp),
                        const SizedBox(
                          width: 27.0,
                        ),
                        const Text(
                          '\$20,634',
                          style: kText5,
                        ),
                      ],
                    ),
                    Row(
                      children: const [
                        Icon(
                          Icons.access_time,
                          color: RoqquColors.color3,
                        ),
                        SizedBox(
                          width: 5.33,
                        ),
                        Text(
                          '24h change',
                          style: kText1,
                        ),
                        SizedBox(
                          width: 33.33,
                        ),
                        Icon(
                          Icons.arrow_upward_sharp,
                          color: RoqquColors.color3,
                        ),
                        SizedBox(
                          width: 8.67,
                        ),
                        Text(
                          '24h high',
                          style: kText1,
                        ),
                        SizedBox(
                          width: 36.67,
                        ),
                        Icon(
                          Icons.arrow_downward_sharp,
                          color: RoqquColors.color3,
                        ),
                        SizedBox(
                          width: 9.33,
                        ),
                        Text(
                          '24h low',
                          style: kText1,
                        ),
                      ],
                    ),
                    Row(
                      children: const [
                        Text(
                          '520.80 + 1.25%',
                          style: kText2,
                        ),
                        SizedBox(
                          width: 28.0,
                        ),
                        Text(
                          '520.80 + 1.25%',
                          style: kText3,
                        ),
                        SizedBox(
                          width: 32.0,
                        ),
                        Text(
                          '520.80 + 1.25%',
                          style: kText3,
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Container(
                height: 8.0,
                color: RoqquColors.color10,
              ),
              Container(
                width: double.infinity,
                height: 631.0,
                decoration: const BoxDecoration(
                  color: RoqquColors.color1,
                ),
                child: Column(
                  children: [
                    // Charts(),
                    Expanded(
                      child: ContainedTabBarView(
                          tabBarProperties: TabBarProperties(
                            margin: const EdgeInsets.only(top: 16.0, bottom: 18.0, left: 19.0, right: 19.0),
                            width: 400.0,
                            height: 40.0,
                            background: Container(
                              decoration: BoxDecoration(
                                color: RoqquColors.color4,
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                            indicator: ContainerTabIndicator(
                              color: RoqquColors.color6,
                              radius: BorderRadius.circular(10.0),
                            ),
                            indicatorColor: Colors.transparent,
                            //unselectedLabelColor: Colors.grey[400],
                          ),
                          tabs: const [
                            Text('Charts'),
                            Text('Orderbook'),
                            Text('Recent Trades'),
                          ],
                          views: const [
                            Charts(),
                            Orderbook(),
                            RecentTrades(),
                          ]),
                    ),
                  ],
                ),
              ),
              Container(
                height: 8.0,
                color: RoqquColors.color10,
              ),
              Container(
                width: double.infinity,
                height: 350.0,
                decoration: const BoxDecoration(
                  color: RoqquColors.color1,
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 16.0, bottom: 18.0, left: 19.0, right: 19.0),
                          child: Container(
                            height: 40.0,
                            decoration: BoxDecoration(
                              color: RoqquColors.color4,
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: ToggleButtons(
                              renderBorder: false,
                              isSelected: isSelected,
                              selectedColor: Colors.white,
                              fillColor: RoqquColors.color6,
                              borderRadius: BorderRadius.circular(10.0),
                              highlightColor: RoqquColors.color5,
                              color: Colors.white,
                              constraints: BoxConstraints(
                                minWidth: MediaQuery.of(context).size.width *
                                    0.9 /
                                    max(1, isSelected.length),
                              ),
                              children: const [
                                Toggles(
                                  text: 'Open Orders',
                                ),
                                Toggles(
                                  text: 'Positions',
                                ),
                                Toggles(
                                  text: 'Order History',
                                ),
                              ],
                              onPressed: (int newIndex) {
                                setState(() {
                                  for (int index = 0;
                                      index < isSelected.length;
                                      index++) {
                                    if (index == newIndex) {
                                      isSelected[index] = true;
                                    } else {
                                      isSelected[index] = false;
                                    }
                                  }
                                });
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 128.0,
                    ),
                    const Text('No Open Order'),
                    const SizedBox(
                      height: 8.0,
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 48.0, right: 48.0),
                      child: Center(
                        child: Text(
                          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Id pulvinar nullam sit imperdiet \n pulvinar.',
                          softWrap: true,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 16.0,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 171.0,
                      height: 32.0,
                      decoration: BoxDecoration(
                        color: RoqquColors.color8,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Center(
                        child: GestureDetector(
                          child: const Text(
                            'Buy',
                            style: kText4,
                          ),
                          onTap: () {
                            showModalBottomSheet(
                              isScrollControlled: true,
                              context: context,
                              builder: (context) => SingleChildScrollView(
                                child: Container(
                                    padding: EdgeInsets.only(
                                      bottom: MediaQuery.of(context)
                                          .viewInsets
                                          .bottom,
                                    ),
                                    child: const Bottomsheet()),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                    Container(
                      width: 171.0,
                      height: 32.0,
                      decoration: BoxDecoration(
                        color: RoqquColors.color9,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Center(
                        child: GestureDetector(
                          child: const Text(
                            'Sell',
                            style: kText4,
                          ),
                          onTap: () {
                            showModalBottomSheet(
                              isScrollControlled: true,
                              context: context,
                              builder: (context) => SingleChildScrollView(
                                child: Container(
                                    padding: EdgeInsets.only(
                                      bottom: MediaQuery.of(context)
                                          .viewInsets
                                          .bottom,
                                    ),
                                    child: const Bottomsheet()),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 16.0,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
