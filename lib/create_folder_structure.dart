import 'dart:io';

void createFolderStructure(String path, String type) {
  final libDir = Directory('$path/lib');

  // Always create common folders
  final commonDirs = ['utils', 'config', 'widgets', 'constants'];
  for (final dir in commonDirs) {
    Directory('${libDir.path}/$dir').createSync(recursive: true);
  }

  switch (type) {
    case 'flat':
      Directory('${libDir.path}/pages').createSync(recursive: true);
      print('📁 Created flat structure: lib/pages + common folders');
      break;

    case 'feature-based':
      final features = ['auth', 'home'];
      for (final feature in features) {
        final basePath = '${libDir.path}/features/$feature';
        Directory('$basePath/models').createSync(recursive: true);
        Directory('$basePath/services').createSync(recursive: true);
        Directory('$basePath/views').createSync(recursive: true);
      }
      print(
        '📁 Created feature-based structure with models, services, views + common folders',
      );
      break;

    case 'clean':
      Directory('${libDir.path}/data').createSync(recursive: true);
      Directory('${libDir.path}/domain').createSync(recursive: true);
      Directory('${libDir.path}/presentation').createSync(recursive: true);
      print('📁 Created clean architecture structure + common folders');
      break;
  }
}
