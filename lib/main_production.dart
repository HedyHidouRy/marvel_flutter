// Copyright (c) 2022, Very Good Ventures
// https://verygood.ventures
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:marvel/bootstrap.dart';
import 'package:marvel/core/constants/database_constants.dart';
import 'package:marvel/core/injection/di.dart';
import 'package:marvel/data/data_sources/local/dtos/dtos.dart';
import 'package:marvel/presentation/app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Init Hive
  await Hive.initFlutter();
  Hive.registerAdapter(CharacterDtoAdapter());
  await Hive.openBox(charactersHiveBoxName);

  await configureInjection();
  // ignore: unawaited_futures
  bootstrap(() => const App());
}
