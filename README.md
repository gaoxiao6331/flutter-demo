# Flutter Cross-Platform Demo

一个简单的 Flutter Demo，使用同一套代码支持 Android、iOS、Web 渲染。

## 环境要求

- Flutter 3.41+
- Dart 3.11+
- Android Studio / Xcode（按需）

## 本地运行

在项目根目录执行：

```bash
flutter pub get
```

### Android

```bash
flutter run -d android
```

### iOS（仅 macOS）

```bash
flutter run -d ios
```

### Web（Chrome）

```bash
flutter run -d chrome
```

## 构建产物

### Android APK

```bash
flutter build apk
```

### iOS（需 Xcode 签名）

```bash
flutter build ios
```

### Web

```bash
flutter build web
```

产物目录：

- Android: `build/app/outputs/flutter-apk/`
- iOS: `build/ios/iphoneos/`
- Web: `build/web/`

