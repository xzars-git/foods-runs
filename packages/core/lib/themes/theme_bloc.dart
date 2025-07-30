import 'package:core/core.dart';
import 'package:flutter/material.dart';

import '../database/theme_database.dart';

// Theme Event
abstract class ThemeEvent extends Equatable {
  const ThemeEvent();

  @override
  List<Object> get props => [];
}

class ToggleThemeEvent extends ThemeEvent {}

class SwitchDrawerEvent extends ThemeEvent {}

class HideDrawerEvent extends ThemeEvent {}

// Theme State
class ThemeState extends Equatable {
  final ThemeMode themeMode;
  final bool isDrawerExpanded;

  const ThemeState({
    this.themeMode = ThemeMode.light,
    this.isDrawerExpanded = false,
  });

  ThemeState copyWith({
    ThemeMode? themeMode,
    bool? isDrawerExpanded,
  }) {
    return ThemeState(
      themeMode: themeMode ?? this.themeMode,
      isDrawerExpanded: isDrawerExpanded ?? this.isDrawerExpanded,
    );
  }

  @override
  List<Object> get props => [themeMode, isDrawerExpanded];
}

// Theme Bloc
class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(ThemeState(themeMode: ThemeDatabase.themeMode)) {
    // Register event handler
    on<ToggleThemeEvent>((event, Emitter<ThemeState> emit) async {
      ThemeDatabase.save(
        state.themeMode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light,
      );

      emit(
        state.copyWith(
          themeMode: state.themeMode == ThemeMode.light
              ? ThemeMode.dark
              : ThemeMode.light,
        ),
      );
    });

    on<SwitchDrawerEvent>((event, Emitter<ThemeState> emit) async {
      emit(
        state.copyWith(
          isDrawerExpanded: !state.isDrawerExpanded,
        ),
      );
    });

    on<HideDrawerEvent>((event, Emitter<ThemeState> emit) async {
      emit(
        state.copyWith(
          isDrawerExpanded: false,
        ),
      );
    });
  }
}
