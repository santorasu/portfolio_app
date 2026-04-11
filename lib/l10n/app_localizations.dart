import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_bn.dart';
import 'app_localizations_en.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('bn'),
    Locale('en')
  ];

  /// No description provided for @appName.
  ///
  /// In en, this message translates to:
  /// **'My App'**
  String get appName;

  /// No description provided for @appVersion.
  ///
  /// In en, this message translates to:
  /// **'Version 1.0.0'**
  String get appVersion;

  /// No description provided for @noRoute.
  ///
  /// In en, this message translates to:
  /// **'No Route Found'**
  String get noRoute;

  /// No description provided for @loading.
  ///
  /// In en, this message translates to:
  /// **'Loading...'**
  String get loading;

  /// No description provided for @error.
  ///
  /// In en, this message translates to:
  /// **'Something went wrong'**
  String get error;

  /// No description provided for @retry.
  ///
  /// In en, this message translates to:
  /// **'Retry'**
  String get retry;

  /// No description provided for @cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// No description provided for @ok.
  ///
  /// In en, this message translates to:
  /// **'OK'**
  String get ok;

  /// No description provided for @save.
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get save;

  /// No description provided for @delete.
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get delete;

  /// No description provided for @confirm.
  ///
  /// In en, this message translates to:
  /// **'Confirm'**
  String get confirm;

  /// No description provided for @home.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get home;

  /// No description provided for @services.
  ///
  /// In en, this message translates to:
  /// **'Services'**
  String get services;

  /// No description provided for @resume.
  ///
  /// In en, this message translates to:
  /// **'Resume'**
  String get resume;

  /// No description provided for @portfolio.
  ///
  /// In en, this message translates to:
  /// **'Portfolio'**
  String get portfolio;

  /// No description provided for @contact.
  ///
  /// In en, this message translates to:
  /// **'Contact'**
  String get contact;

  /// No description provided for @search.
  ///
  /// In en, this message translates to:
  /// **'Search'**
  String get search;

  /// No description provided for @favorites.
  ///
  /// In en, this message translates to:
  /// **'Favorites'**
  String get favorites;

  /// No description provided for @profile.
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get profile;

  /// No description provided for @welcomeMessage.
  ///
  /// In en, this message translates to:
  /// **'Welcome Back!'**
  String get welcomeMessage;

  /// No description provided for @welcomeSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Here\'s what\'s happening today'**
  String get welcomeSubtitle;

  /// No description provided for @quickActions.
  ///
  /// In en, this message translates to:
  /// **'Quick Actions'**
  String get quickActions;

  /// No description provided for @explore.
  ///
  /// In en, this message translates to:
  /// **'Explore'**
  String get explore;

  /// No description provided for @notifications.
  ///
  /// In en, this message translates to:
  /// **'Notifications'**
  String get notifications;

  /// No description provided for @analytics.
  ///
  /// In en, this message translates to:
  /// **'Analytics'**
  String get analytics;

  /// No description provided for @settings.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settings;

  /// No description provided for @recentActivity.
  ///
  /// In en, this message translates to:
  /// **'Recent Activity'**
  String get recentActivity;

  /// No description provided for @activityItem.
  ///
  /// In en, this message translates to:
  /// **'Activity Item'**
  String get activityItem;

  /// No description provided for @activityDescription.
  ///
  /// In en, this message translates to:
  /// **'Tap to view details'**
  String get activityDescription;

  /// No description provided for @searchHint.
  ///
  /// In en, this message translates to:
  /// **'Search for anything...'**
  String get searchHint;

  /// No description provided for @searchEmptyTitle.
  ///
  /// In en, this message translates to:
  /// **'Start Searching'**
  String get searchEmptyTitle;

  /// No description provided for @searchEmptySubtitle.
  ///
  /// In en, this message translates to:
  /// **'Enter a keyword to find what you\'re looking for'**
  String get searchEmptySubtitle;

  /// No description provided for @searchResult.
  ///
  /// In en, this message translates to:
  /// **'Result'**
  String get searchResult;

  /// No description provided for @searchResultSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Tap to view details'**
  String get searchResultSubtitle;

  /// No description provided for @noResults.
  ///
  /// In en, this message translates to:
  /// **'No results found'**
  String get noResults;

  /// No description provided for @noFavorites.
  ///
  /// In en, this message translates to:
  /// **'No Favorites Yet'**
  String get noFavorites;

  /// No description provided for @noFavoritesSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Items you favorite will appear here'**
  String get noFavoritesSubtitle;

  /// No description provided for @startExploring.
  ///
  /// In en, this message translates to:
  /// **'Start Exploring'**
  String get startExploring;

  /// No description provided for @userName.
  ///
  /// In en, this message translates to:
  /// **'John Doe'**
  String get userName;

  /// No description provided for @userEmail.
  ///
  /// In en, this message translates to:
  /// **'john.doe@example.com'**
  String get userEmail;

  /// No description provided for @editProfile.
  ///
  /// In en, this message translates to:
  /// **'Edit Profile'**
  String get editProfile;

  /// No description provided for @security.
  ///
  /// In en, this message translates to:
  /// **'Security'**
  String get security;

  /// No description provided for @helpSupport.
  ///
  /// In en, this message translates to:
  /// **'Help & Support'**
  String get helpSupport;

  /// No description provided for @about.
  ///
  /// In en, this message translates to:
  /// **'About'**
  String get about;

  /// No description provided for @logout.
  ///
  /// In en, this message translates to:
  /// **'Logout'**
  String get logout;

  /// No description provided for @logoutConfirmation.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to logout?'**
  String get logoutConfirmation;

  /// No description provided for @splashTitle.
  ///
  /// In en, this message translates to:
  /// **'Welcome'**
  String get splashTitle;

  /// No description provided for @splashSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Your journey starts here'**
  String get splashSubtitle;

  /// No description provided for @login.
  ///
  /// In en, this message translates to:
  /// **'Login'**
  String get login;

  /// No description provided for @signUp.
  ///
  /// In en, this message translates to:
  /// **'Sign Up'**
  String get signUp;

  /// No description provided for @email.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get email;

  /// No description provided for @password.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get password;

  /// No description provided for @confirmPassword.
  ///
  /// In en, this message translates to:
  /// **'Confirm Password'**
  String get confirmPassword;

  /// No description provided for @forgotPassword.
  ///
  /// In en, this message translates to:
  /// **'Forgot Password?'**
  String get forgotPassword;

  /// No description provided for @dontHaveAccount.
  ///
  /// In en, this message translates to:
  /// **'Don\'t have an account? '**
  String get dontHaveAccount;

  /// No description provided for @alreadyHaveAccount.
  ///
  /// In en, this message translates to:
  /// **'Already have an account? '**
  String get alreadyHaveAccount;

  /// No description provided for @loginSuccess.
  ///
  /// In en, this message translates to:
  /// **'Login successful!'**
  String get loginSuccess;

  /// No description provided for @signUpSuccess.
  ///
  /// In en, this message translates to:
  /// **'Account created successfully!'**
  String get signUpSuccess;

  /// No description provided for @emailRequired.
  ///
  /// In en, this message translates to:
  /// **'Email is required'**
  String get emailRequired;

  /// No description provided for @passwordRequired.
  ///
  /// In en, this message translates to:
  /// **'Password is required'**
  String get passwordRequired;

  /// No description provided for @invalidEmail.
  ///
  /// In en, this message translates to:
  /// **'Please enter a valid email'**
  String get invalidEmail;

  /// No description provided for @passwordTooShort.
  ///
  /// In en, this message translates to:
  /// **'Password must be at least 6 characters'**
  String get passwordTooShort;

  /// No description provided for @passwordsDoNotMatch.
  ///
  /// In en, this message translates to:
  /// **'Passwords do not match'**
  String get passwordsDoNotMatch;

  /// No description provided for @onBoardingTitle1.
  ///
  /// In en, this message translates to:
  /// **'Welcome to Our App'**
  String get onBoardingTitle1;

  /// No description provided for @onBoardingTitle2.
  ///
  /// In en, this message translates to:
  /// **'Discover Features'**
  String get onBoardingTitle2;

  /// No description provided for @onBoardingTitle3.
  ///
  /// In en, this message translates to:
  /// **'Get Started Now'**
  String get onBoardingTitle3;

  /// No description provided for @onBoardingSubtitle1.
  ///
  /// In en, this message translates to:
  /// **'Experience the best features designed for you'**
  String get onBoardingSubtitle1;

  /// No description provided for @onBoardingSubtitle2.
  ///
  /// In en, this message translates to:
  /// **'Explore all the amazing capabilities'**
  String get onBoardingSubtitle2;

  /// No description provided for @onBoardingSubtitle3.
  ///
  /// In en, this message translates to:
  /// **'Create your account and start your journey'**
  String get onBoardingSubtitle3;

  /// No description provided for @next.
  ///
  /// In en, this message translates to:
  /// **'Next'**
  String get next;

  /// No description provided for @skip.
  ///
  /// In en, this message translates to:
  /// **'Skip'**
  String get skip;

  /// No description provided for @getStarted.
  ///
  /// In en, this message translates to:
  /// **'Get Started'**
  String get getStarted;

  /// No description provided for @favoriteItem.
  ///
  /// In en, this message translates to:
  /// **'Favorite Item'**
  String get favoriteItem;

  /// No description provided for @addedRecently.
  ///
  /// In en, this message translates to:
  /// **'Added recently'**
  String get addedRecently;

  /// No description provided for @addedDaysAgo.
  ///
  /// In en, this message translates to:
  /// **'Added 2 days ago'**
  String get addedDaysAgo;

  /// No description provided for @addedLastWeek.
  ///
  /// In en, this message translates to:
  /// **'Added last week'**
  String get addedLastWeek;

  /// No description provided for @homeTitle.
  ///
  /// In en, this message translates to:
  /// **'Hi, I\'m Md. Rashedul Islam 👋'**
  String get homeTitle;

  /// No description provided for @homeImA.
  ///
  /// In en, this message translates to:
  /// **'I\'m a '**
  String get homeImA;

  /// No description provided for @homeRole1.
  ///
  /// In en, this message translates to:
  /// **'Flutter Developer'**
  String get homeRole1;

  /// No description provided for @homeRole2.
  ///
  /// In en, this message translates to:
  /// **'Cross-Platform App Builder'**
  String get homeRole2;

  /// No description provided for @homeRole3.
  ///
  /// In en, this message translates to:
  /// **'Clean Architecture Enthusiast'**
  String get homeRole3;

  /// No description provided for @homeRole4.
  ///
  /// In en, this message translates to:
  /// **'Mobile App Enthusiast'**
  String get homeRole4;

  /// No description provided for @homeDesc.
  ///
  /// In en, this message translates to:
  /// **'Flutter Developer with experience building production-ready mobile applications for Android, iOS, and Web. Skilled in Flutter, Dart, Riverpod, GetX, Provider, Clean Architecture, Firebase, and REST API integration. Focused on building real-world client solutions and improving product usability.'**
  String get homeDesc;

  /// No description provided for @downloadCv.
  ///
  /// In en, this message translates to:
  /// **'Download CV'**
  String get downloadCv;

  /// No description provided for @statAppsBuilt.
  ///
  /// In en, this message translates to:
  /// **'Apps Built'**
  String get statAppsBuilt;

  /// No description provided for @statYearsPro.
  ///
  /// In en, this message translates to:
  /// **'Years Pro'**
  String get statYearsPro;

  /// No description provided for @statScreens.
  ///
  /// In en, this message translates to:
  /// **'Screens'**
  String get statScreens;

  /// No description provided for @statRank.
  ///
  /// In en, this message translates to:
  /// **'Rank Ostad'**
  String get statRank;

  /// No description provided for @servicesHeader1.
  ///
  /// In en, this message translates to:
  /// **'Skills & '**
  String get servicesHeader1;

  /// No description provided for @servicesHeader2.
  ///
  /// In en, this message translates to:
  /// **'Services'**
  String get servicesHeader2;

  /// No description provided for @servicesSubtitle.
  ///
  /// In en, this message translates to:
  /// **'What I bring to the table'**
  String get servicesSubtitle;

  /// No description provided for @serviceTitle1.
  ///
  /// In en, this message translates to:
  /// **'Cross-Platform App Development'**
  String get serviceTitle1;

  /// No description provided for @serviceDesc1.
  ///
  /// In en, this message translates to:
  /// **'Building production-ready mobile applications for Android, iOS, and Web using Flutter & Dart. Delivered 20+ apps with scalable architecture.'**
  String get serviceDesc1;

  /// No description provided for @serviceTitle2.
  ///
  /// In en, this message translates to:
  /// **'State Management'**
  String get serviceTitle2;

  /// No description provided for @serviceDesc2.
  ///
  /// In en, this message translates to:
  /// **'Expert in Riverpod, GetX, Provider, and Bloc for managing complex app states. Clean separation of concerns with MVVM & Clean Architecture.'**
  String get serviceDesc2;

  /// No description provided for @serviceTitle3.
  ///
  /// In en, this message translates to:
  /// **'API & Backend Integration'**
  String get serviceTitle3;

  /// No description provided for @serviceDesc3.
  ///
  /// In en, this message translates to:
  /// **'RESTful API integration with Dio, JWT authentication, error handling, and real-time data with Firebase FCM & WebSocket (Socket.io).'**
  String get serviceDesc3;

  /// No description provided for @serviceTitle4.
  ///
  /// In en, this message translates to:
  /// **'Maps & Location Services'**
  String get serviceTitle4;

  /// No description provided for @serviceDesc4.
  ///
  /// In en, this message translates to:
  /// **'Google Maps integration, real-time GPS tracking, polyline routing, geofencing, and marker control for delivery & logistics apps.'**
  String get serviceDesc4;

  /// No description provided for @serviceTitle5.
  ///
  /// In en, this message translates to:
  /// **'Payment Integration'**
  String get serviceTitle5;

  /// No description provided for @serviceDesc5.
  ///
  /// In en, this message translates to:
  /// **'Stripe payment workflows, subscription management systems, in-app purchase flows, and secure payment processing.'**
  String get serviceDesc5;

  /// No description provided for @serviceTitle6.
  ///
  /// In en, this message translates to:
  /// **'Advanced Features'**
  String get serviceTitle6;

  /// No description provided for @serviceDesc6.
  ///
  /// In en, this message translates to:
  /// **'Localization (multi-language), OCR, Face Liveness Detection (Google ML Kit), AI Chatbot integration, and push notifications.'**
  String get serviceDesc6;

  /// No description provided for @resumeHeader1.
  ///
  /// In en, this message translates to:
  /// **'Why Hire Me?'**
  String get resumeHeader1;

  /// No description provided for @resumeDesc1.
  ///
  /// In en, this message translates to:
  /// **'Flutter Developer with 1+ year of professional experience at Softvence Delta. Built and delivered 20+ production apps with Clean Architecture, Riverpod, and Firebase. Ranked 1st in Ostad Batch-9.'**
  String get resumeDesc1;

  /// No description provided for @resumeTabExperience.
  ///
  /// In en, this message translates to:
  /// **'Experience'**
  String get resumeTabExperience;

  /// No description provided for @resumeTabEducation.
  ///
  /// In en, this message translates to:
  /// **'Education'**
  String get resumeTabEducation;

  /// No description provided for @resumeTabSkills.
  ///
  /// In en, this message translates to:
  /// **'Skills'**
  String get resumeTabSkills;

  /// No description provided for @resumeTabAboutMe.
  ///
  /// In en, this message translates to:
  /// **'About Me'**
  String get resumeTabAboutMe;

  /// No description provided for @resumeMyExperience1.
  ///
  /// In en, this message translates to:
  /// **'My '**
  String get resumeMyExperience1;

  /// No description provided for @resumeMyExperience2.
  ///
  /// In en, this message translates to:
  /// **'Experience'**
  String get resumeMyExperience2;

  /// No description provided for @resumeMyExperienceDesc.
  ///
  /// In en, this message translates to:
  /// **'Professional experience building production-ready Flutter applications.'**
  String get resumeMyExperienceDesc;

  /// No description provided for @resumeMyEducation1.
  ///
  /// In en, this message translates to:
  /// **'My '**
  String get resumeMyEducation1;

  /// No description provided for @resumeMyEducation2.
  ///
  /// In en, this message translates to:
  /// **'Education'**
  String get resumeMyEducation2;

  /// No description provided for @resumeMyEducationDesc.
  ///
  /// In en, this message translates to:
  /// **'Academic background and professional certifications.'**
  String get resumeMyEducationDesc;

  /// No description provided for @resumeMySkills1.
  ///
  /// In en, this message translates to:
  /// **'My '**
  String get resumeMySkills1;

  /// No description provided for @resumeMySkills2.
  ///
  /// In en, this message translates to:
  /// **'Skills'**
  String get resumeMySkills2;

  /// No description provided for @resumeMySkillsDesc.
  ///
  /// In en, this message translates to:
  /// **'Technologies & tools I work with'**
  String get resumeMySkillsDesc;

  /// No description provided for @resumeAboutMe1.
  ///
  /// In en, this message translates to:
  /// **'About '**
  String get resumeAboutMe1;

  /// No description provided for @resumeAboutMe2.
  ///
  /// In en, this message translates to:
  /// **'Me'**
  String get resumeAboutMe2;

  /// No description provided for @resumeAboutMeDesc.
  ///
  /// In en, this message translates to:
  /// **'Personal information at a glance'**
  String get resumeAboutMeDesc;

  /// No description provided for @resumeAboutLabelName.
  ///
  /// In en, this message translates to:
  /// **'Name'**
  String get resumeAboutLabelName;

  /// No description provided for @resumeAboutLabelRole.
  ///
  /// In en, this message translates to:
  /// **'Role'**
  String get resumeAboutLabelRole;

  /// No description provided for @resumeAboutLabelExp.
  ///
  /// In en, this message translates to:
  /// **'Experience'**
  String get resumeAboutLabelExp;

  /// No description provided for @resumeAboutLabelCompany.
  ///
  /// In en, this message translates to:
  /// **'Company'**
  String get resumeAboutLabelCompany;

  /// No description provided for @resumeAboutLabelLocation.
  ///
  /// In en, this message translates to:
  /// **'Location'**
  String get resumeAboutLabelLocation;

  /// No description provided for @resumeAboutLabelNationality.
  ///
  /// In en, this message translates to:
  /// **'Nationality'**
  String get resumeAboutLabelNationality;

  /// No description provided for @resumeAboutLabelPhone.
  ///
  /// In en, this message translates to:
  /// **'Phone'**
  String get resumeAboutLabelPhone;

  /// No description provided for @resumeAboutLabelEmail.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get resumeAboutLabelEmail;

  /// No description provided for @resumeAboutLabelPortfolio.
  ///
  /// In en, this message translates to:
  /// **'Portfolio'**
  String get resumeAboutLabelPortfolio;

  /// No description provided for @resumeAboutLabelAvailability.
  ///
  /// In en, this message translates to:
  /// **'Availability'**
  String get resumeAboutLabelAvailability;

  /// No description provided for @resumeAboutLabelLanguages.
  ///
  /// In en, this message translates to:
  /// **'Languages'**
  String get resumeAboutLabelLanguages;

  /// No description provided for @resumeAboutValExp.
  ///
  /// In en, this message translates to:
  /// **'1+ Years Professional'**
  String get resumeAboutValExp;

  /// No description provided for @resumeAboutValCompany.
  ///
  /// In en, this message translates to:
  /// **'Softvence Delta (prev)'**
  String get resumeAboutValCompany;

  /// No description provided for @resumeAboutValLocation.
  ///
  /// In en, this message translates to:
  /// **'Dhaka, Bangladesh'**
  String get resumeAboutValLocation;

  /// No description provided for @resumeAboutValNationality.
  ///
  /// In en, this message translates to:
  /// **'Bangladeshi'**
  String get resumeAboutValNationality;

  /// No description provided for @resumeAboutValAvailability.
  ///
  /// In en, this message translates to:
  /// **'Full-time / Freelance'**
  String get resumeAboutValAvailability;

  /// No description provided for @resumeAboutValLanguages.
  ///
  /// In en, this message translates to:
  /// **'English, Bangla'**
  String get resumeAboutValLanguages;

  /// No description provided for @portfolioHeader1.
  ///
  /// In en, this message translates to:
  /// **'Featured '**
  String get portfolioHeader1;

  /// No description provided for @portfolioHeader2.
  ///
  /// In en, this message translates to:
  /// **'Projects'**
  String get portfolioHeader2;

  /// No description provided for @portfolioSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Production apps I\'ve built'**
  String get portfolioSubtitle;

  /// No description provided for @portfolioProject1Title.
  ///
  /// In en, this message translates to:
  /// **'Delivery Mobile Application'**
  String get portfolioProject1Title;

  /// No description provided for @portfolioProject1Desc.
  ///
  /// In en, this message translates to:
  /// **'Two-sided delivery marketplace with 160+ screens. Real-time GPS tracking, Google Maps with polyline routing, Stripe payments, OTP-based delivery confirmation, JWT-authenticated REST APIs, FCM push notifications, and multi-language localization.'**
  String get portfolioProject1Desc;

  /// No description provided for @portfolioProject2Title.
  ///
  /// In en, this message translates to:
  /// **'ATLISS – Food Marketplace App'**
  String get portfolioProject2Title;

  /// No description provided for @portfolioProject2Desc.
  ///
  /// In en, this message translates to:
  /// **'Food truck marketplace with dual-role access for customers and vendors across 150+ screens. Google ML Kit for face liveness detection & OCR-based ID verification. Vendor analytics dashboards, subscription plans, and role-based auth.'**
  String get portfolioProject2Desc;

  /// No description provided for @portfolioProject3Title.
  ///
  /// In en, this message translates to:
  /// **'ChatterSticks – Comic Streaming'**
  String get portfolioProject3Title;

  /// No description provided for @portfolioProject3Desc.
  ///
  /// In en, this message translates to:
  /// **'Comic streaming app with JWT login/signup, OTP email verification, password reset, real-time notifications via Socket.io & FCM. Comic reader with episode browsing, image rendering, and reading history tracking.'**
  String get portfolioProject3Desc;

  /// No description provided for @portfolioProject4Title.
  ///
  /// In en, this message translates to:
  /// **'Hedset – Recipe & Meal Planning'**
  String get portfolioProject4Title;

  /// No description provided for @portfolioProject4Desc.
  ///
  /// In en, this message translates to:
  /// **'Cross-platform recipe and meal planning app for Android, iOS, and Web. Personalized recipe recommendations, OTP auth, Stripe premium subscription, AI-powered nutritionist chatbot, and Hive for local caching.'**
  String get portfolioProject4Desc;

  /// No description provided for @contactHeader1.
  ///
  /// In en, this message translates to:
  /// **'Let\'s Work Together'**
  String get contactHeader1;

  /// No description provided for @contactDesc1.
  ///
  /// In en, this message translates to:
  /// **'I\'m passionate about building production-ready mobile applications. Whether you need a cross-platform app, API integration, or a complete mobile solution — let\'s collaborate to bring your ideas to life.'**
  String get contactDesc1;

  /// No description provided for @contactLabelPhone.
  ///
  /// In en, this message translates to:
  /// **'Phone'**
  String get contactLabelPhone;

  /// No description provided for @contactLabelEmail.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get contactLabelEmail;

  /// No description provided for @contactLabelAddress.
  ///
  /// In en, this message translates to:
  /// **'Address'**
  String get contactLabelAddress;

  /// No description provided for @contactLabelPortfolio.
  ///
  /// In en, this message translates to:
  /// **'Portfolio'**
  String get contactLabelPortfolio;

  /// No description provided for @contactAddressVal.
  ///
  /// In en, this message translates to:
  /// **'Dhaka, Bangladesh'**
  String get contactAddressVal;

  /// No description provided for @contactFormHeader1.
  ///
  /// In en, this message translates to:
  /// **'Contact '**
  String get contactFormHeader1;

  /// No description provided for @contactFormHeader2.
  ///
  /// In en, this message translates to:
  /// **'Me!'**
  String get contactFormHeader2;

  /// No description provided for @contactHintName.
  ///
  /// In en, this message translates to:
  /// **'Enter Your Name'**
  String get contactHintName;

  /// No description provided for @contactHintEmail.
  ///
  /// In en, this message translates to:
  /// **'Enter Your Email'**
  String get contactHintEmail;

  /// No description provided for @contactHintPhone.
  ///
  /// In en, this message translates to:
  /// **'Phone Number'**
  String get contactHintPhone;

  /// No description provided for @contactHintSubject.
  ///
  /// In en, this message translates to:
  /// **'Email Subject'**
  String get contactHintSubject;

  /// No description provided for @contactHintMessage.
  ///
  /// In en, this message translates to:
  /// **'Your Message'**
  String get contactHintMessage;

  /// No description provided for @contactBtnSend.
  ///
  /// In en, this message translates to:
  /// **'Send Message'**
  String get contactBtnSend;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['bn', 'en'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'bn': return AppLocalizationsBn();
    case 'en': return AppLocalizationsEn();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
