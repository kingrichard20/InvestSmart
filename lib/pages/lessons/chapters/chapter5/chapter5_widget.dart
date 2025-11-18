import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'chapter5_model.dart';
export 'chapter5_model.dart';

class Chapter5Widget extends StatefulWidget {
  const Chapter5Widget({super.key});

  static String routeName = 'Chapter5';
  static String routePath = '/chapter5';

  @override
  State<Chapter5Widget> createState() => _Chapter5WidgetState();
}

class _Chapter5WidgetState extends State<Chapter5Widget> {
  late Chapter5Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => Chapter5Model());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'Chapter5'});
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).brandAccent1,
          automaticallyImplyLeading: false,
          leading: FlutterFlowIconButton(
            borderRadius: 20.0,
            buttonSize: 40.0,
            icon: Icon(
              Icons.arrow_back_rounded,
              color: Colors.white,
              size: 24.0,
            ),
            onPressed: () async {
              context.safePop();
            },
          ),
          title: Text(
            'Lesson 5',
            style: FlutterFlowTheme.of(context).titleMedium.override(
                  font: GoogleFonts.inter(
                    fontWeight: FontWeight.w600,
                    fontStyle:
                        FlutterFlowTheme.of(context).titleMedium.fontStyle,
                  ),
                  color: Colors.white,
                  fontSize: 18.0,
                  letterSpacing: 0.0,
                  fontWeight: FontWeight.w600,
                  fontStyle: FlutterFlowTheme.of(context).titleMedium.fontStyle,
                ),
          ),
          actions: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(16.0, 5.0, 16.0, 5.0),
              child: Container(
                height: 40.0,
                decoration: BoxDecoration(
                  color: Color(0xFF448929),
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Padding(
                  padding: EdgeInsets.all(12.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Quiz Youself',
                        style: FlutterFlowTheme.of(context).bodySmall.override(
                              font: GoogleFonts.inter(
                                fontWeight: FontWeight.w500,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .bodySmall
                                    .fontStyle,
                              ),
                              color: Colors.white,
                              fontSize: 12.0,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.w500,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .bodySmall
                                  .fontStyle,
                            ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
          centerTitle: true,
          elevation: 2.0,
        ),
        body: SafeArea(
          top: true,
          child: Container(
            width: MediaQuery.sizeOf(context).width * 1.0,
            height: MediaQuery.sizeOf(context).height * 1.0,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).brandPrimaryBackground,
            ),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    width: double.infinity,
                    height: 200.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).primaryBackground,
                      image: DecorationImage(
                        fit: BoxFit.fitWidth,
                        alignment: AlignmentDirectional(0.0, -0.5),
                        image: Image.asset(
                          'assets/images/U.S.-Department-of-Treasury.jpg',
                        ).image,
                      ),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Container(
                            width: double.infinity,
                            height: 100.0,
                            decoration: BoxDecoration(
                              color: Color(0x76000000),
                            ),
                            child: Align(
                              alignment: AlignmentDirectional(0.0, 0.0),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16.0, 0.0, 16.0, 0.0),
                                child: Text(
                                  '\"nothing can be said to be certain, except death and taxes\"',
                                  style: FlutterFlowTheme.of(context)
                                      .titleLarge
                                      .override(
                                        font: GoogleFonts.inter(
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .titleLarge
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .titleLarge
                                                  .fontStyle,
                                        ),
                                        color: FlutterFlowTheme.of(context)
                                            .brandSecondaryBackground,
                                        letterSpacing: 0.0,
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .titleLarge
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .titleLarge
                                            .fontStyle,
                                      ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                    child: Text(
                      'Chapter 5 - Knowing Taxes and their Impact',
                      style:
                          FlutterFlowTheme.of(context).headlineMedium.override(
                                font: GoogleFonts.readexPro(
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .headlineMedium
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .headlineMedium
                                      .fontStyle,
                                ),
                                letterSpacing: 0.0,
                                fontWeight: FlutterFlowTheme.of(context)
                                    .headlineMedium
                                    .fontWeight,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .headlineMedium
                                    .fontStyle,
                              ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                      child: Container(
                        width: 100.0,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context)
                              .brandSecondaryBackground,
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(16.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Capital Gains Taxes',
                                style: FlutterFlowTheme.of(context)
                                    .brandStandardBold
                                    .override(
                                      font: GoogleFonts.inter(
                                        fontWeight: FontWeight.w600,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .brandStandardBold
                                            .fontStyle,
                                      ),
                                      color: FlutterFlowTheme.of(context)
                                          .brandTextStandard,
                                      fontSize: 24.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w600,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .brandStandardBold
                                          .fontStyle,
                                    ),
                              ),
                              RichText(
                                textScaler: MediaQuery.of(context).textScaler,
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text:
                                          'Capital gains taxes are what you pay when you sell an investment for more than you bought it — for example, when your stock, crypto, or real estate goes up in value and you cash out. They come in two forms: ',
                                      style: FlutterFlowTheme.of(context)
                                          .brandStandard
                                          .override(
                                            font: GoogleFonts.inter(
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .brandStandard
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .brandStandard
                                                      .fontStyle,
                                            ),
                                            color: FlutterFlowTheme.of(context)
                                                .brandTextStandard,
                                            fontSize: 16.0,
                                            letterSpacing: 0.0,
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .brandStandard
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .brandStandard
                                                    .fontStyle,
                                          ),
                                    ),
                                    TextSpan(
                                      text:
                                          'short-term and long-term.\n\nShort-term capital gains ',
                                      style: FlutterFlowTheme.of(context)
                                          .brandStandardBold
                                          .override(
                                            font: GoogleFonts.inter(
                                              fontWeight: FontWeight.bold,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .brandStandardBold
                                                      .fontStyle,
                                            ),
                                            color: FlutterFlowTheme.of(context)
                                                .brandTextStandard,
                                            fontSize: 16.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.bold,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .brandStandardBold
                                                    .fontStyle,
                                          ),
                                    ),
                                    TextSpan(
                                      text:
                                          'apply to investments you’ve held for one year or less and are taxed as regular income, which can mean a rate as high as your paycheck’s — up to 37% in the U.S.\n\n',
                                      style: FlutterFlowTheme.of(context)
                                          .brandStandard
                                          .override(
                                            font: GoogleFonts.inter(
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .brandStandard
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .brandStandard
                                                      .fontStyle,
                                            ),
                                            color: FlutterFlowTheme.of(context)
                                                .brandTextStandard,
                                            fontSize: 16.0,
                                            letterSpacing: 0.0,
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .brandStandard
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .brandStandard
                                                    .fontStyle,
                                          ),
                                    ),
                                    TextSpan(
                                      text: 'Long-term capital gains',
                                      style: FlutterFlowTheme.of(context)
                                          .brandStandardBold
                                          .override(
                                            font: GoogleFonts.inter(
                                              fontWeight: FontWeight.bold,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .brandStandardBold
                                                      .fontStyle,
                                            ),
                                            color: FlutterFlowTheme.of(context)
                                                .brandTextStandard,
                                            fontSize: 16.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.bold,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .brandStandardBold
                                                    .fontStyle,
                                          ),
                                    ),
                                    TextSpan(
                                      text:
                                          ', on the other hand, apply to assets held for more than a year and are taxed at lower rates — typically 0%, 15%, or 20%, depending on your income.\n\n',
                                      style: FlutterFlowTheme.of(context)
                                          .brandStandard
                                          .override(
                                            font: GoogleFonts.inter(
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .brandStandard
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .brandStandard
                                                      .fontStyle,
                                            ),
                                            color: FlutterFlowTheme.of(context)
                                                .brandTextStandard,
                                            fontSize: 16.0,
                                            letterSpacing: 0.0,
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .brandStandard
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .brandStandard
                                                    .fontStyle,
                                          ),
                                    ),
                                    TextSpan(
                                      text:
                                          'This difference can have a huge impact on your returns. Selling too quickly can cut deep into your profits, while holding investments longer often means keeping more of what you earn. Over time, that tax efficiency can compound, helping your portfolio grow faster.',
                                      style: FlutterFlowTheme.of(context)
                                          .brandStandard
                                          .override(
                                            font: GoogleFonts.inter(
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .brandStandard
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .brandStandard
                                                      .fontStyle,
                                            ),
                                            color: FlutterFlowTheme.of(context)
                                                .brandTextStandard,
                                            fontSize: 16.0,
                                            letterSpacing: 0.0,
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .brandStandard
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .brandStandard
                                                    .fontStyle,
                                          ),
                                    )
                                  ],
                                  style: FlutterFlowTheme.of(context)
                                      .brandStandard
                                      .override(
                                        font: GoogleFonts.inter(
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .brandStandard
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .brandStandard
                                                  .fontStyle,
                                        ),
                                        color: FlutterFlowTheme.of(context)
                                            .brandTextStandard,
                                        fontSize: 20.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .brandStandard
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .brandStandard
                                            .fontStyle,
                                      ),
                                ),
                              ),
                            ].divide(SizedBox(height: 12.0)),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                      child: Container(
                        width: 100.0,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context)
                              .brandSecondaryBackground,
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(16.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Tax-Loss Harvesting and the Wash Sale Rule',
                                style: FlutterFlowTheme.of(context)
                                    .brandStandardBold
                                    .override(
                                      font: GoogleFonts.inter(
                                        fontWeight: FontWeight.w600,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .brandStandardBold
                                            .fontStyle,
                                      ),
                                      color: FlutterFlowTheme.of(context)
                                          .brandTextStandard,
                                      fontSize: 24.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w600,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .brandStandardBold
                                          .fontStyle,
                                    ),
                              ),
                              RichText(
                                textScaler: MediaQuery.of(context).textScaler,
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: 'Tax-loss harvesting ',
                                      style: FlutterFlowTheme.of(context)
                                          .brandStandardBold
                                          .override(
                                            font: GoogleFonts.inter(
                                              fontWeight: FontWeight.bold,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .brandStandardBold
                                                      .fontStyle,
                                            ),
                                            color: FlutterFlowTheme.of(context)
                                                .brandTextStandard,
                                            fontSize: 16.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.bold,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .brandStandardBold
                                                    .fontStyle,
                                          ),
                                    ),
                                    TextSpan(
                                      text:
                                          'is a strategy investors use to make the best of a losing investment. When one of your stocks or funds drops in value, you can sell it to “harvest” that loss — and use it to offset other capital gains. In other words, your losses can reduce the taxes you owe on your profits.\n\n',
                                      style: FlutterFlowTheme.of(context)
                                          .brandStandard
                                          .override(
                                            font: GoogleFonts.inter(
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .brandStandard
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .brandStandard
                                                      .fontStyle,
                                            ),
                                            color: FlutterFlowTheme.of(context)
                                                .brandTextStandard,
                                            fontSize: 16.0,
                                            letterSpacing: 0.0,
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .brandStandard
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .brandStandard
                                                    .fontStyle,
                                          ),
                                    ),
                                    TextSpan(
                                      text:
                                          'For example, if you made \$2,000 selling one stock but lost \$1,000 on another, you’d only pay taxes on the net gain of \$1,000. And if your losses are bigger than your gains, you can even use up to \$3,000 of those losses each year to lower your regular income taxes, with the rest carried forward to future years.\n\nHowever, the ',
                                      style: FlutterFlowTheme.of(context)
                                          .brandStandard
                                          .override(
                                            font: GoogleFonts.inter(
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .brandStandard
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .brandStandard
                                                      .fontStyle,
                                            ),
                                            color: FlutterFlowTheme.of(context)
                                                .brandTextStandard,
                                            fontSize: 16.0,
                                            letterSpacing: 0.0,
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .brandStandard
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .brandStandard
                                                    .fontStyle,
                                          ),
                                    ),
                                    TextSpan(
                                      text: 'Wash Sale Rule',
                                      style: FlutterFlowTheme.of(context)
                                          .brandStandardBold
                                          .override(
                                            font: GoogleFonts.inter(
                                              fontWeight: FontWeight.bold,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .brandStandardBold
                                                      .fontStyle,
                                            ),
                                            color: FlutterFlowTheme.of(context)
                                                .brandTextStandard,
                                            fontSize: 16.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.bold,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .brandStandardBold
                                                    .fontStyle,
                                          ),
                                    ),
                                    TextSpan(
                                      text:
                                          ' prevents you from taking advantage of this strategy unfairly. It says that if you sell an investment at a loss and then buy the same or “substantially identical” security within 30 days before or after the sale, you can’t claim that loss on your taxes. The goal is to stop investors from selling just to get a tax break and immediately buying back in.\n\n',
                                      style: FlutterFlowTheme.of(context)
                                          .brandStandard
                                          .override(
                                            font: GoogleFonts.inter(
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .brandStandard
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .brandStandard
                                                      .fontStyle,
                                            ),
                                            color: FlutterFlowTheme.of(context)
                                                .brandTextStandard,
                                            fontSize: 16.0,
                                            letterSpacing: 0.0,
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .brandStandard
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .brandStandard
                                                    .fontStyle,
                                          ),
                                    ),
                                    TextSpan(
                                      text:
                                          'The impact of tax-loss harvesting is that it helps smooth out your tax bill and improve your after-tax returns — especially in volatile markets. But to benefit, you need to plan carefully and respect the Wash Sale Rule’s 30-day window. When used wisely, it’s a smart way to turn investment setbacks into long-term advantages.',
                                      style: FlutterFlowTheme.of(context)
                                          .brandStandard
                                          .override(
                                            font: GoogleFonts.inter(
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .brandStandard
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .brandStandard
                                                      .fontStyle,
                                            ),
                                            color: FlutterFlowTheme.of(context)
                                                .brandTextStandard,
                                            fontSize: 16.0,
                                            letterSpacing: 0.0,
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .brandStandard
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .brandStandard
                                                    .fontStyle,
                                          ),
                                    )
                                  ],
                                  style: FlutterFlowTheme.of(context)
                                      .brandStandard
                                      .override(
                                        font: GoogleFonts.inter(
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .brandStandard
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .brandStandard
                                                  .fontStyle,
                                        ),
                                        color: FlutterFlowTheme.of(context)
                                            .brandTextStandard,
                                        fontSize: 20.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .brandStandard
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .brandStandard
                                            .fontStyle,
                                      ),
                                ),
                              ),
                            ].divide(SizedBox(height: 12.0)),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 16.0),
                      child: Container(
                        width: 100.0,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context)
                              .brandSecondaryBackground,
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(16.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'IRA Tax Benefits',
                                style: FlutterFlowTheme.of(context)
                                    .brandStandardBold
                                    .override(
                                      font: GoogleFonts.inter(
                                        fontWeight: FontWeight.w600,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .brandStandardBold
                                            .fontStyle,
                                      ),
                                      color: FlutterFlowTheme.of(context)
                                          .brandTextStandard,
                                      fontSize: 24.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w600,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .brandStandardBold
                                          .fontStyle,
                                    ),
                              ),
                              RichText(
                                textScaler: MediaQuery.of(context).textScaler,
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: 'IRAs',
                                      style: FlutterFlowTheme.of(context)
                                          .brandStandardBold
                                          .override(
                                            font: GoogleFonts.inter(
                                              fontWeight: FontWeight.bold,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .brandStandardBold
                                                      .fontStyle,
                                            ),
                                            color: FlutterFlowTheme.of(context)
                                                .brandTextStandard,
                                            fontSize: 16.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.bold,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .brandStandardBold
                                                    .fontStyle,
                                          ),
                                    ),
                                    TextSpan(
                                      text:
                                          '— or Individual Retirement Accounts — are special investment accounts designed to help you save for retirement while giving you powerful tax advantages. The two main types are the ',
                                      style: FlutterFlowTheme.of(context)
                                          .brandStandard
                                          .override(
                                            font: GoogleFonts.inter(
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .brandStandard
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .brandStandard
                                                      .fontStyle,
                                            ),
                                            color: FlutterFlowTheme.of(context)
                                                .brandTextStandard,
                                            fontSize: 16.0,
                                            letterSpacing: 0.0,
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .brandStandard
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .brandStandard
                                                    .fontStyle,
                                          ),
                                    ),
                                    TextSpan(
                                      text: 'Traditional IRA',
                                      style: FlutterFlowTheme.of(context)
                                          .brandStandardBold
                                          .override(
                                            font: GoogleFonts.inter(
                                              fontWeight: FontWeight.bold,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .brandStandardBold
                                                      .fontStyle,
                                            ),
                                            color: FlutterFlowTheme.of(context)
                                                .brandTextStandard,
                                            fontSize: 16.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.bold,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .brandStandardBold
                                                    .fontStyle,
                                          ),
                                    ),
                                    TextSpan(
                                      text: ' and the ',
                                      style: FlutterFlowTheme.of(context)
                                          .brandStandard
                                          .override(
                                            font: GoogleFonts.inter(
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .brandStandard
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .brandStandard
                                                      .fontStyle,
                                            ),
                                            color: FlutterFlowTheme.of(context)
                                                .brandTextStandard,
                                            fontSize: 16.0,
                                            letterSpacing: 0.0,
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .brandStandard
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .brandStandard
                                                    .fontStyle,
                                          ),
                                    ),
                                    TextSpan(
                                      text: 'Roth IRA',
                                      style: FlutterFlowTheme.of(context)
                                          .brandStandardBold
                                          .override(
                                            font: GoogleFonts.inter(
                                              fontWeight: FontWeight.bold,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .brandStandardBold
                                                      .fontStyle,
                                            ),
                                            color: FlutterFlowTheme.of(context)
                                                .brandTextStandard,
                                            fontSize: 16.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.bold,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .brandStandardBold
                                                    .fontStyle,
                                          ),
                                    ),
                                    TextSpan(
                                      text:
                                          ', and they differ mainly in when you pay taxes.\n\n',
                                      style: FlutterFlowTheme.of(context)
                                          .brandStandard
                                          .override(
                                            font: GoogleFonts.inter(
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .brandStandard
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .brandStandard
                                                      .fontStyle,
                                            ),
                                            color: FlutterFlowTheme.of(context)
                                                .brandTextStandard,
                                            fontSize: 16.0,
                                            letterSpacing: 0.0,
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .brandStandard
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .brandStandard
                                                    .fontStyle,
                                          ),
                                    ),
                                    TextSpan(
                                      text: 'With a ',
                                      style: FlutterFlowTheme.of(context)
                                          .brandStandard
                                          .override(
                                            font: GoogleFonts.inter(
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .brandStandard
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .brandStandard
                                                      .fontStyle,
                                            ),
                                            color: FlutterFlowTheme.of(context)
                                                .brandTextStandard,
                                            fontSize: 16.0,
                                            letterSpacing: 0.0,
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .brandStandard
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .brandStandard
                                                    .fontStyle,
                                          ),
                                    ),
                                    TextSpan(
                                      text: 'Traditional IRA',
                                      style: FlutterFlowTheme.of(context)
                                          .brandStandardBold
                                          .override(
                                            font: GoogleFonts.inter(
                                              fontWeight: FontWeight.bold,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .brandStandardBold
                                                      .fontStyle,
                                            ),
                                            color: FlutterFlowTheme.of(context)
                                                .brandTextStandard,
                                            fontSize: 16.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.bold,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .brandStandardBold
                                                    .fontStyle,
                                          ),
                                    ),
                                    TextSpan(
                                      text:
                                          ', you typically contribute pre-tax money. That means you may get an immediate tax deduction, lowering your taxable income for the year. Your investments then grow tax-deferred, meaning you don’t pay taxes until you withdraw the money in retirement — ideally when you’re in a lower tax bracket.\n\n',
                                      style: FlutterFlowTheme.of(context)
                                          .brandStandard
                                          .override(
                                            font: GoogleFonts.inter(
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .brandStandard
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .brandStandard
                                                      .fontStyle,
                                            ),
                                            color: FlutterFlowTheme.of(context)
                                                .brandTextStandard,
                                            fontSize: 16.0,
                                            letterSpacing: 0.0,
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .brandStandard
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .brandStandard
                                                    .fontStyle,
                                          ),
                                    ),
                                    TextSpan(
                                      text: 'A ',
                                      style: FlutterFlowTheme.of(context)
                                          .brandStandard
                                          .override(
                                            font: GoogleFonts.inter(
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .brandStandard
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .brandStandard
                                                      .fontStyle,
                                            ),
                                            color: FlutterFlowTheme.of(context)
                                                .brandTextStandard,
                                            fontSize: 16.0,
                                            letterSpacing: 0.0,
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .brandStandard
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .brandStandard
                                                    .fontStyle,
                                          ),
                                    ),
                                    TextSpan(
                                      text: 'Roth IRA',
                                      style: FlutterFlowTheme.of(context)
                                          .brandStandardBold
                                          .override(
                                            font: GoogleFonts.inter(
                                              fontWeight: FontWeight.bold,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .brandStandardBold
                                                      .fontStyle,
                                            ),
                                            color: FlutterFlowTheme.of(context)
                                                .brandTextStandard,
                                            fontSize: 16.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.bold,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .brandStandardBold
                                                    .fontStyle,
                                          ),
                                    ),
                                    TextSpan(
                                      text:
                                          ' works the opposite way: you contribute after-tax dollars, so you don’t get a deduction now. But the huge benefit is that your investments grow tax-free, and when you withdraw the money in retirement, you pay no taxes at all on your earnings — as long as you follow the rules.\n\nThe impact of using these accounts is significant. By deferring or eliminating taxes on your investment growth, your money compounds faster than it would in a taxable account. Over decades, that can mean thousands — even hundreds of thousands — of dollars more for your future.',
                                      style: FlutterFlowTheme.of(context)
                                          .brandStandard
                                          .override(
                                            font: GoogleFonts.inter(
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .brandStandard
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .brandStandard
                                                      .fontStyle,
                                            ),
                                            color: FlutterFlowTheme.of(context)
                                                .brandTextStandard,
                                            fontSize: 16.0,
                                            letterSpacing: 0.0,
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .brandStandard
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .brandStandard
                                                    .fontStyle,
                                          ),
                                    )
                                  ],
                                  style: FlutterFlowTheme.of(context)
                                      .brandStandard
                                      .override(
                                        font: GoogleFonts.inter(
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .brandStandard
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .brandStandard
                                                  .fontStyle,
                                        ),
                                        color: FlutterFlowTheme.of(context)
                                            .brandTextStandard,
                                        fontSize: 20.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .brandStandard
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .brandStandard
                                            .fontStyle,
                                      ),
                                ),
                              ),
                            ].divide(SizedBox(height: 12.0)),
                          ),
                        ),
                      ),
                    ),
                  ),
                ].divide(SizedBox(height: 16.0)),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
