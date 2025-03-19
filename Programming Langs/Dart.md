# Dart Programming in Termux

## Overview
- **Language**: Dart
- **Runtime**: Dart VM
- **File Extension**: .dart
- **Package Manager**: pub

## Installation
```sh
pkg update && pkg upgrade
pkg install dart

# Install Flutter (optional)

## Prerequisites
- Make sure you have sufficient storage (>5GB)
- Good internet connection
- Android SDK tools (optional, for mobile development)

## Installation Steps

### 1. System Requirements
```bash
# Install required dependencies
pkg install git wget unzip
pkg install openjdk-17
```

### 2. Download Flutter SDK
```bash
# Create development directory
mkdir -p ~/development
cd ~/development

# Download Flutter SDK
wget https://storage.googleapis.com/flutter_infra_release/releases/stable/linux/flutter_linux_3.x.x-stable.tar.xz

# Extract the archive
tar xf flutter_linux_*.tar.xz
```

### 3. Set Up Environment
```bash
# Add Flutter to PATH
echo 'export PATH="$PATH:$HOME/development/flutter/bin"' >> ~/.bashrc
source ~/.bashrc
```

### 4. Verify Installation
```bash
# Check Flutter installation
flutter doctor

# Accept Android licenses (if developing for Android)
flutter doctor --android-licenses
```

### 5. IDE Setup (Optional)
```bash
# Install VS Code
pkg install code

# Install Flutter extension in VS Code
code --install-extension Dart-Code.flutter
```

## Troubleshooting

### Common Issues
- If `flutter doctor` shows missing dependencies, install them using `pkg install`
- For Android Studio issues, ensure proper SDK installation
- Memory constraints may require closing unnecessary applications

### Performance Tips
- Use a swap file for better performance
- Keep SDK updated regularly
- Clean build directories periodically

## Next Steps
- Create your first Flutter project
- Set up an emulator or connect a physical device
- Start exploring Flutter widgets and documentation

## Useful Commands
```bash
# Create new Flutter project
flutter create my_app

# Run Flutter app
cd my_app
flutter run

# Update Flutter SDK
flutter upgrade

# Clean project
flutter clean
```

```
pkg install flutter
```

## Project Structure
```
project/
├── lib/
│   └── main.dart
├── test/
└── pubspec.yaml
```

## Example Program
```dart
void main() {
  print('Hello, World!');
}
```
