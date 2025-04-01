import 'package:flutter/material.dart';

/// A widget that creates a shimmering effect, commonly used for loading placeholders.
///
/// The shimmer effect is created by animating a gradient across the child widget,
/// giving the appearance of a shiny, moving highlight.
class Shimmer extends StatefulWidget {
  const Shimmer({
    super.key,
    required this.child,
    required this.baseColor,
    required this.highlightColor,
    this.duration = const Duration(milliseconds: 1500),
  });

  /// Factory constructor that creates a Shimmer with the specified colors.
  ///
  /// This is a convenience method to create a Shimmer with standard parameters.
  /// 
  /// Example:
  /// ```dart
  /// Shimmer.fromColors(
  ///   baseColor: Colors.grey[300]!,
  ///   highlightColor: Colors.grey[100]!,
  ///   child: Container(
  ///     height: 100,
  ///     width: double.infinity,
  ///     color: Colors.white,
  ///   ),
  /// )
  /// ```
  factory Shimmer.fromColors({
    Key? key,
    required Widget child,
    required Color baseColor,
    required Color highlightColor,
    Duration duration = const Duration(milliseconds: 1500),
  }) {
    return Shimmer(
      key: key,
      child: child,
      baseColor: baseColor,
      highlightColor: highlightColor,
      duration: duration,
    );
  }

  /// The widget to apply the shimmer effect to
  final Widget child;
  
  /// The base color of the shimmer effect (the darker color)
  final Color baseColor;
  
  /// The highlight color of the shimmer effect (the lighter color that moves)
  final Color highlightColor;
  
  /// The duration of one complete shimmer animation cycle
  final Duration duration;

  @override
  ShimmerState createState() => ShimmerState();
}

class ShimmerState extends State<Shimmer> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    // Create an animation controller that will drive the shimmer effect
    _controller = AnimationController(vsync: this, duration: widget.duration)
      ..addListener(() {
        // Trigger a rebuild whenever the animation value changes
        setState(() {});
      })
      // Make the animation repeat indefinitely
      ..repeat();
    
    // Create a linear animation from 0.0 to 1.0
    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(_controller);
  }

  @override
  void dispose() {
    // Clean up the animation controller when the widget is removed
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        // The actual content widget
        widget.child,
        
        // The animated shimmer effect overlay
        Positioned.fill(
          child: AnimatedBuilder(
            animation: _animation,
            builder: (BuildContext context, Widget? child) {
              return FractionallySizedBox(
                // The gradient is half the width of the widget
                widthFactor: 0.5,
                // Move the gradient from left to right based on animation value
                alignment: AlignmentDirectional.centerStart
                    .add(AlignmentDirectional(2 * _animation.value - 1, 0)),
                child: Container(
                  decoration: BoxDecoration(
                    // Create a horizontal gradient that moves across the widget
                    gradient: LinearGradient(
                      colors: [
                        widget.baseColor.withOpacity(0.0),  // Transparent at the edges
                        widget.highlightColor,              // Highlight in the middle
                        widget.baseColor.withOpacity(0.0),  // Transparent at the edges
                      ],
                      stops: const [0.0, 0.5, 1.0],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

/// A ready-to-use shimmer loading placeholder.
///
/// This widget creates a simple rectangular shimmer effect that can be used
/// as a loading placeholder for various UI elements like cards, text, or images.
///
/// Example:
/// ```dart
/// ShimmerLoading(
///   height: 200,
///   width: double.infinity,
///   borderRadius: 16.0,
/// )
/// ```
class ShimmerLoading extends StatelessWidget {
  const ShimmerLoading({
    super.key,
    this.width = double.infinity,
    this.height = 100,
    this.borderRadius = 8.0, required Container child,
  });

  /// The width of the shimmer placeholder
  final double width;
  
  /// The height of the shimmer placeholder
  final double height;
  
  /// The border radius of the shimmer placeholder
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      // Light gray base color
      baseColor: Colors.grey[300]!,
      // Almost white highlight color for the shimmer effect
      highlightColor: Colors.grey[100]!,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(borderRadius),
        ),
      ),
    );
  }
}


