import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import '../backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../auth/auth_util.dart';

bool hasUploadedMedia(String? mediaPath) {
  return mediaPath != null && mediaPath.isNotEmpty;
}

int calculatePrice(
  DateTime? from,
  DateTime? to,
  int articlePrice,
) {
  if (from == null || to == null) {
    return (articlePrice);
  } else {
    from = DateTime(from.year, from.month, from.day);

    to = DateTime(to.year, to.month, to.day);

    return ((to.difference(from).inHours / 24).round() * articlePrice);
  }
}

String? getInitials(String displayName) {
  List<String> names = displayName.split(" ");
  String initials = "";
  int numWords = 2;

  if (numWords < names.length) {
    numWords = names.length;
  }
  for (var i = 0; i < numWords; i++) {
    initials += '${names[i][0]}';
  }
  return initials;
}
