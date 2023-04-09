# translator

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

## Permissions
- The application needs network access
- add the following code to `translator\android\app\src\main\AndroidManifest.xml` 
```xml
<uses-permission android:name="android.permission.INTERNET" />
```

### Config : api-related json configuration file
```json
{
  "youdaoApiUrl": "https://openapi.youdao.com/api",
  "youdaoAppKey": "有道翻译 应用ID",
  "youdaoSecretKey":"有道翻译 应用秘钥"
}
```

### Lanzou Cloud Download
Url : https://wwho.lanzoum.com/b03k4nxla
Password : 73wy