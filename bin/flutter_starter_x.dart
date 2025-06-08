import 'dart:io';

import 'package:flutter_starter_x/flutter_starter_x.dart';
import 'package:promptr/promptr.dart' as prompts;

void main(List<String> arguments) async {
  print('🛠️ Flutter Starter X CLI Tool');

  // Step 1: Ask for project name
  final projectName = prompts.get('🚀 Enter your project name:');
  if (projectName.trim().isEmpty) {
    stderr.writeln('❌ Project name cannot be empty.');
    exit(1);
  }

  // Step 2: Ask for org
  final org = prompts.get(
    '🏢 Enter your organization (default: com.example):',
    defaultsTo: 'com.example',
  );
  // if (org.trim().isEmpty) {
  //   // stderr.writeln('❌ Organization name cannot be empty.');
  //   // exit(1);
  // }

  // Step 3: flutter create
  print('\n📦 Creating Flutter project...');
  final createResult = await Process.run('flutter', [
    'create',
    '--org',
    org,
    projectName,
  ]);

  stdout.write(createResult.stdout);
  stderr.write(createResult.stderr);

  if (createResult.exitCode != 0) {
    stderr.writeln('❌ Failed to create project.');
    exit(1);
  }

  final projectPath =
      Directory.current.path + Platform.pathSeparator + projectName;

  // Step 4: Choose packages
  final availablePackages = <String>[
    'go_router',
    'auto_route',
    'dio',
    'http',
    'shared_preferences',
    'flutter_secure_storage',
    'hive',
    'sqflite',
    'flutter_svg',
    'cached_network_image',
    'image_picker',
    'permission_handler',
    'url_launcher',
    'intl',
  ];

  final selectedPackages = prompts.multiChoose(
    "📦 Select packages to install:",
    availablePackages,
  );

  if (selectedPackages.isNotEmpty) {
    stderr.writeln("Selected packages: $selectedPackages");
  }

  // print('\n📦 Select packages to install:');
  // for (final pkg in availablePackages) {
  //   final include = prompts.getBool('➕ Add $pkg?', defaultsTo: false);
  //   if (include) selectedPackages.add(pkg);
  // }

  // Step 5: Choose folder structure
  final folderStructures = ['default', 'feature-based'];
  final selectedStructure = prompts.choose(
    '🧱 Choose folder structure:',
    folderStructures,
  );

  // Step 6: Add selected packages
  if (selectedPackages.isNotEmpty) {
    print('\n📥 Installing selected packages...');
    for (final pkg in selectedPackages) {
      final addPkgResult = await Process.run('flutter', [
        'pub',
        'add',
        pkg,
      ], workingDirectory: projectPath);
      stdout.write(addPkgResult.stdout);
      stderr.write(addPkgResult.stderr);
    }
  }

  // Step 7: Create folders
  createFolderStructure(projectPath, selectedStructure!);

  //Step 8: remove comments in main.dart
  final removeComments = prompts.getBool(
    '🧹 Remove boilerplate comments from main.dart',
    defaultsTo: true,
  );
  if (removeComments) {
    await removeMainDartComments(projectPath);
  }

  print('\n✅ Project "$projectName" setup complete!');
}
