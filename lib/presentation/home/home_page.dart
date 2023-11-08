import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lover_squad_test/common/widgets/app_screen.dart';
import 'package:lover_squad_test/common/widgets/base_container.dart';
import 'package:lover_squad_test/common/widgets/custom_app_bar.dart';
import 'package:lover_squad_test/presentation/game/game_page.dart';
import 'package:lover_squad_test/presentation/settings/settings_page.dart';
import 'package:lover_squad_test/style/app_text_style.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  void _openPage(BuildContext context, Widget page) =>
      Navigator.of(context).push(MaterialPageRoute(builder: (context) => page));

  @override
  Widget build(BuildContext context) {
    List<String> items = [
      "cat",
      "flower",
      "capy",
    ];

    return AppScreen(
      content: Scaffold(
        appBar: CustomAppBar(
          showBack: false,
          action: GestureDetector(
            onTap: () => _openPage(context, const SettingsPage()),
            child: SvgPicture.asset(
              "assets/settings.svg",
            ),
          ),
        ),
        body: ListView.separated(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
          itemCount: 3,
          itemBuilder: (context, index) {
            return BaseContainer(
              onTap: () =>
                  _openPage(context, GamePage(imageType: items[index])),
              content: Padding(
                padding: const EdgeInsets.symmetric(vertical: 72),
                child: Center(
                  child: Text(
                    "Игра ${index + 1}",
                    style: AppTextStyle.base,
                  ),
                ),
              ),
            );
          },
          separatorBuilder: (context, index) {
            return const SizedBox(height: 57);
          },
        ),
      ),
    );
  }
}
