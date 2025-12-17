import 'dart:io';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:integration_test/integration_test.dart';
import 'package:invest_smart/flutter_flow/flutter_flow_icon_button.dart';
import 'package:invest_smart/flutter_flow/flutter_flow_radio_button.dart';
import 'package:invest_smart/flutter_flow/flutter_flow_widgets.dart';
import 'package:invest_smart/flutter_flow/flutter_flow_theme.dart';
import 'package:invest_smart/index.dart';
import 'package:invest_smart/main.dart';
import 'package:invest_smart/flutter_flow/flutter_flow_util.dart';

import 'package:provider/provider.dart';
import 'package:invest_smart/backend/firebase/firebase_config.dart';
import 'package:invest_smart/auth/firebase_auth/auth_util.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() async {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  setUpAll(() async {
    await initFirebase();
  });

  setUp(() async {
    await authManager.signOut();
    FFAppState.reset();
    final appState = FFAppState();
    await appState.initializePersistedState();
  });

  testWidgets('User Login', (WidgetTester tester) async {
    _overrideOnError();

    await tester.pumpWidget(ChangeNotifierProvider(
      create: (context) => FFAppState(),
      child: MyApp(
        entryPage: AuthenticationWidget(),
      ),
    ));
    await GoogleFonts.pendingFonts();

    await tester.pumpAndSettle(
      const Duration(milliseconds: 10000),
      EnginePhase.sendSemanticsUpdate,
      const Duration(milliseconds: 30000),
    );
    await tester.tap(find.byKey(const ValueKey('LoginTab_jbxv')));
    await tester.pumpAndSettle(
      const Duration(milliseconds: 5000),
      EnginePhase.sendSemanticsUpdate,
      const Duration(milliseconds: 10000),
    );
    await tester.enterText(find.byKey(const ValueKey('Login-Email_9xid')),
        'nathanfeinberg@uri.edu');
    FocusManager.instance.primaryFocus?.unfocus();
    await tester.enterText(
        find.byKey(const ValueKey('Login-Password_ofit')), 'coolpass1');
    FocusManager.instance.primaryFocus?.unfocus();
    await tester.tap(find.byKey(const ValueKey('Login-Button_w2k2')));
    await tester.pumpAndSettle(
      const Duration(milliseconds: 10000),
      EnginePhase.sendSemanticsUpdate,
      const Duration(milliseconds: 20000),
    );
    expect(find.text('Lessons'), findsOneWidget);
  });

  testWidgets('Successful Buy', (WidgetTester tester) async {
    _overrideOnError();
    await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: 'hudson_byers@uri.edu', password: 'testtest123');
    await tester.pumpWidget(ChangeNotifierProvider(
      create: (context) => FFAppState(),
      child: MyApp(
        entryPage: BuyWidget(
          ticker: 'TSLA',
        ),
      ),
    ));
    await GoogleFonts.pendingFonts();

    // Waits for buy page to initially load with the data from the two api responses, called witht the passed page parameter.
    await tester.pumpAndSettle(
      const Duration(milliseconds: 10000),
      EnginePhase.sendSemanticsUpdate,
      const Duration(milliseconds: 30000),
    );
    // Enters the number of shares to buy.
    await tester.enterText(
        find.byKey(const ValueKey('Shares-to-Buy_qlfm')), '10');
    FocusManager.instance.primaryFocus?.unfocus();
    // Waits for the page to reload with calculated total cost.
    await tester.pumpAndSettle(
      const Duration(milliseconds: 5000),
      EnginePhase.sendSemanticsUpdate,
      const Duration(milliseconds: 10000),
    );
    // Taps the buy button to submit the buy order.
    await tester.tap(find.byKey(const ValueKey('Button_0ef5')));
    // Wait for buy transaction to be created, the firebase database to be updated, and page switched back to portfolio.
    await tester.pumpAndSettle(
      const Duration(milliseconds: 10000),
      EnginePhase.sendSemanticsUpdate,
      const Duration(milliseconds: 20000),
    );
    // Searches the screen for the text "My Portfolio" which is the header/title for the portfolio page.
    expect(find.text('My Portfolio'), findsWidgets);
  });

  testWidgets('Lesson Completion Tracking', (WidgetTester tester) async {
    _overrideOnError();
    await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: 'hudson_byers@uri.edu', password: 'testtest123');
    await tester.pumpWidget(ChangeNotifierProvider(
      create: (context) => FFAppState(),
      child: MyApp(
        entryPage: LessonsWidget(),
      ),
    ));
    await GoogleFonts.pendingFonts();

    // Waits for lessons page to fully load.
    await tester.pumpAndSettle(
      const Duration(milliseconds: 10000),
      EnginePhase.sendSemanticsUpdate,
      const Duration(milliseconds: 30000),
    );
    // Marks chapter 1 or lesson 1 as complete.
    await tester.tap(find.byKey(const ValueKey('Uncompleted-Icon_mx8e')));
    // Waits the chapters conditional visibility to update and the page to rebuild.
    await tester.pumpAndSettle(
      const Duration(milliseconds: 5000),
      EnginePhase.sendSemanticsUpdate,
      const Duration(milliseconds: 10000),
    );
    // Checks to see if only one chapter one contianer is on screen.
    expect(find.text('Chapter 1'), findsOneWidget);
  });

  testWidgets('User Gives Lesson Feedback', (WidgetTester tester) async {
    _overrideOnError();
    await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: 'hudson_byers@uri.edu', password: 'testtest123');
    await tester.pumpWidget(ChangeNotifierProvider(
      create: (context) => FFAppState(),
      child: MyApp(
        entryPage: Quiz5Widget(
          ans1: '1',
          ans2: '2',
          ans3: '1',
          ans4: '2',
          ans5: '2',
        ),
      ),
    ));
    await GoogleFonts.pendingFonts();

    // Waits for page to fully load.
    await tester.pumpAndSettle(
      const Duration(milliseconds: 10000),
      EnginePhase.sendSemanticsUpdate,
      const Duration(milliseconds: 30000),
    );
    // Scrolls until the submit button is on screen.
    await tester.scrollUntilVisible(
      find.byKey(const ValueKey('Submit-Button_q5v6')),
      100.0,
      scrollable: find.byType(Scrollable),
    );
    // Tap on the submit quiz button.
    await tester.tap(find.byKey(const ValueKey('Submit-Button_q5v6')));
    // Wait for feedback form to pop-up.
    await tester.pumpAndSettle(
      const Duration(milliseconds: 5000),
      EnginePhase.sendSemanticsUpdate,
      const Duration(milliseconds: 10000),
    );
    // Tap on a rating for the feedback.
    await tester.tap(find.byKey(const ValueKey('RatingBar_spih')));
    // Enter feedback text
    await tester.enterText(
        find.byKey(const ValueKey('Text_aere')), 'This app is terrible!!!!');
    FocusManager.instance.primaryFocus?.unfocus();
    await tester.pumpAndSettle(
      const Duration(milliseconds: 5000),
      EnginePhase.sendSemanticsUpdate,
      const Duration(milliseconds: 10000),
    );
    // Taps on button to submit the rating and feedback
    await tester.tap(find.byKey(const ValueKey('Submit-Button_q5v6')));
    // Waits for feedback to be submited to firebase and the feedback pop-up along with the thank you message to dissapear.
    await tester.pumpAndSettle(
      const Duration(milliseconds: 10000),
      EnginePhase.sendSemanticsUpdate,
      const Duration(milliseconds: 20000),
    );
    // Tests to see if feedback input pop-up has disapeared.
    expect(find.text('Feedback'), findsNothing);
  });
}

// There are certain types of errors that can happen during tests but
// should not break the test.
void _overrideOnError() {
  final originalOnError = FlutterError.onError!;
  FlutterError.onError = (errorDetails) {
    if (_shouldIgnoreError(errorDetails.toString())) {
      return;
    }
    originalOnError(errorDetails);
  };
}

bool _shouldIgnoreError(String error) {
  // It can fail to decode some SVGs - this should not break the test.
  if (error.contains('ImageCodecException')) {
    return true;
  }
  // Overflows happen all over the place,
  // but they should not break tests.
  if (error.contains('overflowed by')) {
    return true;
  }
  // Sometimes some images fail to load, it generally does not break the test.
  if (error.contains('No host specified in URI') ||
      error.contains('EXCEPTION CAUGHT BY IMAGE RESOURCE SERVICE')) {
    return true;
  }
  // These errors should be avoided, but they should not break the test.
  if (error.contains('setState() called after dispose()')) {
    return true;
  }
  // Web-specific error when interacting with TextInputType.emailAddress
  if (error.contains('setSelectionRange') &&
      error.contains('HTMLInputElement')) {
    return true;
  }

  return false;
}
