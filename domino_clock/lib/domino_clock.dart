// Copyright 2019 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'dart:async';

import 'package:flutter_clock_helper/model.dart';
import 'package:domino_clock/domino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

enum _Element {
  background,
  domino,
  dot,
}

final _lightTheme = {
  _Element.background: Color(0xFF81B3FE),
  _Element.domino: Colors.white,
  _Element.dot: Colors.black,
};

final _darkTheme = {
  _Element.background: Colors.black,
  _Element.domino: Colors.black87,
  _Element.dot: Colors.red,
};

class DominoClock extends StatefulWidget {
  const DominoClock(this.model);

  final ClockModel model;

  @override
  _DominoClockState createState() => _DominoClockState();
}

class _DominoClockState extends State<DominoClock> {
  DateTime _dateTime = DateTime.now();
  Timer _timer;

  @override
  void initState() {
    super.initState();
    widget.model.addListener(_updateModel);
    _updateTime();
    _updateModel();
  }

  @override
  void didUpdateWidget(DominoClock oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.model != oldWidget.model) {
      oldWidget.model.removeListener(_updateModel);
      widget.model.addListener(_updateModel);
    }
  }

  @override
  void dispose() {
    _timer?.cancel();
    widget.model.removeListener(_updateModel);
    widget.model.dispose();
    super.dispose();
  }

  void _updateModel() {
    setState(() {
      // Cause the clock to rebuild when the model changes.
    });
  }

  void _updateTime() {
    setState(() {
      _dateTime = DateTime.now();

      // Update once per second.
      _timer = Timer(
        Duration(seconds: 1) - Duration(milliseconds: _dateTime.millisecond),
        _updateTime,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).brightness == Brightness.light
        ? _lightTheme
        : _darkTheme;
    final hour =
        DateFormat(widget.model.is24HourFormat ? 'HH' : 'hh').format(_dateTime);
    final minute = DateFormat('mm').format(_dateTime);

    int firstDigit;
    int secondDigit;
    int thirdDigit;
    int fourthDigit;

    if (hour.length == 1) {
      firstDigit = 0;
      secondDigit = int.parse(hour);
    } else {
      firstDigit = int.parse(hour.substring(0, 1));
      secondDigit = int.parse(hour.substring(1, 2));
    }

    thirdDigit = int.parse(minute.substring(0, 1));
    fourthDigit = int.parse(minute.substring(1, 2));

    return Container(
        color: colors[_Element.background],
        child: AspectRatio(
            aspectRatio: 5.0 / 3.0,
            child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Domino(
                      dominoColor: colors[_Element.domino],
                      dotColor: colors[_Element.dot],
                      digitNumber: firstDigit),
                  Domino(
                      dominoColor: colors[_Element.domino],
                      dotColor: colors[_Element.dot],
                      digitNumber: secondDigit),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      SizedBox(
                        width: 20.0,
                      )
                    ],
                  ),
                  Domino(
                      dominoColor: colors[_Element.domino],
                      dotColor: colors[_Element.dot],
                      digitNumber: thirdDigit),
                  Domino(
                      dominoColor: colors[_Element.domino],
                      dotColor: colors[_Element.dot],
                      digitNumber: fourthDigit),
                ])));
  }
}
