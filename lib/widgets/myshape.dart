import 'dart:math';

import 'package:flutter/material.dart';

class MyShape extends AutomaticNotchedShape {
  const MyShape() : super(const ContinuousRectangleBorder());

  @override
  Path getOuterPath(Rect host, Rect? guest) {
    if (guest == null || !host.overlaps(guest)) {
      return Path()..addRect(host);
    }

    final double x1 = max(host.left, guest.left);
    final double x2 = min(host.right, guest.right);
    final double y = host.bottom - 20;

    return Path()
      ..moveTo(host.left, host.top)
      ..lineTo(x1, host.top)
      ..lineTo((x1 + x2) / 2.0, y)
      ..lineTo(x2, host.top)
      ..lineTo(host.right, host.top)
      ..lineTo(host.right, host.bottom)
      ..lineTo(host.left, host.bottom)
      ..close();
  }

  @override
  Path getInnerPath(Rect host, Rect guest) {
    return Path()..addRect(host);
  }
}
