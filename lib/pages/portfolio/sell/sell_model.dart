import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'sell_widget.dart' show SellWidget;
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class SellModel extends FlutterFlowModel<SellWidget> {
  ///  Local state fields for this page.

  String currentPrice = '0';

  String totalReturn = '0';

  String sharesSold = '';

  String currentTicker = ' ';

  ///  State fields for stateful widgets in this page.

  // State field(s) for ListView widget.

  PagingController<DocumentSnapshot?, HoldingsRecord>? listViewPagingController;
  Query? listViewPagingQuery;
  List<StreamSubscription?> listViewStreamSubscriptions = [];

  // Stores action output result for [Backend Call - Read Document] action in Asset-Tile widget.
  HoldingsRecord? selectedAsset;
  // Stores action output result for [Backend Call - API (Get Asset Price)] action in Asset-Tile widget.
  ApiCallResponse? apiPriceResult;
  // State field(s) for Sell-Shares-TextField widget.
  FocusNode? sellSharesTextFieldFocusNode;
  TextEditingController? sellSharesTextFieldTextController;
  String? Function(BuildContext, String?)?
      sellSharesTextFieldTextControllerValidator;
  // Stores action output result for [Backend Call - Read Document] action in Sell-Button widget.
  HoldingsRecord? updatedHoldings;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    listViewStreamSubscriptions.forEach((s) => s?.cancel());
    listViewPagingController?.dispose();

    sellSharesTextFieldFocusNode?.dispose();
    sellSharesTextFieldTextController?.dispose();
  }

  /// Additional helper methods.
  PagingController<DocumentSnapshot?, HoldingsRecord> setListViewController(
    Query query, {
    DocumentReference<Object?>? parent,
  }) {
    listViewPagingController ??= _createListViewController(query, parent);
    if (listViewPagingQuery != query) {
      listViewPagingQuery = query;
      listViewPagingController?.refresh();
    }
    return listViewPagingController!;
  }

  PagingController<DocumentSnapshot?, HoldingsRecord> _createListViewController(
    Query query,
    DocumentReference<Object?>? parent,
  ) {
    final controller =
        PagingController<DocumentSnapshot?, HoldingsRecord>(firstPageKey: null);
    return controller
      ..addPageRequestListener(
        (nextPageMarker) => queryHoldingsRecordPage(
          parent: parent,
          nextPageMarker: nextPageMarker,
          streamSubscriptions: listViewStreamSubscriptions,
          controller: controller,
          pageSize: 25,
          isStream: true,
        ),
      );
  }
}
