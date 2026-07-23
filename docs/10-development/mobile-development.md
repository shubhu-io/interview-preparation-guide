---
layout: default
title: Mobile Development
parent: Development
---

# Mobile Development

## Introduction

Mobile development is the process of creating software applications that run on smartphones and tablets. With over 6.8 billion smartphone users worldwide, it is one of the most in-demand skills in tech. This guide covers Android development (Kotlin/Java), iOS development (Swift), and cross-platform frameworks (Flutter, React Native), along with architecture patterns, networking, and storage.

Mobile engineers must understand platform-specific APIs, UI/UX conventions, performance constraints (battery, memory, network), and the challenges of varying screen sizes, hardware capabilities, and OS versions.

---

## Key Concepts

### Platform Choices

| Platform | Language | IDE | Primary Framework |
|----------|----------|-----|-------------------|
| Android | Kotlin (preferred), Java | Android Studio | Jetpack Compose |
| iOS | Swift, Objective-C | Xcode | SwiftUI |
| Cross-Platform | Dart | VS Code / Android Studio | Flutter |
| Cross-Platform | JavaScript/TypeScript | VS Code | React Native |

### Architecture Patterns

**MVVM (Model-View-ViewModel)**
```
View (Activity/Fragment) <--> ViewModel <--> Repository <--> Data Sources
```
- View observes ViewModel, renders UI
- ViewModel holds UI state, survives configuration changes
- Repository is the single source of truth

**MVI (Model-View-Intent)**
- Unidirectional data flow
- Single source of truth for UI state
- Predictable state transitions

**Clean Architecture**
```
Presentation Layer --> Domain Layer --> Data Layer
     (UI)           (Use Cases)      (Repositories, APIs, DB)
```

### Lifecycle

**Android Activity Lifecycle:**
```
onCreate() -> onStart() -> onResume() -> [Running] -> onPause() -> onStop() -> onDestroy()
```

**iOS ViewController Lifecycle:**
```
loadView() -> viewDidLoad() -> viewWillAppear() -> viewDidAppear() -> viewWillDisappear() -> viewDidDisappear() -> deinit
```

### Networking & Storage

- **REST**: Retrofit (Android), URLSession (iOS)
- **GraphQL**: Apollo Client
- **Key-Value**: SharedPreferences / UserDefaults
- **Database**: Room (Android), Core Data (iOS), Realm (cross-platform)
- **Modern Storage**: DataStore (Android replacement for SharedPreferences)

### Push Notifications

- **Android**: Firebase Cloud Messaging (FCM) with notification channels
- **iOS**: Apple Push Notification service (APNs) with rich notifications

### Performance Considerations

- **App size**: ProGuard/R8 (Android), app thinning (iOS)
- **Startup time**: Lazy loading, deferred initialization
- **Memory**: LeakCanary (Android), Instruments (iOS)
- **Battery**: WorkManager/BackgroundTasks, minimize background work
- **Rendering**: Target 60fps, avoid overdraw

---

## FAQ

### Q1: What is the difference between a ViewGroup and a View in Android?
**A:** A `View` is a basic UI element (button, text field). A `ViewGroup` is a special View that contains other Views and ViewGroups (LinearLayout, RelativeLayout). ViewGroups define layout structure.

### Q2: What is the difference between `launchMode` singleTop and singleTask?
**A:** `singleTop` reuses an existing instance at the top of the back stack. `singleTask` creates or reuses a task and clears activities above the reused instance. Use singleTop for search; singleTask for app entry points.

### Q3: What is State Hoisting in Jetpack Compose?
**A:** State hoisting moves state from a composable to its caller. The composable receives state as a parameter and emits events upward. This makes composables stateless, reusable, and testable.

### Q4: What is the difference between `viewModelScope` and `lifecycleScope`?
**A:** `viewModelScope` is tied to the ViewModel's lifecycle. `lifecycleScope` is tied to the Activity/Fragment lifecycle. Use viewModelScope for data fetching; lifecycleScope for UI-specific coroutines.

