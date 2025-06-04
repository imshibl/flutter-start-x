import 'dart:io';

void createFolderStructure(String path, String type) {
  final libDir = Directory('$path/lib');

  // Always create common folders
  final commonDirs = ['utils', 'config', 'widgets', 'constants'];
  for (final dir in commonDirs) {
    Directory('${libDir.path}/$dir').createSync(recursive: true);
  }

  switch (type) {
    case 'default':
      Directory('${libDir.path}/views').createSync(recursive: true);
      print('📁 Created default structure: lib/views + common folders');
      break;

    case 'feature-based':
      final features = ['auth', 'home'];
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
          authModelFile.writeAsStringSync('''
class AuthModel {
  final String email;
  final String token;

  AuthModel({required this.email, required this.token});

  factory AuthModel.fromJson(Map<String, dynamic> json) {
    return AuthModel(
      email: json['email'] ?? '',
      token: json['token'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'token': token,
    };
  }
}
''');
        }
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
