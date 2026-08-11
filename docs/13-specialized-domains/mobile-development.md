---
layout: default
title: Mobile Development
parent: Specialized Domains
---

# Mobile Development

## Introduction

Mobile developers build apps for iOS, Android, or cross-platform. Roles: Android Developer, iOS Developer, Flutter/React Native Developer, Mobile Architect.

## What the Role Does

- Build native apps (Kotlin for Android, Swift for iOS).
- Build cross-platform apps (Flutter, React Native).
- Integrate APIs, push notifications, offline storage, deep links.
- Handle app stores: signing, releases, versioning.
- Optimize performance, battery, and memory.

## Hiring Companies

Every consumer app company and product firms. Strong mobile teams: Google, Meta, Apple, Spotify, Uber, and India: PhonePe, Paytm, CRED, Swiggy, Zomato, Meesho, ShareChat, Myntra.

## Core Topics

| Topic | What to Know |
|-------|--------------|
| Android | Kotlin, Activities, Jetpack Compose, ViewModel, Room, WorkManager |
| iOS | Swift, SwiftUI/UIKit, Combine, Core Data, App Lifecycle |
| Cross-platform | Flutter (Dart) or React Native fundamentals |
| Networking | REST/GraphQL, caching, offline support, error handling |
| Architecture | MVVM/MVI/MVC, clean architecture, DI ([35-OOP](../../35-OOP/)) |
| Concurrency | Coroutines, async/await, background tasks |
| Storage | SQLite/Room/Core Data, SharedPreferences, secure storage |
| App Stores | Signing, Play/App Store review, crash reporting |
| Testing | Unit, widget, UI tests, test doubles |
| Mobile Security | Certificate pinning, biometrics, secure storage |

## Interview Roadmap (12 Weeks)

```
Weeks 1-2:   Pick a platform; learn core language (Kotlin/Swift/Dart)
Weeks 3-4:   App fundamentals: lifecycle, UI, navigation
Weeks 5-6:   Networking, storage, state management, architecture
Weeks 7-8:   Build a full app with offline + notifications
Weeks 9-10:  Performance, testing, app-store release
Weeks 11-12: Mock interviews + portfolio with live/installed apps
```

## Sample Interview Questions

- Explain the Android/iOS app lifecycle.
- How do you handle offline-first data sync?
- Compare MVVM vs Clean Architecture. Which would you use for a large app?
- How do you manage memory in a mobile app (leaks, large images)?
- What's your approach to writing a large list smoothly (recycling, pagination)?
- How would you implement push notifications with deep links?
- How do you test a mobile UI and run tests in CI?

## Projects for Portfolio

- A native app with offline support, push notifications, and store-ready polish.
- A Flutter/React Native cross-platform app with shared codebase.
- An app with a clear architecture (MVVM) + unit/UI tests.
- Published to Play Store or App Store (the ultimate proof).

## Tools to Learn

- Android: Kotlin, Jetpack Compose, Android Studio
- iOS: Swift, SwiftUI, Xcode
- Cross: Flutter, React Native
- Backend: Firebase, Supabase, or custom APIs
- Quality: Firebase Crashlytics, LeakCanary, CI (Fastlane)

## Key Links

- Mobile folder: [80-Mobile-Development](../../80-Mobile-Development/)
- OOP: [35-OOP](../../35-OOP/)
- API Design: [43-API-Design](../../43-API-Design/)
- Career Pages: [Company Career Pages](../01-getting-started/career-pages)

## Common Mistakes

1. Building features without understanding app lifecycle and memory.
2. No architecture — interviewers will ask "how would you structure this".
3. No offline/error handling story.
4. Never shipping a build to a store or even a device.
5. Ignoring platform store procedures (signing, release).