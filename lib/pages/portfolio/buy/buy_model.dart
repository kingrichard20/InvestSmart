import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'buy_widget.dart' show BuyWidget;
import 'package:flutter/material.dart';

class BuyModel extends FlutterFlowModel<BuyWidget> {
  ///  Local state fields for this page.

  String? description;

  String? assetType;

  String? sector;

  String? industry;

  String? marketCap;

  String? pegRatio;

  String? bookValue;

  String? eps;

  String? forwardPE;

  String? trailingPE;

  String? ebitda;

  String? revenuePerShare;

  String? profitMargin;

  String? revenue;

  String? grossProfit;

  String? dividendPerShare;

  String? dividendYield;

  String? dividendDate;

  String? exDividendDate;

  String? quarterlyEarningsGrowth;

  String? quarterlyRevenueGrowth;

  String? ticker;

  String? name;

  String? todaysChange;

  String? todaysChangePercent;

  String? price;

  String? shares;

  String? totalCost;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (Get Asset Info)] action in Buy widget.
  ApiCallResponse? assetInfo;
  // Stores action output result for [Backend Call - API (Get Asset Price)] action in Buy widget.
  ApiCallResponse? assetPrice;
  // State field(s) for Shares-to-Buy widget.
  FocusNode? sharesToBuyFocusNode;
  TextEditingController? sharesToBuyTextController;
  String? Function(BuildContext, String?)? sharesToBuyTextControllerValidator;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  HoldingsRecord? holdingsDocument;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    sharesToBuyFocusNode?.dispose();
    sharesToBuyTextController?.dispose();
  }
}
