import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'chapter2_model.dart';
export 'chapter2_model.dart';

class Chapter2Widget extends StatefulWidget {
  const Chapter2Widget({super.key});

  static String routeName = 'Chapter2';
  static String routePath = '/chapter2';

  @override
  State<Chapter2Widget> createState() => _Chapter2WidgetState();
}

class _Chapter2WidgetState extends State<Chapter2Widget> {
  late Chapter2Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => Chapter2Model());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'Chapter2'});
    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
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
        backgroundColor: Color(0xFFFAFAFA),
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
            'Lesson 2',
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
              child: InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  context.pushNamed(
                    Quiz2Widget.routeName,
                    queryParameters: {
                      'ans1': serializeParam(
                        '',
                        ParamType.String,
                      ),
                      'ans2': serializeParam(
                        '',
                        ParamType.String,
                      ),
                      'ans3': serializeParam(
                        '',
                        ParamType.String,
                      ),
                      'ans4': serializeParam(
                        '',
                        ParamType.String,
                      ),
                      'ans5': serializeParam(
                        '',
                        ParamType.String,
                      ),
                    }.withoutNulls,
                  );
                },
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
                          'Quiz Yourself',
                          style:
                              FlutterFlowTheme.of(context).bodySmall.override(
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
            ),
          ],
          centerTitle: true,
          elevation: 2.0,
        ),
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Container(
                        width: double.infinity,
                        height: 200.0,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: Image.network(
                              'https://images.unsplash.com/photo-1593672715438-d88a70629abe?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHwzfHxtb25leXxlbnwwfHx8fDE3NjI5Nzg1NTh8MA&ixlib=rb-4.1.0&q=80&w=1080',
                            ).image,
                          ),
                          borderRadius: BorderRadius.circular(0.0),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(16.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'The best investment you can make is learning how investments work.',
                                textAlign: TextAlign.center,
                                style: FlutterFlowTheme.of(context)
                                    .titleLarge
                                    .override(
                                      font: GoogleFonts.inter(
                                        fontWeight: FontWeight.w500,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .titleLarge
                                            .fontStyle,
                                      ),
                                      color: Colors.white,
                                      fontSize: 18.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w500,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .titleLarge
                                          .fontStyle,
                                      lineHeight: 1.4,
                                    ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(12.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Align(
                              alignment: AlignmentDirectional(-1.0, 0.0),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    20.0, 0.0, 20.0, 0.0),
                                child: Material(
                                  color: Colors.transparent,
                                  elevation: 5.0,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Text(
                                        'Understanding Metrics & Terms',
                                        style: FlutterFlowTheme.of(context)
                                            .brandStandardHeader
                                            .override(
                                              font: GoogleFonts.readexPro(
                                                fontWeight: FontWeight.bold,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .brandStandardHeader
                                                        .fontStyle,
                                              ),
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .brandTextStandard,
                                              fontSize: 24.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.bold,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .brandStandardHeader
                                                      .fontStyle,
                                            ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(20.0),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  boxShadow: [
                                    BoxShadow(
                                      blurRadius: 4.0,
                                      color: Color(0x33000000),
                                      offset: Offset(
                                        0.0,
                                        2.0,
                                      ),
                                    )
                                  ],
                                  borderRadius: BorderRadius.circular(6.0),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.all(16.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 4.0),
                                        child: Text(
                                          'Overview',
                                          style: FlutterFlowTheme.of(context)
                                              .brandStandardBold
                                              .override(
                                                font: GoogleFonts.inter(
                                                  fontWeight: FontWeight.bold,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .brandStandardBold
                                                          .fontStyle,
                                                ),
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .brandTextStandard,
                                                fontSize: 20.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.bold,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .brandStandardBold
                                                        .fontStyle,
                                              ),
                                        ),
                                      ),
                                      Text(
                                        'Personal finance is the management of your money and financial decisions. It encompasses budgeting, saving, investing, and planning for your financial future. Understanding these concepts is crucial for achieving financial stability and reaching your long-term goals.\nThis chapter introduces the key concepts and metrics that help investors understand how companies perform in the stock market. You’ll explore how market capitalization classifies companies by size, learn the main types of stocks such as blue chip, growth, dividend, value, and cyclical, and discover why stock splits happen. You’ll also get familiar with essential financial ratios and terms like P/E ratio, ROE, profit margin, and debt-to-equity that reveal a company’s profitability, efficiency, and overall strength.',
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
                                              color:
                                                  FlutterFlowTheme.of(context)
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
                                              lineHeight: 1.5,
                                            ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(20.0),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(8.0),
                                  border: Border.all(
                                    color: Color(0xFFEDE8DF),
                                    width: 1.0,
                                  ),
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(8.0),
                                  child: Image.asset(
                                    'assets/images/chapter2_metrics.jpg',
                                    width: 700.0,
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(20.0),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  boxShadow: [
                                    BoxShadow(
                                      blurRadius: 4.0,
                                      color: Color(0x33000000),
                                      offset: Offset(
                                        0.0,
                                        2.0,
                                      ),
                                    )
                                  ],
                                  borderRadius: BorderRadius.circular(6.0),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.all(16.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 4.0),
                                        child: Text(
                                          'Market Capitalization ',
                                          textAlign: TextAlign.start,
                                          style: FlutterFlowTheme.of(context)
                                              .brandStandardBold
                                              .override(
                                                font: GoogleFonts.inter(
                                                  fontWeight: FontWeight.bold,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .brandStandardBold
                                                          .fontStyle,
                                                ),
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .brandTextStandard,
                                                fontSize: 20.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.bold,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .brandStandardBold
                                                        .fontStyle,
                                              ),
                                        ),
                                      ),
                                      RichText(
                                        textScaler:
                                            MediaQuery.of(context).textScaler,
                                        text: TextSpan(
                                          children: [
                                            TextSpan(
                                              text:
                                                  'Market capitalization, or market cap, is the total market value of a publicly traded company\'s outstanding shares (the numbr of shares held by investors). It is calculated by multiplying the current share price by the total number of shares outstanding. It serves as a key metric for assessing a company\'s size and market value, reflecting what investors collectively believe the company is worth. This value is constantly changing as stock prices fluctuate and can be used to categorize companies into large-cap, mid-cap, and small-cap groups based on their size.\n\n',
                                              style: TextStyle(
                                                fontStyle: FontStyle.normal,
                                              ),
                                            ),
                                            TextSpan(
                                              text: 'Small Cap: ',
                                              style: TextStyle(
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                            TextSpan(
                                              text: 'Less than \$2 billion\n',
                                              style: TextStyle(),
                                            ),
                                            TextSpan(
                                              text: 'Mid Cap: ',
                                              style: TextStyle(
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                            TextSpan(
                                              text:
                                                  'Between \$2 billion and \$10 billion.\n',
                                              style: TextStyle(),
                                            ),
                                            TextSpan(
                                              text: 'Large Cap: ',
                                              style: TextStyle(
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                            TextSpan(
                                              text: 'Greater than \$10 billion',
                                              style: TextStyle(),
                                            )
                                          ],
                                          style: FlutterFlowTheme.of(context)
                                              .brandStandard
                                              .override(
                                                font: GoogleFonts.inter(
                                                  fontWeight:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .brandStandard
                                                          .fontWeight,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .brandStandard
                                                          .fontStyle,
                                                ),
                                                color:
                                                    FlutterFlowTheme.of(context)
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
                                                lineHeight: 1.5,
                                              ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(20.0),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Color(0x5B448929),
                                  boxShadow: [
                                    BoxShadow(
                                      blurRadius: 8.0,
                                      color: Color(0x33000000),
                                      offset: Offset(
                                        0.0,
                                        2.0,
                                      ),
                                    )
                                  ],
                                  borderRadius: BorderRadius.circular(8.0),
                                  border: Border.all(
                                    color: Color(0xFF448929),
                                    width: 0.0,
                                  ),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.all(16.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Icon(
                                        Icons.lightbulb_outlined,
                                        color: Color(0xFF1976D2),
                                        size: 30.0,
                                      ),
                                      Column(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 4.0),
                                            child: Text(
                                              'Pro Tip',
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .brandStandardBold
                                                  .override(
                                                    font: GoogleFonts.inter(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .brandStandardBold
                                                              .fontStyle,
                                                    ),
                                                    color: Color(0xFF1976D2),
                                                    fontSize: 20.0,
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.bold,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .brandStandardBold
                                                            .fontStyle,
                                                  ),
                                            ),
                                          ),
                                          RichText(
                                            textScaler: MediaQuery.of(context)
                                                .textScaler,
                                            text: TextSpan(
                                              children: [
                                                TextSpan(
                                                  text:
                                                      'Don’t judge a stock only by its market cap.\nLarge companies tend to be more stable, while smaller ones can grow faster but carry more risk.\n\nMany investors hold a mix of large, mid, and small-cap stocks to stay balanced before exploring different stock styles like blue-chip, growth, and dividend stocks.',
                                                  style: TextStyle(),
                                                )
                                              ],
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .brandStandard
                                                      .override(
                                                        font: GoogleFonts.inter(
                                                          fontWeight:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .brandStandard
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .brandStandard
                                                                  .fontStyle,
                                                        ),
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .brandTextStandard,
                                                        fontSize: 16.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .brandStandard
                                                                .fontWeight,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .brandStandard
                                                                .fontStyle,
                                                      ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ].divide(SizedBox(width: 12.0)),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(20.0),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  boxShadow: [
                                    BoxShadow(
                                      blurRadius: 4.0,
                                      color: Color(0x33000000),
                                      offset: Offset(
                                        0.0,
                                        2.0,
                                      ),
                                    )
                                  ],
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.all(16.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Types of Stocks',
                                        textAlign: TextAlign.start,
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
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              fontSize: 20.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.bold,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .brandStandardBold
                                                      .fontStyle,
                                            ),
                                      ),
                                      Opacity(
                                        opacity: 0.7,
                                        child: Divider(
                                          thickness: 2.0,
                                          color: FlutterFlowTheme.of(context)
                                              .brandTextFade,
                                        ),
                                      ),
                                      RichText(
                                        textScaler:
                                            MediaQuery.of(context).textScaler,
                                        text: TextSpan(
                                          children: [
                                            TextSpan(
                                              text: 'Blue Chip Stocks:',
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    font: GoogleFonts.inter(
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .fontStyle,
                                                    ),
                                                    color: Color(0xFF101518),
                                                    fontSize: 16.0,
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.w600,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontStyle,
                                                    lineHeight: 1.5,
                                                  ),
                                            ),
                                            TextSpan(
                                              text:
                                                  '\nLarge established companies with strong reputations and  reliable performance\n',
                                              style: TextStyle(
                                                fontStyle: FontStyle.normal,
                                              ),
                                            ),
                                            TextSpan(
                                              text: '\nGrowth Stocks:',
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    font: GoogleFonts.inter(
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .fontStyle,
                                                    ),
                                                    color: Color(0xFF101518),
                                                    fontSize: 16.0,
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.w600,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontStyle,
                                                    lineHeight: 1.5,
                                                  ),
                                            ),
                                            TextSpan(
                                              text:
                                                  '\nCompanies expected to grow revenues and profits faster than average. Typically reinvest profits instead of paying dividends.\n',
                                              style: TextStyle(),
                                            ),
                                            TextSpan(
                                              text: '\n Dividend Stocks',
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    font: GoogleFonts.inter(
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .fontStyle,
                                                    ),
                                                    color: Color(0xFF101518),
                                                    fontSize: 16.0,
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.w600,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontStyle,
                                                    lineHeight: 1.5,
                                                  ),
                                            ),
                                            TextSpan(
                                              text:
                                                  '\nPay regular dividends to shareholders. Attractive for income-seeking investors.\n',
                                              style: TextStyle(),
                                            ),
                                            TextSpan(
                                              text: '\nValue Stocks',
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    font: GoogleFonts.inter(
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .fontStyle,
                                                    ),
                                                    color: Color(0xFF101518),
                                                    fontSize: 16.0,
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.w600,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontStyle,
                                                    lineHeight: 1.5,
                                                  ),
                                            ),
                                            TextSpan(
                                              text:
                                                  '\nShares that appear undervalued compared to their fundamentals. Investors buy them expecting prices to rise later.\n',
                                              style: TextStyle(),
                                            ),
                                            TextSpan(
                                              text: '\nCyclical Stocks',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        font: GoogleFonts.inter(
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontStyle,
                                                        ),
                                                        fontSize: 16.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontStyle,
                                                        lineHeight: 1.5,
                                                      ),
                                            ),
                                            TextSpan(
                                              text:
                                                  '\nPerform well when the economy grows and decline during recessions.',
                                              style: TextStyle(),
                                            )
                                          ],
                                          style: FlutterFlowTheme.of(context)
                                              .brandStandard
                                              .override(
                                                font: GoogleFonts.inter(
                                                  fontWeight:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .brandStandard
                                                          .fontWeight,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .brandStandard
                                                          .fontStyle,
                                                ),
                                                color:
                                                    FlutterFlowTheme.of(context)
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
                                                lineHeight: 1.2,
                                              ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(20.0),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  boxShadow: [
                                    BoxShadow(
                                      blurRadius: 4.0,
                                      color: Color(0x33000000),
                                      offset: Offset(
                                        0.0,
                                        2.0,
                                      ),
                                    )
                                  ],
                                  borderRadius: BorderRadius.circular(6.0),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.all(16.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Align(
                                        alignment:
                                            AlignmentDirectional(0.0, 0.0),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                          child: Image.asset(
                                            'assets/images/chapter2_stock_split.webp',
                                            height: 350.0,
                                            fit: BoxFit.contain,
                                          ),
                                        ),
                                      ),
                                      RichText(
                                        textScaler:
                                            MediaQuery.of(context).textScaler,
                                        text: TextSpan(
                                          children: [
                                            TextSpan(
                                              text: 'Stock Split\n',
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .brandStandardBold
                                                  .override(
                                                    font: GoogleFonts.inter(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .brandStandardBold
                                                              .fontStyle,
                                                    ),
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .brandTextStandard,
                                                    fontSize: 20.0,
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.bold,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .brandStandardBold
                                                            .fontStyle,
                                                  ),
                                            ),
                                            TextSpan(
                                              text:
                                                  'A stock split increases the number of shares while reducing the share price proportionally without changing the company’s total value.\nCompany value remains the same.\n',
                                              style: TextStyle(),
                                            ),
                                            TextSpan(
                                              text: '\nPurpose:\n',
                                              style: TextStyle(
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                            TextSpan(
                                              text:
                                                  'Make shares more affordable and attract new investors.\n',
                                              style: TextStyle(),
                                            ),
                                            TextSpan(
                                              text: '\nFor example:\n',
                                              style: TextStyle(
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                            TextSpan(
                                              text:
                                                  'If a stock does a 2-for-1 split at a stock price of \$100, investors get 2 shares for every 1 share held. In other words their shares double. However, the stock price is halved, making it \$50. The market value for the investment remains the same. Holding 1 share at \$100 is equal to owning 2 shares valued at \$50.',
                                              style: TextStyle(),
                                            )
                                          ],
                                          style: FlutterFlowTheme.of(context)
                                              .brandStandard
                                              .override(
                                                font: GoogleFonts.inter(
                                                  fontWeight:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .brandStandard
                                                          .fontWeight,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .brandStandard
                                                          .fontStyle,
                                                ),
                                                color:
                                                    FlutterFlowTheme.of(context)
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
                                                lineHeight: 1.5,
                                              ),
                                        ),
                                      ),
                                      RichText(
                                        textScaler:
                                            MediaQuery.of(context).textScaler,
                                        text: TextSpan(
                                          children: [
                                            TextSpan(
                                              text: 'Reverse Stock Split\n',
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .brandStandardBold
                                                  .override(
                                                    font: GoogleFonts.inter(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .brandStandardBold
                                                              .fontStyle,
                                                    ),
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .brandTextStandard,
                                                    fontSize: 20.0,
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.bold,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .brandStandardBold
                                                            .fontStyle,
                                                  ),
                                            ),
                                            TextSpan(
                                              text:
                                                  'A reverse stock split is the exact opposite. It reduces the number of a company\'s outstanding shares while proportionally increasing the share price, maintaining the company\'s overall market capitalization. It is important to note that a reverse stock split does not create new value for shareholders; the total value of an investor’s holdings remains unchanged similarly to a regular stock split. However, the action often carries a negative market perception, as it can signal financial distress or poor performance, potentially leading to further selling pressure.\n',
                                              style: TextStyle(),
                                            ),
                                            TextSpan(
                                              text: '\nPurpose:\n',
                                              style: TextStyle(
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                            TextSpan(
                                              text:
                                                  'Stock exchanges like the NYSE and Nasdaq require a minimum share price (typically \$4.00) to remain listed. If a stock trades below this threshold for a set period, it risks being delisted, which would reclassify it as a penny stock and reduce liquidity. Many mutual funds and institutional investors have policies against investing in stocks priced below a certain level (e.g., \$5 or \$10), so a reverse split can make the stock eligible for inclusion in their portfolios.\n',
                                              style: TextStyle(),
                                            ),
                                            TextSpan(
                                              text: '\nFor example:\n',
                                              style: TextStyle(
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                            TextSpan(
                                              text:
                                                  'If a stock announces a 1-for-2 reverse split at a stock price of \$50, investors get 0.5 shares for every 1 share held. In other words their shares get halved. However, the stock price is doubled, making it \$200. The market value for the investment remains the same. Holding 1 share at \$50 is equal to owning 0.5 shares valued at \$100.',
                                              style: TextStyle(),
                                            )
                                          ],
                                          style: FlutterFlowTheme.of(context)
                                              .brandStandard
                                              .override(
                                                font: GoogleFonts.inter(
                                                  fontWeight:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .brandStandard
                                                          .fontWeight,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .brandStandard
                                                          .fontStyle,
                                                ),
                                                color:
                                                    FlutterFlowTheme.of(context)
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
                                                lineHeight: 1.5,
                                              ),
                                        ),
                                      ),
                                    ].divide(SizedBox(height: 8.0)),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  20.0, 20.0, 20.0, 20.0),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  boxShadow: [
                                    BoxShadow(
                                      blurRadius: 4.0,
                                      color: Color(0x33000000),
                                      offset: Offset(
                                        0.0,
                                        2.0,
                                      ),
                                      spreadRadius: 0.0,
                                    )
                                  ],
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16.0, 16.0, 16.0, 16.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.all(12.0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'What is a Dividend?',
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .brandStandardBold
                                                  .override(
                                                    font: GoogleFonts.inter(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .brandStandardBold
                                                              .fontStyle,
                                                    ),
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .brandTextStandard,
                                                    fontSize: 20.0,
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.bold,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .brandStandardBold
                                                            .fontStyle,
                                                  ),
                                            ),
                                            Text(
                                              'A dividend is a payment made by a company to its shareholders out of its profits (or sometimes retained earnings). It\'s a way for the company to return some of its earnings directly to investors. Dividends are most often paid in cash on a regular schedule, usually quarterly, though some companies pay annually, semi-annually, or even monthly. Not all companies pay dividends. Many growth-focused ones reinvest all profits back into the business instead.',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .brandStandard
                                                      .override(
                                                        font: GoogleFonts.inter(
                                                          fontWeight:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .brandStandard
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .brandStandard
                                                                  .fontStyle,
                                                        ),
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .brandTextStandard,
                                                        fontSize: 16.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .brandStandard
                                                                .fontWeight,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .brandStandard
                                                                .fontStyle,
                                                      ),
                                            ),
                                          ].divide(SizedBox(height: 8.0)),
                                        ),
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .brandSecondaryBackground,
                                          borderRadius:
                                              BorderRadius.circular(12.0),
                                          border: Border.all(
                                            width: 1.0,
                                          ),
                                        ),
                                        child: Padding(
                                          padding: EdgeInsets.all(12.0),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'Key Dividend Metrics',
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .brandStandardBold
                                                    .override(
                                                      font: GoogleFonts.inter(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .brandStandardBold
                                                                .fontStyle,
                                                      ),
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .brandTextStandard,
                                                      fontSize: 20.0,
                                                      letterSpacing: 0.0,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .brandStandardBold
                                                              .fontStyle,
                                                    ),
                                              ),
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Expanded(
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          'Dividend Yield -',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .labelLarge
                                                              .override(
                                                                font:
                                                                    GoogleFonts
                                                                        .inter(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelLarge
                                                                      .fontStyle,
                                                                ),
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryText,
                                                                fontSize: 18.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelLarge
                                                                    .fontStyle,
                                                              ),
                                                        ),
                                                        Text(
                                                          'This tells you how much cash income you get from dividends compared to the stock\'s price, shown as a percentage.\nCalculated by dividing the Annual Dividend Per Share by the current Stock Price. It\'s like the \"interest rate\" you earn just from dividends. Higher yield can mean good income, but very high yields sometimes signal risk (like a falling stock price).',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .brandStandard
                                                              .override(
                                                                font:
                                                                    GoogleFonts
                                                                        .inter(
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .brandStandard
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .brandStandard
                                                                      .fontStyle,
                                                                ),
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .brandTextStandard,
                                                                fontSize: 16.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight: FlutterFlowTheme.of(
                                                                        context)
                                                                    .brandStandard
                                                                    .fontWeight,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .brandStandard
                                                                    .fontStyle,
                                                              ),
                                                        ),
                                                      ].divide(SizedBox(
                                                          height: 4.0)),
                                                    ),
                                                  ),
                                                  Expanded(
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  4.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.min,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                            'Dividend Per Share -',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .labelLarge
                                                                .override(
                                                                  font:
                                                                      GoogleFonts
                                                                          .inter(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelLarge
                                                                        .fontStyle,
                                                                  ),
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryText,
                                                                  fontSize:
                                                                      18.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelLarge
                                                                      .fontStyle,
                                                                ),
                                                          ),
                                                          Text(
                                                            'This is the actual amount of money the company pays out for each share you own.\nExample:\nIf a company declares a \$0.50 dividend per share and you own 100 shares, you\'ll get \$50 total. Assuming it\'s paid quarterly (every 3 months), a company might pay \$0.50 four times a year for an annual total of \$2.00 per share.',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .brandStandard
                                                                .override(
                                                                  font:
                                                                      GoogleFonts
                                                                          .inter(
                                                                    fontWeight: FlutterFlowTheme.of(
                                                                            context)
                                                                        .brandStandard
                                                                        .fontWeight,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .brandStandard
                                                                        .fontStyle,
                                                                  ),
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .brandTextStandard,
                                                                  fontSize:
                                                                      16.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .brandStandard
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .brandStandard
                                                                      .fontStyle,
                                                                ),
                                                          ),
                                                        ].divide(SizedBox(
                                                            height: 4.0)),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Expanded(
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          'Dividend Date -',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .labelLarge
                                                              .override(
                                                                font:
                                                                    GoogleFonts
                                                                        .inter(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelLarge
                                                                      .fontStyle,
                                                                ),
                                                                fontSize: 18.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelLarge
                                                                    .fontStyle,
                                                              ),
                                                        ),
                                                        Text(
                                                          'The payment date or payable date is the exact day when the dividend money actually lands in your brokerage account. Companies announce it in advance so you know when to expect the cash.',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .brandStandard
                                                              .override(
                                                                font:
                                                                    GoogleFonts
                                                                        .inter(
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .brandStandard
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .brandStandard
                                                                      .fontStyle,
                                                                ),
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .brandTextStandard,
                                                                fontSize: 16.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight: FlutterFlowTheme.of(
                                                                        context)
                                                                    .brandStandard
                                                                    .fontWeight,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .brandStandard
                                                                    .fontStyle,
                                                              ),
                                                        ),
                                                      ].divide(SizedBox(
                                                          height: 4.0)),
                                                    ),
                                                  ),
                                                  Expanded(
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  4.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.min,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                            'Ex-Dividend Date -',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .labelLarge
                                                                .override(
                                                                  font:
                                                                      GoogleFonts
                                                                          .inter(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelLarge
                                                                        .fontStyle,
                                                                  ),
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryText,
                                                                  fontSize:
                                                                      18.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelLarge
                                                                      .fontStyle,
                                                                ),
                                                          ),
                                                          Text(
                                                            'If you buy BEFORE the ex-dividend date, you will get the dividend on the payment date.\nExample: If the ex-date is Monday, buy by Friday\'s close to qualify. ',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .brandStandard
                                                                .override(
                                                                  font:
                                                                      GoogleFonts
                                                                          .inter(
                                                                    fontWeight: FlutterFlowTheme.of(
                                                                            context)
                                                                        .brandStandard
                                                                        .fontWeight,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .brandStandard
                                                                        .fontStyle,
                                                                  ),
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .brandTextStandard,
                                                                  fontSize:
                                                                      16.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .brandStandard
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .brandStandard
                                                                      .fontStyle,
                                                                ),
                                                          ),
                                                        ].divide(SizedBox(
                                                            height: 4.0)),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ].divide(SizedBox(height: 12.0)),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                          color: Color(0xCBEEAC60),
                                          borderRadius:
                                              BorderRadius.circular(12.0),
                                          border: Border.all(
                                            width: 1.0,
                                          ),
                                        ),
                                        child: Padding(
                                          padding: EdgeInsets.all(12.0),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'Important Notes',
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .brandStandardBold
                                                    .override(
                                                      font: GoogleFonts.inter(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .brandStandardBold
                                                                .fontStyle,
                                                      ),
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .brandTextStandard,
                                                      fontSize: 16.0,
                                                      letterSpacing: 0.0,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .brandStandardBold
                                                              .fontStyle,
                                                    ),
                                              ),
                                              Text(
                                                '• You must own the shares before the ex-dividend date to receive the dividend',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .brandStandard
                                                        .override(
                                                          font:
                                                              GoogleFonts.inter(
                                                            fontWeight:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .brandStandard
                                                                    .fontWeight,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .brandStandard
                                                                    .fontStyle,
                                                          ),
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .brandTextStandard,
                                                          fontSize: 16.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .brandStandard
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .brandStandard
                                                                  .fontStyle,
                                                        ),
                                              ),
                                              Text(
                                                '• Use DRIP (Dividend Reinvestment Plans) to automatically buy more shares with your dividends. Over time, this can massively grow your investment through compounding.',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .brandStandard
                                                        .override(
                                                          font:
                                                              GoogleFonts.inter(
                                                            fontWeight:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .brandStandard
                                                                    .fontWeight,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .brandStandard
                                                                    .fontStyle,
                                                          ),
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .brandTextStandard,
                                                          fontSize: 16.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .brandStandard
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .brandStandard
                                                                  .fontStyle,
                                                        ),
                                              ),
                                              Text(
                                                '• Companies may increase, decrease, or suspend dividends at any time',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .brandStandard
                                                        .override(
                                                          font:
                                                              GoogleFonts.inter(
                                                            fontWeight:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .brandStandard
                                                                    .fontWeight,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .brandStandard
                                                                    .fontStyle,
                                                          ),
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .brandTextStandard,
                                                          fontSize: 16.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .brandStandard
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .brandStandard
                                                                  .fontStyle,
                                                        ),
                                              ),
                                              Text(
                                                '• Dividends are typically taxable income for shareholders',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .brandStandard
                                                        .override(
                                                          font:
                                                              GoogleFonts.inter(
                                                            fontWeight:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .brandStandard
                                                                    .fontWeight,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .brandStandard
                                                                    .fontStyle,
                                                          ),
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .brandTextStandard,
                                                          fontSize: 16.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .brandStandard
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .brandStandard
                                                                  .fontStyle,
                                                        ),
                                              ),
                                            ].divide(SizedBox(height: 8.0)),
                                          ),
                                        ),
                                      ),
                                    ].divide(SizedBox(height: 16.0)),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(20.0),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  boxShadow: [
                                    BoxShadow(
                                      blurRadius: 4.0,
                                      color: Color(0x33000000),
                                      offset: Offset(
                                        0.0,
                                        2.0,
                                      ),
                                    )
                                  ],
                                  borderRadius: BorderRadius.circular(6.0),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.all(16.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 4.0),
                                        child: Text(
                                          'Other Key Metrics',
                                          textAlign: TextAlign.start,
                                          style: FlutterFlowTheme.of(context)
                                              .brandStandardBold
                                              .override(
                                                font: GoogleFonts.inter(
                                                  fontWeight: FontWeight.bold,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .brandStandardBold
                                                          .fontStyle,
                                                ),
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .brandTextStandard,
                                                fontSize: 20.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.bold,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .brandStandardBold
                                                        .fontStyle,
                                              ),
                                        ),
                                      ),
                                      RichText(
                                        textScaler:
                                            MediaQuery.of(context).textScaler,
                                        text: TextSpan(
                                          children: [
                                            TextSpan(
                                              text: 'Share Price:\n',
                                              style: TextStyle(
                                                fontWeight: FontWeight.w600,
                                                decoration:
                                                    TextDecoration.underline,
                                              ),
                                            ),
                                            TextSpan(
                                              text:
                                                  'This is simply the current price at which one share of a company\'s stock is being bought or sold on the stock exchange. For example, if Apple\'s stock price is \$150, that\'s what you\'d pay for one share right now.',
                                              style: TextStyle(),
                                            ),
                                            TextSpan(
                                              text: '\nBid:\n',
                                              style: TextStyle(
                                                fontWeight: FontWeight.w600,
                                                decoration:
                                                    TextDecoration.underline,
                                              ),
                                            ),
                                            TextSpan(
                                              text:
                                                  'The bid is the highest price a buyer is willing to pay for a share of stock at a given moment.',
                                              style: TextStyle(),
                                            ),
                                            TextSpan(
                                              text: '\nAsk:\n',
                                              style: TextStyle(
                                                fontWeight: FontWeight.w600,
                                                decoration:
                                                    TextDecoration.underline,
                                              ),
                                            ),
                                            TextSpan(
                                              text:
                                                  'The ask (or offer) is the lowest price a seller is willing to accept for a share.',
                                              style: TextStyle(),
                                            ),
                                            TextSpan(
                                              text:
                                                  '\nSpread (Bid-Ask Spread):\n',
                                              style: TextStyle(
                                                fontWeight: FontWeight.w600,
                                                decoration:
                                                    TextDecoration.underline,
                                              ),
                                            ),
                                            TextSpan(
                                              text:
                                                  'The difference between the highest price a buyer is willing to pay (bid) and the lowest price a seller will accept (ask). It\'s like the \"fee\" you pay to trade instantly. Narrow spreads (a low difference between bid/ask) mean high liquidity and low cost. Wide spreads (high difference between bid/ask) mean higher cost and risk of slippage. Market makers profit from this spread while providing liquidity.',
                                              style: TextStyle(),
                                            ),
                                            TextSpan(
                                              text: '\nLiquidity:\n',
                                              style: TextStyle(
                                                fontWeight: FontWeight.w600,
                                                decoration:
                                                    TextDecoration.underline,
                                              ),
                                            ),
                                            TextSpan(
                                              text:
                                                  'This is how easily you can buy or sell a stock without causing a big change in its price. Highly liquid means you can quickly turn an asset (stock, gold, real estate, cash, etc.) into something else at a fair price. High liquidity comes from lots of buyers and sellers (high trading volume), tight bid-ask spreads, and minimal \"slippage\" (getting a worse price than expected). Popular stocks like Apple are super liquid. while obscure small ones might not be. With low liquidity, you could struggle to sell quickly without dropping the price.',
                                              style: TextStyle(),
                                            ),
                                            TextSpan(
                                              text: '\nAverage Volume:\n',
                                              style: TextStyle(
                                                fontWeight: FontWeight.w600,
                                                decoration:
                                                    TextDecoration.underline,
                                              ),
                                            ),
                                            TextSpan(
                                              text:
                                                  'The average number of shares traded daily over a period (such as daily, weekly, three months). High volume means the stock is popular and easy to buy/sell without big price swings.\n',
                                              style: TextStyle(),
                                            ),
                                            TextSpan(
                                              text: '\nShares Outstanding:\n',
                                              style: TextStyle(
                                                fontWeight: FontWeight.w600,
                                                decoration:
                                                    TextDecoration.underline,
                                              ),
                                            ),
                                            TextSpan(
                                              text:
                                                  'The total number of shares a company has issued and are held by investors (including the public, insiders, and institutions). It helps you to understand the company\'s size. If a company has 1 billion shares outstanding, that\'s the full pool available.',
                                              style: TextStyle(),
                                            ),
                                            TextSpan(
                                              text: '\nFloat:\n',
                                              style: TextStyle(
                                                fontWeight: FontWeight.w600,
                                                decoration:
                                                    TextDecoration.underline,
                                              ),
                                            ),
                                            TextSpan(
                                              text:
                                                  'The number of shares actually available for public trading (excluding locked-up insider or restricted shares). Low float means fewer shares circulating, which can amplify volatility. A small rush of buying can skyrocket the price (or selling can crash it). High float is more stable, like big companies with billions of shares out there.\n',
                                              style: TextStyle(),
                                            ),
                                            TextSpan(
                                              text: '\nOperating Cash Flow:\n',
                                              style: TextStyle(
                                                fontWeight: FontWeight.w600,
                                                decoration:
                                                    TextDecoration.underline,
                                              ),
                                            ),
                                            TextSpan(
                                              text:
                                                  'Cash generated from core business operations (sales minus operating expenses). Positive flow means the business is self-sustaining without borrowing—crucial for long-term health.',
                                              style: TextStyle(),
                                            ),
                                            TextSpan(
                                              text: '\nFree Cash Flow:\n',
                                              style: TextStyle(
                                                fontWeight: FontWeight.w600,
                                                decoration:
                                                    TextDecoration.underline,
                                              ),
                                            ),
                                            TextSpan(
                                              text:
                                                  'Operating cash flow minus capital expenditures (money spent on assets like equipment). It\'s the cash left for dividends, buybacks, or growth. Positive and growing is a good sign for strong companies.\n',
                                              style: TextStyle(),
                                            ),
                                            TextSpan(
                                              text: '\nRevenue:\n',
                                              style: TextStyle(
                                                fontWeight: FontWeight.w600,
                                                decoration:
                                                    TextDecoration.underline,
                                              ),
                                            ),
                                            TextSpan(
                                              text:
                                                  'Total money a company brings in from sales before any expenses. Like gross income on your paycheck— the top line that shows business scale.',
                                              style: TextStyle(),
                                            ),
                                            TextSpan(
                                              text: '\nGross Profit:\n',
                                              style: TextStyle(
                                                fontWeight: FontWeight.w600,
                                                decoration:
                                                    TextDecoration.underline,
                                              ),
                                            ),
                                            TextSpan(
                                              text:
                                                  'Revenue minus the cost of goods sold (direct costs like materials and labor). It\'s the profit before overhead expenses like rent or marketing. Helps see if the core business is efficient.',
                                              style: TextStyle(),
                                            ),
                                            TextSpan(
                                              text: '\nEBITDA:\n',
                                              style: TextStyle(
                                                fontWeight: FontWeight.w600,
                                                decoration:
                                                    TextDecoration.underline,
                                              ),
                                            ),
                                            TextSpan(
                                              text:
                                                  'Stands for Earnings Before Interest, Taxes, Depreciation, and Amortization. It\'s a measure of a company\'s operating profit, ignoring non-cash expenses and financing costs. Like checking a business\'s core cash flow from operations without the \"extras.\" Useful for comparing companies across industries.',
                                              style: TextStyle(),
                                            ),
                                            TextSpan(
                                              text: '\nProfit Margin:\n',
                                              style: TextStyle(
                                                fontWeight: FontWeight.w600,
                                                decoration:
                                                    TextDecoration.underline,
                                              ),
                                            ),
                                            TextSpan(
                                              text:
                                                  'Net income divided by revenue, as a percentage. Shows how much of every dollar in sales turns into profit after all expenses. A 20% margin means 20 cents profit per dollar—higher is better, but varies by industry (tech is usually high, while retail low).',
                                              style: TextStyle(),
                                            ),
                                            TextSpan(
                                              text:
                                                  '\nEarnings per Share (EPS):\n',
                                              style: TextStyle(
                                                fontWeight: FontWeight.w600,
                                                decoration:
                                                    TextDecoration.underline,
                                              ),
                                            ),
                                            TextSpan(
                                              text:
                                                  'Net income divided by shares outstanding. Tells you the profit allocated to each share. If EPS is \$5, the company made \$5 profit per share—key for valuation ratios like P/E.',
                                              style: TextStyle(),
                                            ),
                                            TextSpan(
                                              text: '\nRevenue Per Share:\n',
                                              style: TextStyle(
                                                fontWeight: FontWeight.w600,
                                                decoration:
                                                    TextDecoration.underline,
                                              ),
                                            ),
                                            TextSpan(
                                              text:
                                                  'Total revenue divided by shares outstanding. Similar to EPS but for sales, showing sales efficiency per share.',
                                              style: TextStyle(),
                                            ),
                                            TextSpan(
                                              text:
                                                  '\nReturn on Equity (ROE):\n',
                                              style: TextStyle(
                                                fontWeight: FontWeight.w600,
                                                decoration:
                                                    TextDecoration.underline,
                                              ),
                                            ),
                                            TextSpan(
                                              text:
                                                  'Net income divided by shareholders\' equity, as a percentage. Measures how well the company uses investors\' money to generate profits. A 15% ROE means \$15 profit per \$100 of equity—higher indicates efficient management.\n',
                                              style: TextStyle(),
                                            ),
                                            TextSpan(
                                              text: '\nQuarter:\n',
                                              style: TextStyle(
                                                fontWeight: FontWeight.w600,
                                                decoration:
                                                    TextDecoration.underline,
                                              ),
                                            ),
                                            TextSpan(
                                              text:
                                                  'In stock reports, a quarter (or fiscal quarter) is a three-month period in a company\'s financial year (there are four: Q1, Q2, Q3, Q4). Companies release earnings reports quarterly, showing revenue, profits, etc., for that period. It\'s like a progress report card—investors watch for beats/misses vs. expectations, which can move the stock price.',
                                              style: TextStyle(),
                                            ),
                                            TextSpan(
                                              text:
                                                  '\nQuarterly Revenue Growth:\n',
                                              style: TextStyle(
                                                fontWeight: FontWeight.w600,
                                                decoration:
                                                    TextDecoration.underline,
                                              ),
                                            ),
                                            TextSpan(
                                              text:
                                                  'The percentage change in revenue compared to the same quarter last year. Positive growth (e.g., 10%) means the company is expanding sales.',
                                              style: TextStyle(),
                                            ),
                                            TextSpan(
                                              text:
                                                  '\nQuarterly Earnings Growth:\n',
                                              style: TextStyle(
                                                fontWeight: FontWeight.w600,
                                                decoration:
                                                    TextDecoration.underline,
                                              ),
                                            ),
                                            TextSpan(
                                              text:
                                                  'Percentage change in EPS from the same quarter last year. Like revenue growth but for profits—signals if the company is becoming more profitable.',
                                              style: TextStyle(),
                                            ),
                                            TextSpan(
                                              text: '\nYear-Over-Year (YoY):\n',
                                              style: TextStyle(
                                                fontWeight: FontWeight.w600,
                                                decoration:
                                                    TextDecoration.underline,
                                              ),
                                            ),
                                            TextSpan(
                                              text:
                                                  'This is used when comparing a metric (like revenue or earnings) from one period to the exact same time period last year. It filters out seasonal effects (e.g., holiday sales boosts) for a clearer growth picture. Positive YoY means improving; negative means declining. Often shown as a percentage.\n',
                                              style: TextStyle(),
                                            ),
                                            TextSpan(
                                              text:
                                                  '\nPrice-to-Earnings (P/E) Ratio:\n',
                                              style: TextStyle(
                                                fontWeight: FontWeight.w600,
                                                decoration:
                                                    TextDecoration.underline,
                                              ),
                                            ),
                                            TextSpan(
                                              text:
                                                  'This is the stock price divided by the company\'s earnings per share (EPS). It tells you how much investors are paying for each dollar of profit. A P/E of 20 means you\'re paying \$20 for \$1 of earnings. Lower P/E might suggest a bargain, but it depends on the industry—tech stocks often have higher P/Es because of growth potential.',
                                              style: TextStyle(),
                                            ),
                                            TextSpan(
                                              text: '\nTrailling PE:\n',
                                              style: TextStyle(
                                                fontWeight: FontWeight.w600,
                                                decoration:
                                                    TextDecoration.underline,
                                              ),
                                            ),
                                            TextSpan(
                                              text:
                                                  'Trailing P/E uses the past year\'s earnings (historical data).',
                                              style: TextStyle(),
                                            ),
                                            TextSpan(
                                              text: '\nForward PE:\n',
                                              style: TextStyle(
                                                fontWeight: FontWeight.w600,
                                                decoration:
                                                    TextDecoration.underline,
                                              ),
                                            ),
                                            TextSpan(
                                              text:
                                                  'Forward P/E uses estimated future earnings (a prediction).',
                                              style: TextStyle(),
                                            ),
                                            TextSpan(
                                              text: '\nPEG Ratio:\n',
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                decoration:
                                                    TextDecoration.underline,
                                              ),
                                            ),
                                            TextSpan(
                                              text:
                                                  'This is P/E divided by the expected earnings growth rate. It adjusts P/E for growth— a PEG under 1 might indicate a good deal for a fast-growing company. Think of it as P/E with a \"growth discount\": high growth justifies a higher P/E.',
                                              style: TextStyle(),
                                            ),
                                            TextSpan(
                                              text:
                                                  '\nPrice-to-Sales (P/S) Ratio:\n',
                                              style: TextStyle(
                                                fontWeight: FontWeight.w600,
                                                decoration:
                                                    TextDecoration.underline,
                                              ),
                                            ),
                                            TextSpan(
                                              text:
                                                  'Stock price divided by revenue per share. Useful for companies not yet profitable (like startups), as it focuses on sales rather than earnings. A low P/S might mean the stock is undervalued if sales are strong.',
                                              style: TextStyle(),
                                            ),
                                            TextSpan(
                                              text:
                                                  '\nPrice-to-Book (P/B) Ratio:\n',
                                              style: TextStyle(
                                                fontWeight: FontWeight.w600,
                                                decoration:
                                                    TextDecoration.underline,
                                              ),
                                            ),
                                            TextSpan(
                                              text:
                                                  'Stock price divided by the book value per share (assets minus liabilities). It\'s like comparing the market price to the company\'s net worth on paper. A P/B under 1 could mean the stock is trading below its \"break-up value,\" but it\'s more relevant for asset-heavy industries like banking.',
                                              style: TextStyle(),
                                            ),
                                            TextSpan(
                                              text: '\nBook Value:\n',
                                              style: TextStyle(
                                                fontWeight: FontWeight.w600,
                                                decoration:
                                                    TextDecoration.underline,
                                              ),
                                            ),
                                            TextSpan(
                                              text:
                                                  'Book value (also called shareholders\' equity or net book value) is the value of a company according to its accounting records. Basically, what would be left for shareholders if the company sold all its assets and paid off all its debts right now.\n',
                                              style: TextStyle(),
                                            ),
                                            TextSpan(
                                              text: '\nBeta:\n',
                                              style: TextStyle(
                                                fontWeight: FontWeight.w600,
                                                decoration:
                                                    TextDecoration.underline,
                                              ),
                                            ),
                                            TextSpan(
                                              text:
                                                  'Measures how much a stock moves compared to the overall market (usually the S&P 500, where beta = 1). A beta of 1.5 means the stock is 50% more volatile—if the market rises 10%, the stock might rise 15%. Low beta (under 1) is steadier, like a calm boat. High beta is more volatile.',
                                              style: TextStyle(),
                                            ),
                                            TextSpan(
                                              text: '\nVolatility:\n',
                                              style: TextStyle(
                                                fontWeight: FontWeight.w600,
                                                decoration:
                                                    TextDecoration.underline,
                                              ),
                                            ),
                                            TextSpan(
                                              text:
                                                  'This measures how much a stock\'s price swings up and down over time. High volatility means big, frequent price jumps (risky but potentially rewarding); low volatility is steadier (calmer ride). It\'s often tied to uncertainty, news, or market events. For example, tech stocks can be volatile due to rapid changes in sentiment.\n',
                                              style: TextStyle(),
                                            ),
                                            TextSpan(
                                              text: '\nDebt:\n',
                                              style: TextStyle(
                                                fontWeight: FontWeight.w600,
                                                decoration:
                                                    TextDecoration.underline,
                                              ),
                                            ),
                                            TextSpan(
                                              text:
                                                  'The total money a company owes to lenders (banks, bondholders, etc.). It includes short-term debt (due soon, like bills) and long-term debt (like loans over years). High debt isn\'t always bad as many companies use it to expand. However, it\'s risky if they can\'t pay it back. A better measure than total debt is net debt. It\'s the total debt minus cash and cash equivalents the company has on hand. Negative net debt means the company has more cash than debt.',
                                              style: TextStyle(),
                                            )
                                          ],
                                          style: FlutterFlowTheme.of(context)
                                              .brandStandard
                                              .override(
                                                font: GoogleFonts.inter(
                                                  fontWeight:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .brandStandard
                                                          .fontWeight,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .brandStandard
                                                          .fontStyle,
                                                ),
                                                color:
                                                    FlutterFlowTheme.of(context)
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
                                                lineHeight: 1.5,
                                              ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                    color: Color(0xFFEDE8DF),
                    width: 1.0,
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      FFButtonWidget(
                        onPressed: () async {
                          context.pushNamed(Chapter1Widget.routeName);
                        },
                        text: 'Previous',
                        options: FFButtonOptions(
                          height: 40.0,
                          padding: EdgeInsetsDirectional.fromSTEB(
                              16.0, 0.0, 16.0, 0.0),
                          iconPadding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: Color(0xFFF0F0F0),
                          textStyle: FlutterFlowTheme.of(context)
                              .titleSmall
                              .override(
                                font: GoogleFonts.inter(
                                  fontWeight: FontWeight.w500,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .fontStyle,
                                ),
                                color:
                                    FlutterFlowTheme.of(context).brandTextFade,
                                fontSize: 16.0,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.w500,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .fontStyle,
                              ),
                          elevation: 0.0,
                          borderSide: BorderSide(
                            color: Colors.transparent,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                      FFButtonWidget(
                        onPressed: () async {
                          context.pushNamed(Chapter3Widget.routeName);
                        },
                        text: 'Next Lesson',
                        options: FFButtonOptions(
                          height: 40.0,
                          padding: EdgeInsetsDirectional.fromSTEB(
                              16.0, 0.0, 16.0, 0.0),
                          iconPadding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: Color(0xFF448929),
                          textStyle:
                              FlutterFlowTheme.of(context).titleSmall.override(
                                    font: GoogleFonts.inter(
                                      fontWeight: FontWeight.w500,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .fontStyle,
                                    ),
                                    color: Colors.white,
                                    fontSize: 16.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w500,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .fontStyle,
                                  ),
                          elevation: 0.0,
                          borderSide: BorderSide(
                            color: Colors.transparent,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
