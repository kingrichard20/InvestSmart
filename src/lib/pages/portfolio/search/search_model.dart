import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'search_widget.dart' show SearchWidget;
import 'package:flutter/material.dart';

class SearchModel extends FlutterFlowModel<SearchWidget> {
  ///  Local state fields for this page.

  String? ticker;

  String? name;

  List<dynamic> tickerSearchResults = [];
  void addToTickerSearchResults(dynamic item) => tickerSearchResults.add(item);
  void removeFromTickerSearchResults(dynamic item) =>
      tickerSearchResults.remove(item);
  void removeAtIndexFromTickerSearchResults(int index) =>
      tickerSearchResults.removeAt(index);
  void insertAtIndexInTickerSearchResults(int index, dynamic item) =>
      tickerSearchResults.insert(index, item);
  void updateTickerSearchResultsAtIndex(
          int index, Function(dynamic) updateFn) =>
      tickerSearchResults[index] = updateFn(tickerSearchResults[index]);

  bool isLoading = true;

  ///  State fields for stateful widgets in this page.

  // State field(s) for SearchBar widget.
  FocusNode? searchBarFocusNode;
  TextEditingController? searchBarTextController;
  String? Function(BuildContext, String?)? searchBarTextControllerValidator;
  // Stores action output result for [Backend Call - API (Search)] action in SearchBar widget.
  ApiCallResponse? searchResults;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    searchBarFocusNode?.dispose();
    searchBarTextController?.dispose();
  }
}
