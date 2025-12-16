import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'buy_widget.dart' show BuyWidget;
import 'package:flutter/material.dart';

class BuyModel extends FlutterFlowModel<BuyWidget> {
  ///  Local state fields for this page.

  String description = '';

  String assetType = '';

  String sector = '';

  String industry = '';

  String marketCap = '0';

  String pegRatio = '0.00';

  String eps = '0.00';

  String forwardPE = '0.00';

  String trailingPE = '0.00';

  String ebitda = '0';

  String revenuePerShare = '0.00';

  String profitMargin = '0.00';

  String revenue = '0';

  String grossProfit = '0';

  String dividendPerShare = '0.00';

  String dividendYield = '0.00';

  String dividendDate = '0/0/0000';

  String exDividendDate = '0/0/0000';

  String quarterlyEarningsGrowth = '0.00';

  String quarterlyRevenueGrowth = '0.00';

  String ticker = '';

  String name = '';

  String todaysChange = '0.00';

  String todaysChangePercent = '0.00';

  String price = '0.00';

  String shares = '0.00';

  String totalCost = '0.00';

  String pageStatus = 'loading';

  double strongBuy = 0.0;

  double buy = 0.0;

  double hold = 0.0;

  double sell = 0.0;

  double strongSell = 0.0;

  String analystPriceTarget = '0.00';

  String numberOfRatings = '0';

  String beta = '0.00';

  String exchange = '';

  String float = '0';

  String outstandingShares = '0';

  double insiderOwnership = 0.0;

  double institutionalOwnership = 0.0;

  double reatilOwnership = 0.0;

  String fiftyTwoWeekLow = '0.00';

  String fiftyTwoWeekHigh = '0.00';

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (Get Asset Info)] action in Buy widget.
  ApiCallResponse? assetInfo;
  // Stores action output result for [Backend Call - API (Get Asset Price)] action in Buy widget.
  ApiCallResponse? assetPrice;
  // State field(s) for Loading-Indicator widget.
  late bool loadingIndicatorStatus;
  // State field(s) for Slider widget.
  double? sliderValue;
  // State field(s) for Shares-to-Buy widget.
  FocusNode? sharesToBuyFocusNode;
  TextEditingController? sharesToBuyTextController;
  String? Function(BuildContext, String?)? sharesToBuyTextControllerValidator;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  HoldingsRecord? holdingsDocument;

  @override
  void initState(BuildContext context) {
    loadingIndicatorStatus = true;
  }

  @override
  void dispose() {
    sharesToBuyFocusNode?.dispose();
    sharesToBuyTextController?.dispose();
  }
}
