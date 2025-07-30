// ignore_for_file: camel_case_types
import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';

class SwitchThemeWidget extends StatefulWidget {
  const SwitchThemeWidget({
    super.key,
  });

  @override
  State<SwitchThemeWidget> createState() => _SwitchThemeWidgetState();
}

class _SwitchThemeWidgetState extends State<SwitchThemeWidget> {
  @override
  Widget build(BuildContext context) {
    return AnimatedToggleSwitch<bool>.dual(
      current: context.read<ThemeBloc>().state.themeMode == ThemeMode.light,
      first: true,
      second: false,
      height: 40,
      style: ToggleStyle(
        borderColor: isDarkMode(context) ? mediumEmphasis : blueGray50,
        indicatorColor: blue700,
      ),
      styleBuilder: (value) => ToggleStyle(
        backgroundColor: Theme.of(context).colorScheme.surface,
      ),
      borderWidth: 1,
      onChanged: (b) {
        context.read<ThemeBloc>().add(ToggleThemeEvent());
      },
      spacing: 0,
      iconBuilder: (value) => value
          ? SvgPicture.asset(
              "assets/icons/toogle/sun.svg",
              colorFilter: colorFilterWhite,
            )
          : SvgPicture.asset(
              "assets/icons/toogle/moon.svg",
              colorFilter: colorFilterWhite,
            ),
      textBuilder: (value) => value
          ? Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SvgPicture.asset(
                  "assets/icons/toogle/moon.svg",
                  colorFilter: colorFilterBlueGray100,
                ),
              ),
            )
          : Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SvgPicture.asset(
                  "assets/icons/toogle/sun.svg",
                  colorFilter: colorFilterBlueGray100,
                ),
              ),
            ),
    );
  }
}
