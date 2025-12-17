import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/auth/firebase_auth/auth_util.dart';

List<dynamic> filterEquities(List<dynamic>? matches) {
  if (matches == null) return [];
  return matches.where((item) {
    // Must be Equity AND listed in United States
    return item["3. type"] == "Equity" && item["4. region"] == "United States";
  }).toList();
}
