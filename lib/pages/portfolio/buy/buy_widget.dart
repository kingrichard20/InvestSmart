import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_charts.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/index.dart';
import 'package:collection/collection.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'buy_model.dart';
export 'buy_model.dart';

/// Create a page for buying different financial assets.
///
/// When loading, a pop up should allow the user to search for and select an
/// asset to buy. Once choosen, it should display info about that asset chosen
/// and fields to accept information such as the number of shares to buy and
/// any other relavant info. An output of the total cost should also be
/// diaplayed. Finally, it should include a buy button at the bottom.
class BuyWidget extends StatefulWidget {
  const BuyWidget({
    super.key,
    required this.ticker,
  });

  final String? ticker;

  static String routeName = 'Buy';
  static String routePath = '/buy';

  @override
  State<BuyWidget> createState() => _BuyWidgetState();
}

class _BuyWidgetState extends State<BuyWidget> {
  late BuyModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BuyModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'Buy'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.assetInfo = await GetAssetInfoCall.call(
        companyTicker: widget.ticker,
      );

      if ((_model.assetInfo?.succeeded ?? true)) {
        if ((_model.assetInfo?.bodyText ?? '') != '{}') {
          _model.ticker = widget.ticker!;
          _model.name = GetAssetInfoCall.name(
            (_model.assetInfo?.jsonBody ?? ''),
          )!;
          _model.description = GetAssetInfoCall.description(
            (_model.assetInfo?.jsonBody ?? ''),
          )!;
          _model.assetType = GetAssetInfoCall.assetType(
            (_model.assetInfo?.jsonBody ?? ''),
          )!;
          _model.sector = GetAssetInfoCall.sector(
            (_model.assetInfo?.jsonBody ?? ''),
          )!;
          _model.industry = GetAssetInfoCall.industry(
            (_model.assetInfo?.jsonBody ?? ''),
          )!;
          _model.marketCap = GetAssetInfoCall.marketCap(
            (_model.assetInfo?.jsonBody ?? ''),
          )!;
          _model.pegRatio = GetAssetInfoCall.pEGRatio(
            (_model.assetInfo?.jsonBody ?? ''),
          )!;
          _model.eps = GetAssetInfoCall.earningsPerShare(
            (_model.assetInfo?.jsonBody ?? ''),
          )!;
          _model.forwardPE = GetAssetInfoCall.forwardPE(
            (_model.assetInfo?.jsonBody ?? ''),
          )!;
          _model.trailingPE = GetAssetInfoCall.trailingPE(
            (_model.assetInfo?.jsonBody ?? ''),
          )!;
          _model.ebitda = GetAssetInfoCall.ebitda(
            (_model.assetInfo?.jsonBody ?? ''),
          )!;
          _model.revenuePerShare = GetAssetInfoCall.revenuePerShare(
            (_model.assetInfo?.jsonBody ?? ''),
          )!;
          _model.profitMargin = (String margin) {
            return (double.tryParse(margin ?? "0.00") ?? 0.00)
                .toStringAsFixed(2);
          }(GetAssetInfoCall.profitMargin(
            (_model.assetInfo?.jsonBody ?? ''),
          )!);
          _model.revenue = GetAssetInfoCall.revenue(
            (_model.assetInfo?.jsonBody ?? ''),
          )!;
          _model.grossProfit = GetAssetInfoCall.profit(
            (_model.assetInfo?.jsonBody ?? ''),
          )!;
          _model.dividendPerShare = GetAssetInfoCall.dividendPerShare(
            (_model.assetInfo?.jsonBody ?? ''),
          )!;
          _model.dividendYield = GetAssetInfoCall.dividendYield(
            (_model.assetInfo?.jsonBody ?? ''),
          )!;
          _model.dividendDate = GetAssetInfoCall.divPayDate(
            (_model.assetInfo?.jsonBody ?? ''),
          )!;
          _model.exDividendDate = GetAssetInfoCall.divExDate(
            (_model.assetInfo?.jsonBody ?? ''),
          )!;
          _model.quarterlyEarningsGrowth = GetAssetInfoCall.earningsGrowthYOY(
            (_model.assetInfo?.jsonBody ?? ''),
          )!;
          _model.quarterlyRevenueGrowth = GetAssetInfoCall.revenueGrowthYOY(
            (_model.assetInfo?.jsonBody ?? ''),
          )!;
          _model.analystPriceTarget = GetAssetInfoCall.analystPriceTarget(
            (_model.assetInfo?.jsonBody ?? ''),
          )!;
          _model.numberOfRatings = (String strongBuy, String buy, String hold,
                  String sell, String strongSell) {
            return ((int.tryParse(strongBuy ?? '0') ?? 0) +
                    (int.tryParse(buy ?? '0') ?? 0) +
                    (int.tryParse(hold ?? '0') ?? 0) +
                    (int.tryParse(sell ?? '0') ?? 0) +
                    (int.tryParse(strongSell ?? '0') ?? 0))
                .toString();
          }(
              GetAssetInfoCall.strongBuyRating(
                (_model.assetInfo?.jsonBody ?? ''),
              )!,
              GetAssetInfoCall.buyRating(
                (_model.assetInfo?.jsonBody ?? ''),
              )!,
              GetAssetInfoCall.holdRating(
                (_model.assetInfo?.jsonBody ?? ''),
              )!,
              GetAssetInfoCall.sellRating(
                (_model.assetInfo?.jsonBody ?? ''),
              )!,
              GetAssetInfoCall.strongSellRating(
                (_model.assetInfo?.jsonBody ?? ''),
              )!);
          _model.strongBuy = (String rating, String numRatings) {
            return (() {
              final double count = double.tryParse(rating ?? '0') ?? 0.0;
              final double total = double.tryParse(numRatings ?? '0') ?? 0.0;
              return total > 0 ? count / total : 0.0;
            })();
          }(
              GetAssetInfoCall.strongBuyRating(
                (_model.assetInfo?.jsonBody ?? ''),
              )!,
              _model.numberOfRatings);
          _model.buy = (String rating, String numRatings) {
            return (() {
              final double count = double.tryParse(rating ?? '0') ?? 0.0;
              final double total = double.tryParse(numRatings ?? '0') ?? 0.0;
              return total > 0 ? count / total : 0.0;
            })();
          }(
              GetAssetInfoCall.buyRating(
                (_model.assetInfo?.jsonBody ?? ''),
              )!,
              _model.numberOfRatings);
          _model.hold = (String rating, String numRatings) {
            return (() {
              final double count = double.tryParse(rating ?? '0') ?? 0.0;
              final double total = double.tryParse(numRatings ?? '0') ?? 0.0;
              return total > 0 ? count / total : 0.0;
            })();
          }(
              GetAssetInfoCall.holdRating(
                (_model.assetInfo?.jsonBody ?? ''),
              )!,
              _model.numberOfRatings);
          _model.sell = (String rating, String numRatings) {
            return (() {
              final double count = double.tryParse(rating ?? '0') ?? 0.0;
              final double total = double.tryParse(numRatings ?? '0') ?? 0.0;
              return total > 0 ? count / total : 0.0;
            })();
          }(
              GetAssetInfoCall.sellRating(
                (_model.assetInfo?.jsonBody ?? ''),
              )!,
              _model.numberOfRatings);
          _model.strongSell = (String rating, String numRatings) {
            return (() {
              final double count = double.tryParse(rating ?? '0') ?? 0.0;
              final double total = double.tryParse(numRatings ?? '0') ?? 0.0;
              return total > 0 ? count / total : 0.0;
            })();
          }(
              GetAssetInfoCall.strongSellRating(
                (_model.assetInfo?.jsonBody ?? ''),
              )!,
              _model.numberOfRatings);
          _model.beta = (double.tryParse((GetAssetInfoCall.beta(
                    (_model.assetInfo?.jsonBody ?? ''),
                  )!)) ??
                  0.00)
              .toStringAsFixed(2);
          _model.exchange = GetAssetInfoCall.exchange(
            (_model.assetInfo?.jsonBody ?? ''),
          )!;
          _model.float = GetAssetInfoCall.float(
            (_model.assetInfo?.jsonBody ?? ''),
          )!;
          _model.outstandingShares = GetAssetInfoCall.sharesOutstanding(
            (_model.assetInfo?.jsonBody ?? ''),
          )!;
          _model.insiderOwnership = double.tryParse(
                  (double.tryParse((GetAssetInfoCall.insiderOwnership(
                            (_model.assetInfo?.jsonBody ?? ''),
                          )!)) ??
                          0.00)
                      .toStringAsFixed(2)) ??
              0.00;
          _model.institutionalOwnership = double.tryParse(
                  (double.tryParse((GetAssetInfoCall.institutionalOwnership(
                            (_model.assetInfo?.jsonBody ?? ''),
                          )!)) ??
                          0.00)
                      .toStringAsFixed(2)) ??
              0.00;
          _model.reatilOwnership = (double insiders, double institutional) {
            return insiders > 0.0 && institutional > 0.0
                ? (100.00 - insiders - institutional)
                : 0.00;
          }(_model.insiderOwnership, _model.institutionalOwnership);
          _model.fiftyTwoWeekLow = (String low) {
            return (double.tryParse(low ?? "0.00") ?? 0.00).toStringAsFixed(2);
          }(GetAssetInfoCall.fiftyTwoWeekLow(
            (_model.assetInfo?.jsonBody ?? ''),
          )!);
          _model.fiftyTwoWeekHigh = (String high) {
            return (double.tryParse(high ?? "0.00") ?? 0.00).toStringAsFixed(2);
          }(GetAssetInfoCall.fiftyTwoWeekHigh(
            (_model.assetInfo?.jsonBody ?? ''),
          )!);
        } else {
          // API call returns 200 status and succeeds but returns an empty json ("{}"). Occurs when Get Asset Info is given a ticker it does not have info for.
          _model.pageStatus = 'no_asset_info';
          safeSetState(() {});
        }

        await Future.delayed(
          Duration(
            milliseconds: 1000,
          ),
        );
        _model.assetPrice = await GetAssetPriceCall.call(
          companyTicker: widget.ticker,
        );

        if ((_model.assetPrice?.succeeded ?? true)) {
          _model.todaysChange = (String change) {
            return (double.tryParse(change ?? '') ?? 0.0).toStringAsFixed(2);
          }(GetAssetPriceCall.change(
            (_model.assetPrice?.jsonBody ?? ''),
          )!);
          _model.todaysChangePercent = (String percentChange) {
            return (double.tryParse(
                        (percentChange ?? '').replaceAll('%', '')) ??
                    0.0)
                .toStringAsFixed(2);
          }(GetAssetPriceCall.changePercent(
            (_model.assetPrice?.jsonBody ?? ''),
          )!);
          _model.price = (String price) {
            return (double.tryParse(price ?? '') ?? 0.0).toStringAsFixed(2);
          }(GetAssetPriceCall.currentPrice(
            (_model.assetPrice?.jsonBody ?? ''),
          )!);
          _model.pageStatus = 'success';
          safeSetState(() {});
          // Pauses the loaing indicator animation so it doesnt take up any background resources after the page loads.
          safeSetState(() =>
              _model.loadingIndicatorStatus = !_model.loadingIndicatorStatus);
        } else {
          _model.pageStatus = 'error';
          safeSetState(() {});
        }
      } else {
        if ((_model.assetInfo?.statusCode ?? 200) == 400) {
          // API call does not succeed and returns 400 status code. Occurs when Get Asset Info is NOT given a ticker or an invalid input.
          _model.pageStatus = 'error';
          safeSetState(() {});
        } else if ((_model.assetInfo?.statusCode ?? 200) == 500) {
          // API call does not succeed and returns 500 status code. Occurs when Get Asset Info has an error server side.
          _model.pageStatus = 'error';
          safeSetState(() {});
        } else {
          // API call to Get Asset Info returns an unknown error.
          _model.pageStatus = 'error';
          safeSetState(() {});
        }
      }
    });

    _model.sharesToBuyTextController ??= TextEditingController();
    _model.sharesToBuyFocusNode ??= FocusNode();

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
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        drawer: Drawer(
          elevation: 16.0,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                width: MediaQuery.sizeOf(context).width * 1.0,
                height: MediaQuery.sizeOf(context).height * 0.2,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).brandAccent1,
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 80.0,
                      height: 80.0,
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                      ),
                      child: Image.asset(
                        'assets/images/Default_Profile_Image.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AuthUserStreamWidget(
                            builder: (context) => Text(
                              valueOrDefault<String>(
                                currentUserDisplayName,
                                'Username',
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    font: GoogleFonts.inter(
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                                    color: FlutterFlowTheme.of(context)
                                        .brandTextStandard,
                                    letterSpacing: 0.0,
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                            ),
                          ),
                          Text(
                            currentUserEmail,
                            style: FlutterFlowTheme.of(context)
                                .labelMedium
                                .override(
                                  font: GoogleFonts.inter(
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .fontStyle,
                                  ),
                                  color: FlutterFlowTheme.of(context)
                                      .brandTextStandard,
                                  letterSpacing: 0.0,
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .fontStyle,
                                ),
                          ),
                        ]
                            .divide(SizedBox(height: 2.0))
                            .around(SizedBox(height: 2.0)),
                      ),
                    ),
                  ].divide(SizedBox(width: 16.0)).around(SizedBox(width: 16.0)),
                ),
              ),
              Container(
                width: MediaQuery.sizeOf(context).width * 1.0,
                height: MediaQuery.sizeOf(context).height * 0.7,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                ),
                child: ListView(
                  padding: EdgeInsets.zero,
                  scrollDirection: Axis.vertical,
                  children: [
                    Container(
                      decoration: BoxDecoration(
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
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(0.0),
                          bottomRight: Radius.circular(0.0),
                          topLeft: Radius.circular(0.0),
                          topRight: Radius.circular(0.0),
                        ),
                        border: Border.all(
                          color: Colors.black,
                          width: 1.0,
                        ),
                      ),
                      child: InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          context.pushNamed(LessonsWidget.routeName);
                        },
                        child: Material(
                          color: Colors.transparent,
                          child: ListTile(
                            leading: Icon(
                              Icons.menu_book_sharp,
                              color: FlutterFlowTheme.of(context)
                                  .brandTextStandard,
                              size: 25.0,
                            ),
                            title: Text(
                              'Lessons',
                              textAlign: TextAlign.start,
                              style: FlutterFlowTheme.of(context)
                                  .titleLarge
                                  .override(
                                    font: GoogleFonts.inter(
                                      fontWeight: FontWeight.normal,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .titleLarge
                                          .fontStyle,
                                    ),
                                    color: FlutterFlowTheme.of(context)
                                        .brandTextStandard,
                                    fontSize: 20.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.normal,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .titleLarge
                                        .fontStyle,
                                  ),
                            ),
                            tileColor: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            dense: false,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(0.0),
                                bottomRight: Radius.circular(0.0),
                                topLeft: Radius.circular(0.0),
                                topRight: Radius.circular(0.0),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
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
                        border: Border.all(
                          width: 1.0,
                        ),
                      ),
                      child: InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          context.pushNamed(PortfolioWidget.routeName);
                        },
                        child: Material(
                          color: Colors.transparent,
                          child: ListTile(
                            leading: FaIcon(
                              FontAwesomeIcons.chartLine,
                              color: FlutterFlowTheme.of(context)
                                  .brandTextStandard,
                              size: 25.0,
                            ),
                            title: Text(
                              'Portfolio Simulator',
                              style: FlutterFlowTheme.of(context)
                                  .titleLarge
                                  .override(
                                    font: GoogleFonts.inter(
                                      fontWeight: FontWeight.normal,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .titleLarge
                                          .fontStyle,
                                    ),
                                    color: FlutterFlowTheme.of(context)
                                        .brandTextStandard,
                                    fontSize: 20.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.normal,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .titleLarge
                                        .fontStyle,
                                  ),
                            ),
                            tileColor: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            dense: false,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
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
                        border: Border.all(
                          color: Colors.black,
                          width: 1.0,
                        ),
                      ),
                      child: InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          context.pushNamed(ProfileWidget.routeName);
                        },
                        child: Material(
                          color: Colors.transparent,
                          child: ListTile(
                            leading: FaIcon(
                              FontAwesomeIcons.user,
                              color: FlutterFlowTheme.of(context)
                                  .brandTextStandard,
                              size: 25.0,
                            ),
                            title: Text(
                              'Profile',
                              style: FlutterFlowTheme.of(context)
                                  .titleLarge
                                  .override(
                                    font: GoogleFonts.inter(
                                      fontWeight: FontWeight.normal,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .titleLarge
                                          .fontStyle,
                                    ),
                                    color: FlutterFlowTheme.of(context)
                                        .brandTextStandard,
                                    fontSize: 20.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.normal,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .titleLarge
                                        .fontStyle,
                                  ),
                            ),
                            tileColor: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            dense: false,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(0.0),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Opacity(
                opacity: 0.3,
                child: Divider(
                  height: 1.0,
                  thickness: 0.75,
                  color: FlutterFlowTheme.of(context).secondaryText,
                ),
              ),
              Container(
                decoration: BoxDecoration(),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      FFButtonWidget(
                        onPressed: () async {
                          GoRouter.of(context).prepareAuthEvent();
                          await authManager.signOut();
                          GoRouter.of(context).clearRedirectLocation();

                          context.pushNamedAuth(
                              AuthenticationWidget.routeName, context.mounted);
                        },
                        text: 'Logout',
                        options: FFButtonOptions(
                          width: 160.0,
                          height: 64.0,
                          padding: EdgeInsetsDirectional.fromSTEB(
                              16.0, 0.0, 16.0, 0.0),
                          iconPadding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: FlutterFlowTheme.of(context).brandAccent1,
                          textStyle:
                              FlutterFlowTheme.of(context).titleSmall.override(
                                    font: GoogleFonts.inter(
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .fontStyle,
                                    ),
                                    color: FlutterFlowTheme.of(context)
                                        .brandTextStandard,
                                    fontSize: 20.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .fontStyle,
                                  ),
                          elevation: 0.0,
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
          automaticallyImplyLeading: false,
          title: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              FlutterFlowIconButton(
                borderColor: FlutterFlowTheme.of(context).brandTextStandard,
                borderRadius: 20.0,
                borderWidth: 1.0,
                buttonSize: 40.0,
                fillColor: FlutterFlowTheme.of(context).brandAccent1,
                icon: Icon(
                  Icons.arrow_back_rounded,
                  color: FlutterFlowTheme.of(context).primaryText,
                  size: 24.0,
                ),
                onPressed: () async {
                  context.safePop();
                },
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  FlutterFlowIconButton(
                    borderColor: FlutterFlowTheme.of(context).brandTextStandard,
                    borderRadius: 8.0,
                    buttonSize: 40.0,
                    fillColor: FlutterFlowTheme.of(context).brandAccent1,
                    icon: Icon(
                      Icons.search_rounded,
                      color: FlutterFlowTheme.of(context).primaryText,
                      size: 24.0,
                    ),
                    onPressed: () async {
                      context.pushNamed(SearchWidget.routeName);
                    },
                  ),
                  FlutterFlowIconButton(
                    borderColor: FlutterFlowTheme.of(context).brandTextStandard,
                    borderRadius: 8.0,
                    buttonSize: 40.0,
                    fillColor: Color(0xFF93C87E),
                    icon: Icon(
                      Icons.table_rows_rounded,
                      color: FlutterFlowTheme.of(context).brandTextStandard,
                      size: 24.0,
                    ),
                    onPressed: () async {
                      scaffoldKey.currentState!.openDrawer();
                    },
                  ),
                ].divide(SizedBox(width: 12.0)),
              ),
            ],
          ),
          actions: [],
          centerTitle: false,
          elevation: 5.0,
        ),
        body: SafeArea(
          top: true,
          child: Stack(
            children: [
              if (_model.pageStatus == 'error')
                Align(
                  alignment: AlignmentDirectional(0.0, 0.0),
                  child: Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Container(
                      width: 500.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
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
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Error',
                              style: FlutterFlowTheme.of(context)
                                  .titleMedium
                                  .override(
                                    font: GoogleFonts.inter(
                                      fontWeight: FontWeight.w600,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .titleMedium
                                          .fontStyle,
                                    ),
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w600,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .titleMedium
                                        .fontStyle,
                                  ),
                            ),
                            Text(
                              'No price data available for this symbol. This ticker may not be actively traded on major U.S. exchanges or is not supported by our data provider. Try a different ticker or check back later!',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    font: GoogleFonts.inter(
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                                    letterSpacing: 0.0,
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                            ),
                            Text(
                              'Connection error We couldn’t reach the data provider right now.  Please check your internet connection and try again. If the issue still persists, try again later.',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    font: GoogleFonts.inter(
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                                    letterSpacing: 0.0,
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                            ),
                          ].divide(SizedBox(height: 6.0)),
                        ),
                      ),
                    ),
                  ),
                ),
              if (_model.pageStatus == 'loading')
                Container(
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                  ),
                  child: Align(
                    alignment: AlignmentDirectional(0.0, 0.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Lottie.asset('assets/jsons/loading_indicator.json',
                            width: 125.0,
                            height: 125.0,
                            fit: BoxFit.contain,
                            frameRate: FrameRate(30.0),
                            animate: _model.loadingIndicatorStatus),
                        Text(
                          'Loading...',
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    font: GoogleFonts.inter(
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                                    fontSize: 18.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                        ),
                      ],
                    ),
                  ),
                ),
              if (_model.pageStatus == 'success')
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              16.0, 0.0, 0.0, 0.0),
                          child: Text(
                            'Buy',
                            textAlign: TextAlign.start,
                            style: FlutterFlowTheme.of(context)
                                .headlineMedium
                                .override(
                                  font: GoogleFonts.inter(
                                    fontWeight: FontWeight.bold,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .headlineMedium
                                        .fontStyle,
                                  ),
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.bold,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .headlineMedium
                                      .fontStyle,
                                ),
                          ),
                        ),
                        Material(
                          color: Colors.transparent,
                          elevation: 4.0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16.0),
                          ),
                          child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              borderRadius: BorderRadius.circular(16.0),
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(16.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              valueOrDefault<String>(
                                                _model.name,
                                                'No Name',
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .titleMedium
                                                      .override(
                                                        font: GoogleFonts.inter(
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .titleMedium
                                                                  .fontStyle,
                                                        ),
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleMedium
                                                                .fontStyle,
                                                      ),
                                            ),
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 4.0, 0.0, 0.0),
                                                  child: Text(
                                                    valueOrDefault<String>(
                                                      widget.ticker,
                                                      'No Ticker',
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          font:
                                                              GoogleFonts.inter(
                                                            fontWeight:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontWeight,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                          ),
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryText,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontStyle,
                                                        ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 4.0, 0.0, 0.0),
                                                  child: Text(
                                                    '•',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          font:
                                                              GoogleFonts.inter(
                                                            fontWeight:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontWeight,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                          ),
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryText,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontStyle,
                                                        ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 4.0, 0.0, 0.0),
                                                  child: Text(
                                                    valueOrDefault<String>(
                                                      _model.assetType,
                                                      'No Asset Type',
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          font:
                                                              GoogleFonts.inter(
                                                            fontWeight:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontWeight,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                          ),
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryText,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontStyle,
                                                        ),
                                                  ),
                                                ),
                                              ].divide(SizedBox(width: 6.0)),
                                            ),
                                            Wrap(
                                              spacing: 6.0,
                                              runSpacing: 0.0,
                                              alignment: WrapAlignment.start,
                                              crossAxisAlignment:
                                                  WrapCrossAlignment.start,
                                              direction: Axis.horizontal,
                                              runAlignment: WrapAlignment.start,
                                              verticalDirection:
                                                  VerticalDirection.down,
                                              clipBehavior: Clip.none,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 4.0, 0.0, 0.0),
                                                  child: Text(
                                                    valueOrDefault<String>(
                                                      _model.exchange,
                                                      'No Exchange',
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          font:
                                                              GoogleFonts.inter(
                                                            fontWeight:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontWeight,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                          ),
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryText,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontStyle,
                                                        ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 4.0, 0.0, 0.0),
                                                  child: Text(
                                                    '•',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          font:
                                                              GoogleFonts.inter(
                                                            fontWeight:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontWeight,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                          ),
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryText,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontStyle,
                                                        ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 4.0, 0.0, 0.0),
                                                  child: Text(
                                                    valueOrDefault<String>(
                                                      _model.sector,
                                                      'No Sector',
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          font:
                                                              GoogleFonts.inter(
                                                            fontWeight:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontWeight,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                          ),
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryText,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontStyle,
                                                        ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 4.0, 0.0, 0.0),
                                                  child: Text(
                                                    '•',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          font:
                                                              GoogleFonts.inter(
                                                            fontWeight:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontWeight,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                          ),
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryText,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontStyle,
                                                        ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 4.0, 0.0, 0.0),
                                                  child: Text(
                                                    valueOrDefault<String>(
                                                      _model.industry,
                                                      'No Industry',
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          font:
                                                              GoogleFonts.inter(
                                                            fontWeight:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontWeight,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                          ),
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryText,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontStyle,
                                                        ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                      Column(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          Text(
                                            '\$${_model.price}',
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
                                          Row(
                                            mainAxisSize: MainAxisSize.min,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            children: [
                                              Text(
                                                _model.todaysChange,
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
                                                          color: () {
                                                            if ((double.tryParse(
                                                                        _model
                                                                            .todaysChangePercent) ??
                                                                    0.0) >
                                                                0.15) {
                                                              return Color(
                                                                  0xFF008000);
                                                            } else if ((double.tryParse(_model.todaysChangePercent) ??
                                                                        0.0) >
                                                                    0.00 &&
                                                                (double.tryParse(_model.todaysChangePercent) ??
                                                                        0.0) <
                                                                    0.15) {
                                                              return Color(
                                                                  0xFF32CD32);
                                                            } else if ((double.tryParse(_model
                                                                            .todaysChangePercent) ??
                                                                        0.0) <
                                                                    0.00 &&
                                                                (double.tryParse(_model
                                                                            .todaysChangePercent) ??
                                                                        0.0) >
                                                                    -15.00) {
                                                              return Color(
                                                                  0xFFFF0000);
                                                            } else if ((double.tryParse(
                                                                        _model.todaysChangePercent) ??
                                                                    0.0) <
                                                                -0.15) {
                                                              return Color(
                                                                  0xFF8B0000);
                                                            } else {
                                                              return FlutterFlowTheme
                                                                      .of(context)
                                                                  .brandTextFade;
                                                            }
                                                          }(),
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
                                                '(${_model.todaysChangePercent}%)',
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
                                                          color: () {
                                                            if ((double.tryParse(
                                                                        _model
                                                                            .todaysChangePercent) ??
                                                                    0.0) >
                                                                0.15) {
                                                              return Color(
                                                                  0xFF008000);
                                                            } else if ((double.tryParse(_model.todaysChangePercent) ??
                                                                        0.0) >
                                                                    0.00 &&
                                                                (double.tryParse(_model.todaysChangePercent) ??
                                                                        0.0) <
                                                                    0.15) {
                                                              return Color(
                                                                  0xFF32CD32);
                                                            } else if ((double.tryParse(_model
                                                                            .todaysChangePercent) ??
                                                                        0.0) <
                                                                    0.00 &&
                                                                (double.tryParse(_model
                                                                            .todaysChangePercent) ??
                                                                        0.0) >
                                                                    -15.00) {
                                                              return Color(
                                                                  0xFFFF0000);
                                                            } else if ((double.tryParse(
                                                                        _model.todaysChangePercent) ??
                                                                    0.0) <
                                                                -0.15) {
                                                              return Color(
                                                                  0xFF8B0000);
                                                            } else {
                                                              return FlutterFlowTheme
                                                                      .of(context)
                                                                  .brandTextFade;
                                                            }
                                                          }(),
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
                                            ].divide(SizedBox(width: 2.0)),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  Text(
                                    valueOrDefault<String>(
                                      _model.description,
                                      'No Description',
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          font: GoogleFonts.inter(
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                          ),
                                          letterSpacing: 0.0,
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                          lineHeight: 1.35,
                                        ),
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Column(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Market Capitalization:',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  font: GoogleFonts.inter(
                                                    fontWeight: FontWeight.w600,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontStyle,
                                                  ),
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w600,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontStyle,
                                                ),
                                          ),
                                          Text(
                                            'Trailing PE:',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  font: GoogleFonts.inter(
                                                    fontWeight: FontWeight.w600,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontStyle,
                                                  ),
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w600,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontStyle,
                                                ),
                                          ),
                                          Text(
                                            'Forward PE:',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  font: GoogleFonts.inter(
                                                    fontWeight: FontWeight.w600,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontStyle,
                                                  ),
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w600,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontStyle,
                                                ),
                                          ),
                                          Text(
                                            'PEG Ratio:',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  font: GoogleFonts.inter(
                                                    fontWeight: FontWeight.w600,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontStyle,
                                                  ),
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w600,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontStyle,
                                                ),
                                          ),
                                          Text(
                                            'Beta:',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  font: GoogleFonts.inter(
                                                    fontWeight: FontWeight.w600,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontStyle,
                                                  ),
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w600,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontStyle,
                                                ),
                                          ),
                                          Text(
                                            'Earnings Per Share:',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  font: GoogleFonts.inter(
                                                    fontWeight: FontWeight.w600,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontStyle,
                                                  ),
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w600,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontStyle,
                                                ),
                                          ),
                                          Text(
                                            'Profit Margin:',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  font: GoogleFonts.inter(
                                                    fontWeight: FontWeight.w600,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontStyle,
                                                  ),
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w600,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontStyle,
                                                ),
                                          ),
                                          Text(
                                            'Gross Profit:',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  font: GoogleFonts.inter(
                                                    fontWeight: FontWeight.w600,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontStyle,
                                                  ),
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w600,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontStyle,
                                                ),
                                          ),
                                          Text(
                                            'EBITDA:',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  font: GoogleFonts.inter(
                                                    fontWeight: FontWeight.w600,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontStyle,
                                                  ),
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w600,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontStyle,
                                                ),
                                          ),
                                          Text(
                                            'Revenue:',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  font: GoogleFonts.inter(
                                                    fontWeight: FontWeight.w600,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontStyle,
                                                  ),
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w600,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontStyle,
                                                ),
                                          ),
                                          Text(
                                            'Revenue Per Share:',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  font: GoogleFonts.inter(
                                                    fontWeight: FontWeight.w600,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontStyle,
                                                  ),
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w600,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontStyle,
                                                ),
                                          ),
                                          Text(
                                            'Quarterly Revenue Growth:',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  font: GoogleFonts.inter(
                                                    fontWeight: FontWeight.w600,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontStyle,
                                                  ),
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w600,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontStyle,
                                                ),
                                          ),
                                          Text(
                                            'Quarterly Earnings Growth:',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  font: GoogleFonts.inter(
                                                    fontWeight: FontWeight.w600,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontStyle,
                                                  ),
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w600,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontStyle,
                                                ),
                                          ),
                                          Text(
                                            'Dividend Per Share:',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  font: GoogleFonts.inter(
                                                    fontWeight: FontWeight.w600,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontStyle,
                                                  ),
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w600,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontStyle,
                                                ),
                                          ),
                                          Text(
                                            'Dividend Yield:',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  font: GoogleFonts.inter(
                                                    fontWeight: FontWeight.w600,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontStyle,
                                                  ),
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w600,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontStyle,
                                                ),
                                          ),
                                          Text(
                                            'Dividend Date:',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  font: GoogleFonts.inter(
                                                    fontWeight: FontWeight.w600,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontStyle,
                                                  ),
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w600,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontStyle,
                                                ),
                                          ),
                                          Text(
                                            'Ex Dividend Date:',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  font: GoogleFonts.inter(
                                                    fontWeight: FontWeight.w600,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontStyle,
                                                  ),
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w600,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontStyle,
                                                ),
                                          ),
                                        ],
                                      ),
                                      Column(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            (String marketCap) {
                                              return ((double.tryParse(
                                                                  marketCap ??
                                                                      '') ??
                                                              0.0) /
                                                          1000000)
                                                      .toStringAsFixed(0) +
                                                  " Million";
                                            }(_model.marketCap),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  font: GoogleFonts.inter(
                                                    fontWeight:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontWeight,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontStyle,
                                                  ),
                                                  letterSpacing: 0.0,
                                                  fontWeight:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontWeight,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontStyle,
                                                ),
                                          ),
                                          Text(
                                            _model.trailingPE,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  font: GoogleFonts.inter(
                                                    fontWeight:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontWeight,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontStyle,
                                                  ),
                                                  letterSpacing: 0.0,
                                                  fontWeight:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontWeight,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontStyle,
                                                ),
                                          ),
                                          Text(
                                            _model.forwardPE,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  font: GoogleFonts.inter(
                                                    fontWeight:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontWeight,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontStyle,
                                                  ),
                                                  letterSpacing: 0.0,
                                                  fontWeight:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontWeight,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontStyle,
                                                ),
                                          ),
                                          Text(
                                            _model.pegRatio,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  font: GoogleFonts.inter(
                                                    fontWeight:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontWeight,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontStyle,
                                                  ),
                                                  letterSpacing: 0.0,
                                                  fontWeight:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontWeight,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontStyle,
                                                ),
                                          ),
                                          Text(
                                            _model.beta,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  font: GoogleFonts.inter(
                                                    fontWeight:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontWeight,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontStyle,
                                                  ),
                                                  letterSpacing: 0.0,
                                                  fontWeight:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontWeight,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontStyle,
                                                ),
                                          ),
                                          Text(
                                            _model.eps,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  font: GoogleFonts.inter(
                                                    fontWeight:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontWeight,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontStyle,
                                                  ),
                                                  letterSpacing: 0.0,
                                                  fontWeight:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontWeight,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontStyle,
                                                ),
                                          ),
                                          Text(
                                            (String margins) {
                                              return ((double.tryParse(
                                                                  margins ??
                                                                      '') ??
                                                              0.0) *
                                                          100)
                                                      .toStringAsFixed(2) +
                                                  '%';
                                            }(_model.profitMargin),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  font: GoogleFonts.inter(
                                                    fontWeight:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontWeight,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontStyle,
                                                  ),
                                                  letterSpacing: 0.0,
                                                  fontWeight:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontWeight,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontStyle,
                                                ),
                                          ),
                                          Text(
                                            (String profit) {
                                              return ((double.tryParse(profit ??
                                                                  '') ??
                                                              0.0) /
                                                          1000000)
                                                      .toStringAsFixed(0) +
                                                  " Million";
                                            }(_model.grossProfit),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  font: GoogleFonts.inter(
                                                    fontWeight:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontWeight,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontStyle,
                                                  ),
                                                  letterSpacing: 0.0,
                                                  fontWeight:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontWeight,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontStyle,
                                                ),
                                          ),
                                          Text(
                                            (String ebitda) {
                                              return ((double.tryParse(ebitda ??
                                                                  '') ??
                                                              0.0) /
                                                          1000000)
                                                      .toStringAsFixed(0) +
                                                  " Million";
                                            }(_model.ebitda),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  font: GoogleFonts.inter(
                                                    fontWeight:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontWeight,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontStyle,
                                                  ),
                                                  letterSpacing: 0.0,
                                                  fontWeight:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontWeight,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontStyle,
                                                ),
                                          ),
                                          Text(
                                            (String revenue) {
                                              return ((double.tryParse(
                                                                  revenue ??
                                                                      '') ??
                                                              0.0) /
                                                          1000000)
                                                      .toStringAsFixed(0) +
                                                  " Million";
                                            }(_model.revenue),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  font: GoogleFonts.inter(
                                                    fontWeight:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontWeight,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontStyle,
                                                  ),
                                                  letterSpacing: 0.0,
                                                  fontWeight:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontWeight,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontStyle,
                                                ),
                                          ),
                                          Text(
                                            _model.revenuePerShare,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  font: GoogleFonts.inter(
                                                    fontWeight:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontWeight,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontStyle,
                                                  ),
                                                  letterSpacing: 0.0,
                                                  fontWeight:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontWeight,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontStyle,
                                                ),
                                          ),
                                          Text(
                                            (String quarterlyRevenueGrowth) {
                                              return ((double.tryParse(
                                                                  quarterlyRevenueGrowth ??
                                                                      '') ??
                                                              0.0) *
                                                          100)
                                                      .toStringAsFixed(2) +
                                                  "%";
                                            }(_model.quarterlyRevenueGrowth),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  font: GoogleFonts.inter(
                                                    fontWeight:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontWeight,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontStyle,
                                                  ),
                                                  letterSpacing: 0.0,
                                                  fontWeight:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontWeight,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontStyle,
                                                ),
                                          ),
                                          Text(
                                            (String quarterlyEarningsGrowth) {
                                              return ((double.tryParse(
                                                                  quarterlyEarningsGrowth ??
                                                                      '') ??
                                                              0.0) *
                                                          100)
                                                      .toStringAsFixed(2) +
                                                  "%";
                                            }(_model.quarterlyEarningsGrowth),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  font: GoogleFonts.inter(
                                                    fontWeight:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontWeight,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontStyle,
                                                  ),
                                                  letterSpacing: 0.0,
                                                  fontWeight:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontWeight,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontStyle,
                                                ),
                                          ),
                                          Text(
                                            _model.dividendPerShare,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  font: GoogleFonts.inter(
                                                    fontWeight:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontWeight,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontStyle,
                                                  ),
                                                  letterSpacing: 0.0,
                                                  fontWeight:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontWeight,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontStyle,
                                                ),
                                          ),
                                          Text(
                                            (String dividendYeild) {
                                              return ((double.tryParse(
                                                                  dividendYeild ??
                                                                      '') ??
                                                              0.0) *
                                                          100)
                                                      .toStringAsFixed(2) +
                                                  "%";
                                            }(_model.dividendYield),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  font: GoogleFonts.inter(
                                                    fontWeight:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontWeight,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontStyle,
                                                  ),
                                                  letterSpacing: 0.0,
                                                  fontWeight:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontWeight,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontStyle,
                                                ),
                                          ),
                                          Text(
                                            _model.dividendDate,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  font: GoogleFonts.inter(
                                                    fontWeight:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontWeight,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontStyle,
                                                  ),
                                                  letterSpacing: 0.0,
                                                  fontWeight:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontWeight,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontStyle,
                                                ),
                                          ),
                                          Text(
                                            _model.exDividendDate,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  font: GoogleFonts.inter(
                                                    fontWeight:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontWeight,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontStyle,
                                                  ),
                                                  letterSpacing: 0.0,
                                                  fontWeight:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontWeight,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontStyle,
                                                ),
                                          ),
                                        ],
                                      ),
                                    ].divide(SizedBox(width: 12.0)),
                                  ),
                                ].divide(SizedBox(height: 6.0)),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            borderRadius: BorderRadius.circular(12.0),
                            border: Border.all(
                              color: FlutterFlowTheme.of(context).alternate,
                              width: 1.0,
                            ),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(16.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '52 Week Range',
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
                                        fontSize: 20.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.bold,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .brandStandardBold
                                            .fontStyle,
                                      ),
                                ),
                                Text(
                                  'The highest and lowest prices the stock has traded at over the past year.',
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
                                        fontSize: 14.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .brandStandard
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .brandStandard
                                            .fontStyle,
                                      ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 8.0, 0.0, 0.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            _model.fiftyTwoWeekLow,
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
                                                  color: FlutterFlowTheme.of(
                                                          context)
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
                                            _model.fiftyTwoWeekHigh,
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
                                                  color: FlutterFlowTheme.of(
                                                          context)
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
                                        ],
                                      ),
                                      Container(
                                        height: 20.0,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(4.0),
                                        ),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  4.5, 0.0, 4.5, 0.0),
                                          child: Slider(
                                            activeColor:
                                                FlutterFlowTheme.of(context)
                                                    .brandAccent1,
                                            inactiveColor:
                                                FlutterFlowTheme.of(context)
                                                    .brandAccent1,
                                            min: valueOrDefault<double>(
                                              (String low,
                                                      String currentPrice) {
                                                return (double.tryParse(low ??
                                                                "0.00") ??
                                                            0.00) >
                                                        0.00
                                                    ? (double.tryParse(
                                                            low ?? "0.00") ??
                                                        0.00)
                                                    : (double.tryParse(
                                                            currentPrice ??
                                                                "0.00") ??
                                                        0.00);
                                              }(_model.fiftyTwoWeekLow,
                                                  _model.price),
                                              0.0,
                                            ),
                                            max: valueOrDefault<double>(
                                              (String high,
                                                      String currentPrice) {
                                                return (double.tryParse(high ??
                                                                "0.00") ??
                                                            0.00) >
                                                        0.00
                                                    ? (double.tryParse(
                                                            high ?? "0.00") ??
                                                        0.00)
                                                    : (double.tryParse(
                                                            currentPrice ??
                                                                "0.00") ??
                                                        0.00);
                                              }(_model.fiftyTwoWeekHigh,
                                                  _model.price),
                                              1.0,
                                            ),
                                            value: _model.sliderValue ??=
                                                valueOrDefault<double>(
                                              (String price) {
                                                return (double.tryParse(
                                                        price ?? "0.00") ??
                                                    0.00);
                                              }(_model.price),
                                              0.0,
                                            ),
                                            onChanged: true
                                                ? null
                                                : (newValue) {
                                                    newValue = double.parse(
                                                        newValue
                                                            .toStringAsFixed(
                                                                2));
                                                    safeSetState(() =>
                                                        _model.sliderValue =
                                                            newValue);
                                                  },
                                          ),
                                        ),
                                      ),
                                    ].divide(SizedBox(height: 8.0)),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      13.0, 0.0, 13.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Low',
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
                                            ),
                                      ),
                                      Text(
                                        'High',
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
                                            ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Material(
                          color: Colors.transparent,
                          elevation: 4.0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          child: Container(
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  16.0, 16.0, 16.0, 16.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Analyst Ratings',
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
                                      Text(
                                        'Professional recommendations and average price target.',
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
                                              fontSize: 14.0,
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
                                    ].divide(SizedBox(height: 4.0)),
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Price Target',
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
                                            RichText(
                                              textScaler: MediaQuery.of(context)
                                                  .textScaler,
                                              text: TextSpan(
                                                children: [
                                                  TextSpan(
                                                    text: '\$',
                                                    style: TextStyle(),
                                                  ),
                                                  TextSpan(
                                                    text:
                                                        valueOrDefault<String>(
                                                      _model.analystPriceTarget,
                                                      '0',
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .titleLarge
                                                        .override(
                                                          font:
                                                              GoogleFonts.inter(
                                                            fontWeight:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleLarge
                                                                    .fontWeight,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleLarge
                                                                    .fontStyle,
                                                          ),
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .titleLarge
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .titleLarge
                                                                  .fontStyle,
                                                        ),
                                                  )
                                                ],
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .titleLarge
                                                        .override(
                                                          font:
                                                              GoogleFonts.inter(
                                                            fontWeight:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleLarge
                                                                    .fontWeight,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleLarge
                                                                    .fontStyle,
                                                          ),
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .titleLarge
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .titleLarge
                                                                  .fontStyle,
                                                        ),
                                              ),
                                            ),
                                          ].divide(SizedBox(height: 4.0)),
                                        ),
                                      ),
                                      Expanded(
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            Text(
                                              'Total Ratings',
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
                                            RichText(
                                              textScaler: MediaQuery.of(context)
                                                  .textScaler,
                                              text: TextSpan(
                                                children: [
                                                  TextSpan(
                                                    text:
                                                        valueOrDefault<String>(
                                                      _model.numberOfRatings,
                                                      '0',
                                                    ),
                                                    style: TextStyle(),
                                                  ),
                                                  TextSpan(
                                                    text: ' Analysts',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .titleLarge
                                                        .override(
                                                          font:
                                                              GoogleFonts.inter(
                                                            fontWeight:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleLarge
                                                                    .fontWeight,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleLarge
                                                                    .fontStyle,
                                                          ),
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .titleLarge
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .titleLarge
                                                                  .fontStyle,
                                                        ),
                                                  )
                                                ],
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .titleLarge
                                                        .override(
                                                          font:
                                                              GoogleFonts.inter(
                                                            fontWeight:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleLarge
                                                                    .fontWeight,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleLarge
                                                                    .fontStyle,
                                                          ),
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .titleLarge
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .titleLarge
                                                                  .fontStyle,
                                                        ),
                                              ),
                                            ),
                                          ].divide(SizedBox(height: 4.0)),
                                        ),
                                      ),
                                    ].divide(SizedBox(width: 16.0)),
                                  ),
                                  Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'Strong Buy',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  font: GoogleFonts.inter(
                                                    fontWeight: FontWeight.w600,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontStyle,
                                                  ),
                                                  color: Color(0xFF008000),
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w600,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontStyle,
                                                ),
                                          ),
                                          Text(
                                            valueOrDefault<String>(
                                              GetAssetInfoCall.strongBuyRating(
                                                (_model.assetInfo?.jsonBody ??
                                                    ''),
                                              ),
                                              '0',
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  font: GoogleFonts.inter(
                                                    fontWeight: FontWeight.w600,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontStyle,
                                                  ),
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w600,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontStyle,
                                                ),
                                          ),
                                        ].divide(SizedBox(width: 8.0)),
                                      ),
                                      LinearPercentIndicator(
                                        percent: _model.strongBuy,
                                        lineHeight: 12.0,
                                        animation: true,
                                        animateFromLastPercent: true,
                                        progressColor: Color(0xFF008000),
                                        backgroundColor:
                                            FlutterFlowTheme.of(context)
                                                .brandPrimaryBackground,
                                        barRadius: Radius.circular(12.0),
                                        padding: EdgeInsets.zero,
                                      ),
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'Buy',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  font: GoogleFonts.inter(
                                                    fontWeight: FontWeight.w600,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontStyle,
                                                  ),
                                                  color: Color(0xFF32CD32),
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w600,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontStyle,
                                                ),
                                          ),
                                          Text(
                                            valueOrDefault<String>(
                                              GetAssetInfoCall.buyRating(
                                                (_model.assetInfo?.jsonBody ??
                                                    ''),
                                              ),
                                              '0',
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  font: GoogleFonts.inter(
                                                    fontWeight: FontWeight.w600,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontStyle,
                                                  ),
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w600,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontStyle,
                                                ),
                                          ),
                                        ].divide(SizedBox(width: 8.0)),
                                      ),
                                      LinearPercentIndicator(
                                        percent: _model.buy,
                                        lineHeight: 12.0,
                                        animation: true,
                                        animateFromLastPercent: true,
                                        progressColor: Color(0xFF32CD32),
                                        backgroundColor:
                                            FlutterFlowTheme.of(context)
                                                .brandPrimaryBackground,
                                        barRadius: Radius.circular(12.0),
                                        padding: EdgeInsets.zero,
                                      ),
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'Hold',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  font: GoogleFonts.inter(
                                                    fontWeight: FontWeight.w600,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontStyle,
                                                  ),
                                                  color: Color(0xFFFFA500),
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w600,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontStyle,
                                                ),
                                          ),
                                          Text(
                                            valueOrDefault<String>(
                                              GetAssetInfoCall.holdRating(
                                                (_model.assetInfo?.jsonBody ??
                                                    ''),
                                              ),
                                              '0',
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  font: GoogleFonts.inter(
                                                    fontWeight: FontWeight.w600,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontStyle,
                                                  ),
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w600,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontStyle,
                                                ),
                                          ),
                                        ].divide(SizedBox(width: 8.0)),
                                      ),
                                      LinearPercentIndicator(
                                        percent: _model.hold,
                                        lineHeight: 12.0,
                                        animation: true,
                                        animateFromLastPercent: true,
                                        progressColor: Color(0xFFFFA500),
                                        backgroundColor:
                                            FlutterFlowTheme.of(context)
                                                .brandPrimaryBackground,
                                        barRadius: Radius.circular(12.0),
                                        padding: EdgeInsets.zero,
                                      ),
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'Sell',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  font: GoogleFonts.inter(
                                                    fontWeight: FontWeight.w600,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontStyle,
                                                  ),
                                                  color: Color(0xFFFF0000),
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w600,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontStyle,
                                                ),
                                          ),
                                          Text(
                                            valueOrDefault<String>(
                                              GetAssetInfoCall.sellRating(
                                                (_model.assetInfo?.jsonBody ??
                                                    ''),
                                              ),
                                              '0',
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  font: GoogleFonts.inter(
                                                    fontWeight: FontWeight.w600,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontStyle,
                                                  ),
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w600,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontStyle,
                                                ),
                                          ),
                                        ].divide(SizedBox(width: 8.0)),
                                      ),
                                      LinearPercentIndicator(
                                        percent: _model.sell,
                                        lineHeight: 12.0,
                                        animation: true,
                                        animateFromLastPercent: true,
                                        progressColor: Color(0xFFFF0000),
                                        backgroundColor:
                                            FlutterFlowTheme.of(context)
                                                .brandPrimaryBackground,
                                        barRadius: Radius.circular(12.0),
                                        padding: EdgeInsets.zero,
                                      ),
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'Strong Sell',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  font: GoogleFonts.inter(
                                                    fontWeight: FontWeight.w600,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontStyle,
                                                  ),
                                                  color: Color(0xFF8B0000),
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w600,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontStyle,
                                                ),
                                          ),
                                          Text(
                                            valueOrDefault<String>(
                                              GetAssetInfoCall.strongSellRating(
                                                (_model.assetInfo?.jsonBody ??
                                                    ''),
                                              ),
                                              '0',
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  font: GoogleFonts.inter(
                                                    fontWeight: FontWeight.w600,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontStyle,
                                                  ),
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w600,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontStyle,
                                                ),
                                          ),
                                        ].divide(SizedBox(width: 8.0)),
                                      ),
                                      LinearPercentIndicator(
                                        percent: _model.strongSell,
                                        lineHeight: 12.0,
                                        animation: true,
                                        animateFromLastPercent: true,
                                        progressColor: Color(0xFF8B0000),
                                        backgroundColor:
                                            FlutterFlowTheme.of(context)
                                                .brandPrimaryBackground,
                                        barRadius: Radius.circular(12.0),
                                        padding: EdgeInsets.zero,
                                      ),
                                    ].divide(SizedBox(height: 12.0)),
                                  ),
                                ].divide(SizedBox(height: 16.0)),
                              ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: Material(
                            color: Colors.transparent,
                            elevation: 4.0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            child: Container(
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(16.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Shareholder Structure',
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
                                            fontSize: 20.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.bold,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .brandStandardBold
                                                    .fontStyle,
                                          ),
                                    ),
                                    Container(
                                      width: 500.0,
                                      height: 230.0,
                                      child: Stack(
                                        children: [
                                          FlutterFlowPieChart(
                                            data: FFPieChartData(
                                              values: [
                                                _model.insiderOwnership,
                                                _model.institutionalOwnership,
                                                _model.reatilOwnership
                                              ],
                                              colors: [
                                                Color(0xFFD94F43),
                                                Color(0xFF2E8B57),
                                                Color(0xFFFFD700)
                                              ],
                                              radius: [100.0, 100.0, 105.0],
                                              borderWidth: [0, 0, 2.0],
                                              borderColor: [
                                                Color(0x00000000),
                                                Color(0x00000000),
                                                FlutterFlowTheme.of(context)
                                                    .brandTextStandard
                                              ],
                                            ),
                                            donutHoleRadius: 0.0,
                                            donutHoleColor: Colors.transparent,
                                            sectionLabelType:
                                                PieChartSectionLabelType
                                                    .percent,
                                            sectionLabelStyle:
                                                FlutterFlowTheme.of(context)
                                                    .titleMedium
                                                    .override(
                                                      font: GoogleFonts.inter(
                                                        fontWeight:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleMedium
                                                                .fontWeight,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleMedium
                                                                .fontStyle,
                                                      ),
                                                      fontSize: 16.0,
                                                      letterSpacing: 0.0,
                                                      fontWeight:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleMedium
                                                              .fontWeight,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleMedium
                                                              .fontStyle,
                                                    ),
                                            labelFormatter: LabelFormatter(
                                              numberFormat: (val) =>
                                                  formatNumber(
                                                val,
                                                formatType: FormatType.decimal,
                                                decimalType:
                                                    DecimalType.automatic,
                                              ),
                                            ),
                                          ),
                                          Align(
                                            alignment:
                                                AlignmentDirectional(-1.0, 1.0),
                                            child: FlutterFlowChartLegendWidget(
                                              entries: [
                                                LegendEntry(Color(0xFFD94F43),
                                                    'Insider'),
                                                LegendEntry(Color(0xFF2E8B57),
                                                    'Institutional'),
                                                LegendEntry(Color(0xFFFFD700),
                                                    'Public / Retail'),
                                              ],
                                              width: 115.0,
                                              height: 65.0,
                                              textStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        font: GoogleFonts.inter(
                                                          fontWeight:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontStyle,
                                                        ),
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontWeight,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontStyle,
                                                      ),
                                              textPadding: EdgeInsetsDirectional
                                                  .fromSTEB(5.0, 0.0, 0.0, 0.0),
                                              padding: EdgeInsets.all(4.0),
                                              backgroundColor:
                                                  FlutterFlowTheme.of(context)
                                                      .brandSecondaryBackground,
                                              borderWidth: 1.0,
                                              borderColor: Colors.black,
                                              indicatorSize: 7.0,
                                              indicatorBorderRadius:
                                                  BorderRadius.only(
                                                bottomLeft:
                                                    Radius.circular(0.0),
                                                bottomRight:
                                                    Radius.circular(0.0),
                                                topLeft: Radius.circular(0.0),
                                                topRight: Radius.circular(0.0),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Column(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Outstanding Shares:',
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
                                            Text(
                                              'Float:',
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
                                          ],
                                        ),
                                        Column(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              _model.outstandingShares,
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
                                            Text(
                                              _model.float,
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
                                          ],
                                        ),
                                      ].divide(SizedBox(width: 12.0)),
                                    ),
                                  ].divide(SizedBox(height: 12.0)),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Material(
                          color: Colors.transparent,
                          elevation: 4.0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16.0),
                          ),
                          child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              borderRadius: BorderRadius.circular(16.0),
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(16.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Number of Shares',
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
                                          fontSize: 20.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.bold,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .brandStandardBold
                                                  .fontStyle,
                                        ),
                                  ),
                                  TextFormField(
                                    controller:
                                        _model.sharesToBuyTextController,
                                    focusNode: _model.sharesToBuyFocusNode,
                                    onChanged: (_) => EasyDebounce.debounce(
                                      '_model.sharesToBuyTextController',
                                      Duration(milliseconds: 2000),
                                      () async {
                                        _model.shares = (double.tryParse(_model
                                                    .sharesToBuyTextController
                                                    .text
                                                    .trim()) ??
                                                0.0)
                                            .toStringAsFixed(2);
                                        safeSetState(() {});
                                        _model.totalCost =
                                            valueOrDefault<String>(
                                          (String price, String shares) {
                                            return ((double.tryParse(
                                                            price ?? '') ??
                                                        0.0) *
                                                    (double.tryParse(
                                                            shares ?? '') ??
                                                        0.0))
                                                .toStringAsFixed(2);
                                          }(_model.price, _model.shares),
                                          '0.00',
                                        );
                                        safeSetState(() {});
                                      },
                                    ),
                                    autofocus: false,
                                    textInputAction: TextInputAction.done,
                                    obscureText: false,
                                    decoration: InputDecoration(
                                      alignLabelWithHint: false,
                                      hintText: 'Enter quantity',
                                      hintStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            font: GoogleFonts.inter(
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryText,
                                            letterSpacing: 0.0,
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                          ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .brandTextStandard,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .brandAccent1,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      errorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .error,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      focusedErrorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .error,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      filled: true,
                                      fillColor: FlutterFlowTheme.of(context)
                                          .primaryBackground,
                                      contentPadding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              16.0, 12.0, 16.0, 12.0),
                                      suffixIcon: _model
                                              .sharesToBuyTextController!
                                              .text
                                              .isNotEmpty
                                          ? InkWell(
                                              onTap: () async {
                                                _model.sharesToBuyTextController
                                                    ?.clear();
                                                _model.shares =
                                                    (double.tryParse(_model
                                                                .sharesToBuyTextController
                                                                .text
                                                                .trim()) ??
                                                            0.0)
                                                        .toStringAsFixed(2);
                                                safeSetState(() {});
                                                _model.totalCost =
                                                    valueOrDefault<String>(
                                                  (String price,
                                                          String shares) {
                                                    return ((double.tryParse(
                                                                    price ??
                                                                        '') ??
                                                                0.0) *
                                                            (double.tryParse(
                                                                    shares ??
                                                                        '') ??
                                                                0.0))
                                                        .toStringAsFixed(2);
                                                  }(_model.price,
                                                      _model.shares),
                                                  '0.00',
                                                );
                                                safeSetState(() {});
                                                safeSetState(() {});
                                              },
                                              child: Icon(
                                                Icons.clear,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .brandTextStandard,
                                                size: 22,
                                              ),
                                            )
                                          : null,
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          font: GoogleFonts.inter(
                                            fontWeight: FontWeight.w500,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                          ),
                                          fontSize: 16.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w500,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                    maxLength: 5,
                                    maxLengthEnforcement:
                                        MaxLengthEnforcement.enforced,
                                    buildCounter: (context,
                                            {required currentLength,
                                            required isFocused,
                                            maxLength}) =>
                                        null,
                                    keyboardType:
                                        const TextInputType.numberWithOptions(
                                            decimal: true),
                                    validator: _model
                                        .sharesToBuyTextControllerValidator
                                        .asValidator(context),
                                    inputFormatters: [
                                      FilteringTextInputFormatter.allow(
                                          RegExp('^[0-9]*\\.?[0-9]*\$'))
                                    ],
                                  ),
                                ].divide(SizedBox(height: 12.0)),
                              ),
                            ),
                          ),
                        ),
                        Material(
                          color: Colors.transparent,
                          elevation: 4.0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16.0),
                          ),
                          child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              borderRadius: BorderRadius.circular(16.0),
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(16.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Order Summary',
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
                                          fontSize: 20.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.bold,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .brandStandardBold
                                                  .fontStyle,
                                        ),
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Text(
                                        'Share Price:',
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
                                      Text(
                                        _model.price,
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
                                            ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Text(
                                        'Quantity:',
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
                                      Text(
                                        _model.shares,
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
                                            ),
                                      ),
                                    ],
                                  ),
                                  Divider(
                                    thickness: 1.0,
                                    color:
                                        FlutterFlowTheme.of(context).alternate,
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Total Cost',
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
                                            ),
                                      ),
                                      Text(
                                        '\$${_model.totalCost}',
                                        style: FlutterFlowTheme.of(context)
                                            .titleMedium
                                            .override(
                                              font: GoogleFonts.inter(
                                                fontWeight: FontWeight.bold,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .titleMedium
                                                        .fontStyle,
                                              ),
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .brandTextStandard,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.bold,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .titleMedium
                                                      .fontStyle,
                                            ),
                                      ),
                                    ],
                                  ),
                                ].divide(SizedBox(height: 12.0)),
                              ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional(0.0, 1.0),
                          child: Container(
                            width: double.infinity,
                            height: 80.0,
                            decoration: BoxDecoration(),
                            child: Align(
                              alignment: AlignmentDirectional(0.0, 1.0),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16.0, 0.0, 16.0, 16.0),
                                child: FFButtonWidget(
                                  onPressed: () async {
                                    // When buy action is made, check if a number of sharees has been entered. Also check if the number is a posititve non-zero double with an accuracy up to the hundredths place.
                                    if ((_model.sharesToBuyTextController
                                                    .text !=
                                                '') &&
                                        ((double.tryParse(_model
                                                        .sharesToBuyTextController
                                                        .text) ??
                                                    0.0)
                                                .toStringAsFixed(2) ==
                                            _model.shares) &&
                                        ((double.tryParse(_model.shares) ??
                                                0.0) >
                                            0.00)) {
                                      await TransactionsRecord.createDoc(
                                              currentUserReference!)
                                          .set(createTransactionsRecordData(
                                        timestamp: getCurrentTimestamp,
                                        transactionType: 'Buy',
                                        ticker: widget.ticker,
                                        name: _model.name,
                                        assetType: _model.assetType,
                                        quantity: _model.shares,
                                        price: _model.price,
                                        cost: (String price, String shares) {
                                          return ((double.tryParse(
                                                          price ?? '') ??
                                                      0.0) *
                                                  (double.parse(shares ?? '') ??
                                                      0.0))
                                              .toStringAsFixed(2);
                                        }(_model.price, _model.shares),
                                      ));
                                      _model.holdingsDocument =
                                          await queryHoldingsRecordOnce(
                                        parent: currentUserReference,
                                        queryBuilder: (holdingsRecord) =>
                                            holdingsRecord.where(
                                          'ticker',
                                          isEqualTo: widget.ticker,
                                        ),
                                        singleRecord: true,
                                      ).then((s) => s.firstOrNull);
                                      if (_model.holdingsDocument != null) {
                                        await _model.holdingsDocument!.reference
                                            .update(createHoldingsRecordData(
                                          averageCost: (String currentShares,
                                                  String currentCostAverage,
                                                  String newShares,
                                                  String newPrice) {
                                            return ((((double.tryParse(currentShares ??
                                                                    '') ??
                                                                0.0) *
                                                            (double.tryParse(
                                                                    currentCostAverage ??
                                                                        '') ??
                                                                0.0)) +
                                                        ((double.tryParse(
                                                                    newShares ??
                                                                        '') ??
                                                                0.0) *
                                                            (double.tryParse(
                                                                    newPrice ??
                                                                        '') ??
                                                                0.0))) /
                                                    ((double.tryParse(
                                                                currentShares ??
                                                                    '') ??
                                                            0.0) +
                                                        (double.tryParse(
                                                                newShares ?? '') ??
                                                            0.0)))
                                                .toStringAsFixed(2);
                                          }(
                                              _model.holdingsDocument!.quantity,
                                              _model.holdingsDocument!
                                                  .averageCost,
                                              _model.shares,
                                              _model.price),
                                          quantity: (String currentShares,
                                                  String newShares) {
                                            return ((double.parse(
                                                            currentShares ??
                                                                '') ??
                                                        0.0) +
                                                    (double.parse(
                                                            newShares ?? '') ??
                                                        0.0))
                                                .toStringAsFixed(2);
                                          }(_model.holdingsDocument!.quantity,
                                              _model.shares),
                                        ));
                                      } else {
                                        await HoldingsRecord.createDoc(
                                                currentUserReference!)
                                            .set(createHoldingsRecordData(
                                          ticker: widget.ticker,
                                          name: _model.name,
                                          assetType: _model.assetType,
                                          quantity: _model.shares,
                                          averageCost: _model.price,
                                        ));
                                      }

                                      context
                                          .pushNamed(PortfolioWidget.routeName);
                                    }

                                    safeSetState(() {});
                                  },
                                  text: 'Buy',
                                  options: FFButtonOptions(
                                    width: 300.0,
                                    height: 50.0,
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        24.0, 0.0, 24.0, 0.0),
                                    iconPadding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    color: FlutterFlowTheme.of(context)
                                        .brandAccent1,
                                    textStyle: FlutterFlowTheme.of(context)
                                        .titleMedium
                                        .override(
                                          font: GoogleFonts.inter(
                                            fontWeight: FontWeight.w600,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .titleMedium
                                                    .fontStyle,
                                          ),
                                          color: FlutterFlowTheme.of(context)
                                              .brandTextStandard,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w600,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .titleMedium
                                                  .fontStyle,
                                        ),
                                    elevation: 0.0,
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context)
                                          .brandTextStandard,
                                    ),
                                    borderRadius: BorderRadius.circular(12.0),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ]
                          .divide(SizedBox(height: 24.0))
                          .around(SizedBox(height: 24.0)),
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
