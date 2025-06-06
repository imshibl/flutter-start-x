# 🚀 flutter-start-x

A simple and minimal Dart CLI tool to quickly generate Flutter apps, saving your time by skipping boilerplate setup.

## 🛠️ What It Does

`flutter-start-x` helps you skip the repetitive setup work when starting a new Flutter app.

## ✨ Features

- 🏷️ Set **project name** and **organization name**
- 📦 Choose commonly used **Flutter packages** (e.g., Dio, http, Hive, go_router, etc...)
- 📁 Select preferred **folder structure**:
  - `default` (lib with flat structure)
  - `feature-based` (organised by features)
- 🔥 Cleans up `main.dart` by removing default boilerplate comments


### Demo
<img src="https://raw.githubusercontent.com/imshibl/flutter-start-x/main/example/demo.gif" alt="MasterHead" width="1000" height="450"/>

## ⚡ Getting Started

1. Activate the package globally:

   ```bash
   dart pub global activate flutter_starter_x
   ````
2. Run the generator:


   ```bash
   flutter-start-x
   ```

3. Follow the interactive prompts:


   * Set project name
   * Set org name (e.g., `com.example`)
   * Select required packages
   * Choose folder structure
   * Remove boilerplate comments from main.dart

## 📁 Output Structure Example (Feature-Based)

```
lib/
├── features/
│   ├── auth/
│   │   ├── models/
│   │   ├── services/
│   │   └── views/
├── main.dart
```

## ✅ Why Use This?

* Saves setup time for every project
* Standardises codebase across teams
* Reduces boilerplate and manual cleanup
* Ensures consistent best practices from the start

## 🤝 Contribute
We welcome contributions!
If you have ideas for new features, templates, or improvements — feel free to open an issue or pull request.

Help us make **flutter-start-x** even better 🚀

## 📄 License

MIT License © 2025

