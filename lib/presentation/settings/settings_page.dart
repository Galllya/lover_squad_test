import 'package:flame_audio/bgm.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:lover_squad_test/common/widgets/app_screen.dart';
import 'package:lover_squad_test/common/widgets/base_container.dart';
import 'package:lover_squad_test/common/widgets/custom_app_bar.dart';
import 'package:lover_squad_test/presentation/settings/bloc/settings_bloc.dart';
import 'package:lover_squad_test/style/app_colors.dart';
import 'package:lover_squad_test/style/app_text_style.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  late SettingsBloc _settingsBloc;
  @override
  void initState() {
    _settingsBloc = SettingsBloc(
      sharedPreferences: context.read<SharedPreferences>(),
      flameAudio: context.read<Bgm>(),
    );
    _settingsBloc.add(const SettingsEvent.started());

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingsBloc, SettingsState>(
      bloc: _settingsBloc,
      builder: (context, state) {
        return state.when(
          initial: () => const SizedBox(),
          loaded: (backgroundSoundActive) {
            return AppScreen(
              content: Scaffold(
                appBar: const CustomAppBar(),
                body: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 36),
                  child: Column(
                    children: [
                      BaseContainer(
                        content: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 48,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  SvgPicture.asset(
                                    "assets/audio.svg",
                                  ),
                                  const SizedBox(width: 20),
                                  const Text(
                                    "Звук",
                                    style: AppTextStyle.base,
                                  ),
                                ],
                              ),
                              FlutterSwitch(
                                width: 58,
                                height: 32,
                                activeColor: AppColors.startBackground,
                                inactiveColor: AppColors.inactiveBackground,
                                inactiveToggleColor: AppColors.inactive,
                                value: backgroundSoundActive,
                                onToggle: (value) {
                                  if (value) {
                                    _settingsBloc
                                        .add(const SettingsEvent.turnOnSound());
                                  } else {
                                    _settingsBloc.add(
                                        const SettingsEvent.turnOffSound());
                                  }
                                },
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
          },
        );
      },
    );
  }
}
