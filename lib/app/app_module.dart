import 'package:my_music_app/app/repositories/album_repository.dart';
import 'package:my_music_app/app/shared/widgets/generic_button/generic_button_controller.dart';
import 'package:dio/dio.dart';
import 'package:my_music_app/app/app_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
import 'package:my_music_app/app/app_widget.dart';
import 'package:my_music_app/app/modules/home/home_module.dart';
import 'package:my_music_app/app/modules/landing/landing_module.dart';
import 'package:my_music_app/utils/app_constants.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        Bind((i) => GenericButtonController()),
        Bind((i) => AppController()),
        Bind((i) => AlbumRepository(i.get<Dio>())),
        Bind((i) => Dio(BaseOptions(baseUrl: AppConstants.adonis_url)))
      ];

  @override
  List<Router> get routers => [
        Router('/', module: LandingModule()),
      ];

  @override
  Widget get bootstrap => AppWidget();

  static Inject get to => Inject<AppModule>.of();
}
