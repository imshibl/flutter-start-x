import 'dart:io';

import 'package:flutter_starter_x/consts/models/auth_model.dart';
import 'package:flutter_starter_x/consts/services/auth_services.dart';

void createFolderStructure(String path, String type) {
  final libDir = Directory('$path/lib');

  // Always create common folders
  final commonDirs = ['utils', 'config', 'common'];
  for (final dir in commonDirs) {
    Directory('${libDir.path}/$dir').createSync(recursive: true);

    if (dir == 'common') {
      Directory('${libDir.path}/$dir/widgets').createSync(recursive: true);
      Directory('${libDir.path}/$dir/models').createSync(recursive: true);
      Directory('${libDir.path}/$dir/services').createSync(recursive: true);
    }
  }

  switch (type) {
    case 'default':
      Directory('${libDir.path}/models').createSync(recursive: true);
      Directory('${libDir.path}/services').createSync(recursive: true);
      Directory('${libDir.path}/views').createSync(recursive: true);
      print('📁 Created default structure: lib/views + common folders');
      break;

    case 'feature-based':
      final features = ['auth'];
      for (final feature in features) {
        final basePath = '${libDir.path}/features/$feature';
        final modelsDir = Directory('$basePath/models');
        final servicesDir = Directory('$basePath/services');
        final viewsDir = Directory('$basePath/views');

        modelsDir.createSync(recursive: true);
        servicesDir.createSync(recursive: true);
        viewsDir.createSync(recursive: true);

        // ✅ Create default auth_model.dart only in 'auth' feature
        if (feature == 'auth') {
          final authModelFile = File('${modelsDir.path}/auth_model.dart');
          authModelFile.writeAsStringSync(authModel);
        }

        // ✅ Create default auth_services.dart only in 'auth' feature
        if (feature == 'auth') {
          final authServicesFile = File(
            '${servicesDir.path}/auth_services.dart',
          );
          authServicesFile.writeAsStringSync(authServices);
        }
      }
      print(
        '📁 Created feature-based structure with models, services, views + common folders',
      );
      break;

    // case 'clean':
    //   Directory('${libDir.path}/data').createSync(recursive: true);
    //   Directory('${libDir.path}/domain').createSync(recursive: true);
    //   Directory('${libDir.path}/presentation').createSync(recursive: true);
    //   print('📁 Created clean architecture structure + common folders');
    //   break;
  }
}

Future<void> removeMainDartComments(String projectPath) async {
  final mainFile = File('$projectPath/lib/main.dart');
  if (await mainFile.exists()) {
    String content = await mainFile.readAsString();

    // Remove both single-line (//) and multi-line (/* */) comments
    final cleaned = content.replaceAll(RegExp(r'//.*'), '');
    // .replaceAll(RegExp(r'/\*[\s\S]*?\*/'), '');

    await mainFile.writeAsString(cleaned);
  }
}
