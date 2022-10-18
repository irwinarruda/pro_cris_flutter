// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:pro_cris_flutter/styles/pro_cris_colors.dart';

class ExpandableFab extends StatefulWidget {
  ExpandableFab({
    super.key,
    this.initialOpen,
    required this.distance,
    required this.children,
  });

  bool? initialOpen;
  double distance;
  List<Widget> children;

  @override
  State<ExpandableFab> createState() => _ExpandableFabState();
}

class _ExpandableFabState extends State<ExpandableFab>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _expandAnimation;
  bool _open = false;

  @override
  void initState() {
    super.initState();
    _open = widget.initialOpen ?? false;
    _controller = AnimationController(
      value: _open ? 1.0 : 0.0,
      duration: Duration(milliseconds: 250),
      vsync: this,
    );
    _expandAnimation = CurvedAnimation(
      curve: Curves.fastOutSlowIn,
      reverseCurve: Curves.easeOutQuad,
      parent: _controller,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _toggle() {
    setState(() {
      _open = !_open;
      if (_open) {
        _controller.forward();
      } else {
        _controller.reverse();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Stack(
        alignment: Alignment.bottomRight,
        clipBehavior: Clip.none,
        children: [
          Positioned(
            right: 20,
            bottom: 30,
            child: _buildTapToCloseFab(),
          ),
          ..._buildExpandingActionButtons(),
          Positioned(
            right: 20,
            bottom: 30,
            child: _buildTapToOpenFab(),
          ),
        ],
      ),
    );
  }

  Widget _buildTapToCloseFab() {
    return SizedBox(
      width: 56.0,
      height: 56.0,
      child: Center(
        child: Material(
          shape: CircleBorder(),
          clipBehavior: Clip.antiAlias,
          elevation: 4.0,
          child: InkWell(
            onTap: _toggle,
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(
                Icons.close,
                color: Theme.of(context).primaryColor,
              ),
            ),
          ),
        ),
      ),
    );
  }

  List<Widget> _buildExpandingActionButtons() {
    final children = <Widget>[];
    for (var i = 0; i < widget.children.length; i++) {
      children.add(
        _ExpandingActionButton(
          count: i.toDouble(),
          maxDistance: widget.distance,
          progress: _expandAnimation,
          child: widget.children[i],
        ),
      );
    }
    return children;
  }

  Widget _buildTapToOpenFab() {
    return IgnorePointer(
      ignoring: _open,
      child: AnimatedContainer(
        transformAlignment: Alignment.center,
        transform: Matrix4.diagonal3Values(
          _open ? 0.7 : 1.0,
          _open ? 0.7 : 1.0,
          1.0,
        ),
        duration: Duration(milliseconds: 250),
        curve: Interval(0.0, 0.5, curve: Curves.easeOut),
        child: AnimatedOpacity(
          opacity: _open ? 0.0 : 1.0,
          curve: Interval(0.25, 1.0, curve: Curves.easeInOut),
          duration: Duration(milliseconds: 250),
          child: FloatingActionButton(
            onPressed: _toggle,
            child: Icon(
              Icons.more_horiz,
              color: ProCrisColors.white,
              size: 40,
            ),
          ),
        ),
      ),
    );
  }
}

class _ExpandingActionButton extends StatelessWidget {
  _ExpandingActionButton({
    required this.count,
    required this.maxDistance,
    required this.progress,
    required this.child,
  });

  double count;
  double maxDistance;
  Animation<double> progress;
  Widget child;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: progress,
      builder: (context, child) {
        return Positioned(
          right: 20,
          bottom: 30 + 50 + (45 * count),
          child: child!,
        );
      },
      child: FadeTransition(
        opacity: progress,
        child: child,
      ),
    );
  }
}

class ActionButton extends StatelessWidget {
  ActionButton({
    super.key,
    this.onPressed,
    this.color,
    required this.child,
  });

  VoidCallback? onPressed;
  Widget child;
  Color? color;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () {
        if (onPressed != null) onPressed!();
      },
      style: OutlinedButton.styleFrom(
        backgroundColor: color ?? ProCrisColors.gray,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(1000)),
        ),
      ),
      child: child,
    );
  }
}