### Q5: How does React Native's bridge architecture work?
**A:** The bridge is an asynchronous message queue between JavaScript and native code. JS runs on a background thread; native UI on the main thread. The new Fabric architecture uses JSI for synchronous communication.

### Q6: What is the difference between Flutter's hot reload and hot restart?
**A:** Hot reload injects updated code without losing state — for UI changes. Hot restart destroys state and re-runs `main()` — for logic changes.

### Q7: What is certificate pinning?
**A:** Certificate pinning associates a host with its expected certificate, preventing MITM attacks even if a CA is compromised. Use Network Security Config (Android) or URLSession delegate (iOS).

### Q8: What is WorkManager in Android?
**A:** WorkManager handles deferrable, guaranteed background work with backward compatibility and battery optimization. Uses JobScheduler on API 23+ and AlarmManager on older versions.

### Q9: What are SwiftUI property wrappers?
**A:** `@State` (local mutable state), `@Binding` (two-way reference), `@ObservedObject` (ObservableObject observation), `@StateObject` (owned ObservableObject), `@EnvironmentObject` (injected ObservableObject).

### Q10: What is the difference between `remember` and `rememberSaveable` in Compose?
**A:** `remember` stores state across recompositions but not configuration changes. `rememberSaveable` persists through configuration changes by saving to a Bundle.

---

## Common Mistakes

### Android
1. Using `findViewById()` instead of View Binding/Data Binding
2. Holding Activity context references in long-lived objects (memory leaks)
3. Blocking the main thread with network calls or heavy computation
4. Not handling configuration changes — losing state on rotation
5. Ignoring battery optimization for background work
6. Not using ProGuard/R8 (larger APK, easier reverse engineering)

### iOS
1. Force unwrapping optionals — crashes on nil
2. Retain cycles with closures — not using `[weak self]`
3. Not using Auto Layout — UI breaks on different screen sizes
4. Main thread blocking — unresponsive UI
5. Ignoring memory management with Instruments

### Flutter
1. Not using `const` constructors — missed performance
2. Excessive rebuilds — not using keys or proper state management
3. Ignoring platform differences — iOS and Android have different UX expectations
4. Over-reliance on `setState` for complex state

### Cross-Platform
1. Treating cross-platform as native — each platform has unique UX patterns
2. Not testing on real devices — emulators miss hardware issues
3. Not planning for offline — mobile networks are unreliable

---

## Best Practices

- Use MVVM or MVI for clean separation of concerns
- Implement Repository pattern for data abstraction
- Use dependency injection (Hilt/Dagger for Android, Swinject for iOS)
- Keep Views thin — move logic to ViewModel/Presenter
- Profile regularly with platform tools (Android Profiler, Instruments)
- Lazy load content and images; use appropriate formats (WebP, HEIC)
- Implement pagination for lists
- Never store sensitive data in plaintext — use Keychain/EncryptedSharedPreferences
- Implement certificate pinning for API calls
- Write unit tests for ViewModels, repositories, and business logic
- Test on multiple device sizes and OS versions

---

## Quick Reference

### Android
```
Activity Lifecycle:  onCreate → onStart → onResume → onPause → onStop → onDestroy
ViewModel:           Survives config changes, cleared on Activity/Fragment finish
Room:                SQLite abstraction with compile-time verification
Hilt:                Dependency injection built on Dagger
Paging 3:            Pagination library for loading data in chunks
```

### iOS
```
ViewController:      loadView → viewDidLoad → viewWillAppear → viewDidAppear
SwiftUI Lifecycle:   @main App → Scene → WindowGroup → View
Combine:             Publisher → Operator → Subscriber
Core Data:           NSManagedObject → NSManagedObjectContext
SwiftUI State:       @State, @Binding, @ObservedObject, @StateObject
```

### Flutter
```
State Management:    setState, Provider, Riverpod, BLoC, GetX
Navigation:          Navigator 1.0 (push/pop) or go_router
Platform Channels:   MethodChannel, EventChannel
Lifecycle:           WidgetsBindingObserver
Testing:             widget_test, integration_test, mockito
```
