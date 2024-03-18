### 주요 기능

- 깃헙 검색 API를 활용한 깃헙 모바일 애플리케이션 클론
- 깃헙 앱을 활용한 깃헙 oauth 인증 (깃헙 로그인)

### 개발환경

- 사용된 IDE: VS Code (version 1.87.1)
- 플러터/다트 버전:
```
 % flutter doctor 
	Doctor summary (to see all details, run flutter doctor -v):
	[✓] Flutter (Channel stable, 3.16.9, on macOS 13.6.2 22G320 darwin-arm64, locale en-KR)
		• Dart version 3.2.6
		• DevTools version 2.28.5
	[✓] Android toolchain - develop for Android devices (Android SDK version 33.0.0)
	[✓] Xcode - develop for iOS and macOS (Xcode 14.3.1)
	[✓] Android Studio (version 2021.2)
	[✓] VS Code (version 1.87.1)
```

### Dependencies
```yaml
dependencies:
  flutter:
    sdk: flutter

  dio: ^5.4.1
  equatable: ^2.0.5 
  flutter_bloc: ^8.1.4
  flutter_dotenv: ^5.1.0
  flutter_keyboard_visibility: ^6.0.0
  flutter_svg: ^2.0.10+1
  flutter_web_auth: ^0.5.0
  fluttertoast: ^8.2.4
  get_it: ^7.6.7
  go_router: ^13.2.0
  google_fonts: ^6.1.0
  json_annotation: ^4.8.1
  package_info_plus: ^5.0.1
  pretty_dio_logger: ^1.3.1
  retrofit: ^4.1.0
  shared_preferences: ^2.2.2
  webview_flutter: ^4.7.0

dev_dependencies:
  flutter_test:
    sdk: flutter

  build_runner: ^2.4.8
  flutter_lints: ^2.0.0
  json_serializable: ^6.7.1
  retrofit_generator: ^8.1.0
```

### 빌드 방법

1. 앱을 빌드하기전 깃헙 애플리케이션을 생성한후 깃헙 애플리케이션의 Client ID 및 Client Secret을 생성한후 프로젝트 디렉토리에 .env 파일을 생성한후 아래와 같이 등록해줘야합니다.

```
// ./.env 파일
CLIENT_ID=...
CLIENT_SECRET=...
```

깃헙 애플리케이션 생성 및 Clinet Secret 발급 방법: 
https://docs.github.com/ko/apps/creating-github-apps/registering-a-github-app/registering-a-github-app

2.  아래 명령들을 통해 애플리케이션을 빌드해줍니다. 

```
% flutter pub get
% dart pub run build_runner build --delete-conflicting-outputs
% flutter run
```

### 화면 구성

- 스플래시 화면
- 로그인화면
- 홈화면
	- 홈 탭
		- 검색 화면
		- 검색 결과 화면
	- 프로필 탭
		- 설정 화면

#### 스크린샷

<img src = "https://github.com/JakeSeo/githubsearch/assets/10471865/a5b716ad-037e-40b0-a450-4d1ffed7a688" width="25%"/>
<img src = "https://github.com/JakeSeo/githubsearch/assets/10471865/780f77b0-dd75-4b3f-817f-e639102bff9d" width="25%"/>
<img src = "https://github.com/JakeSeo/githubsearch/assets/10471865/1a0a8663-75bc-417f-bd4c-0068627c08fe" width="25%"/>
<img src = "https://github.com/JakeSeo/githubsearch/assets/10471865/e35cac9e-3355-4a58-a55e-e160c6562206" width="25%"/>
<img src = "https://github.com/JakeSeo/githubsearch/assets/10471865/2a1d692a-1045-470d-8af1-db2d3819048c" width="25%"/>
<img src = "https://github.com/JakeSeo/githubsearch/assets/10471865/57337498-ab10-4c87-bd20-723a45d3c5a9" width="25%"/>
<img src = "https://github.com/JakeSeo/githubsearch/assets/10471865/682693aa-2521-4816-ad11-efc4cfc80017" width="25%"/>
<img src = "https://github.com/JakeSeo/githubsearch/assets/10471865/4a27ef04-1d2c-4c40-b8d2-cec09842052f" width="25%"/>
<img src = "https://github.com/JakeSeo/githubsearch/assets/10471865/6c673d27-022a-48b6-902b-2d4d1e50949a" width="25%"/>
