import 'package:flutter/widgets.dart';
import 'package:flutter_touch_ripple/components/touch_ripple_behavior.dart';

/// The mixin provides necessary information for gesture behaviors
/// and other rendering processes about touch ripple.
mixin TouchRippleContext {
  /// Returns the instance of a [TickerProvider] for playing
  /// ripple effects and other animations.
  TickerProvider get vsync;

  /// Returns the background color of the spread ripple effect.
  Color get rippleColor;

  /// Returns the background color of the effect when the user hovers.
  Color get hoverColor;

  /// Returns the scale percentage value of the ripple effect.
  double get rippleScale;

  /// Return the radius pixels of a blur filter to the touch ripple.
  double get rippleBlurRadius;

  /// Return the instance of a border radius for the ripple effect.
  BorderRadius get rippleBorderRadius;

  /// Returns the duration for which the ripple effect is previewed
  /// even if the gesture is not finalized, allowing the user to see
  /// the effect while the pointer is down or moving.
  Duration get previewDuration;

  /// Returns the duration after which the gesture is considered
  /// rejected if the pointer is still down and no tap is completed.
  /// If this duration elapses without a successful gesture, the
  /// gesture will be rejected.
  Duration get tappableDuration;

  /// Returns the minimum duration used to distinguish between a tap and
  /// a double-tap. If the user does not perform a second tap within
  /// this duration, it is considered just a single-tap.
  Duration get doubleTappableDuration;

  /// Returns the duration until double-tap deactivation. During this period,
  /// any single tap is still considered a double-tap without requiring
  /// continuous double-tapping.
  /// 
  /// See Also, If the callback returns false, the duration will not be utilized,
  Duration get doubleTapAliveDuration;

  /// Returns the behavior applied to the touch ripple effect when tapped.
  TouchRippleBehavior get tapBehavior;

  /// Returns the behavior that defines when a gesture should be rejected,
  /// specifying the conditions for rejection.
  TouchRippleRejectBehavior get rejectBehavior;

  /// Return the behavior of a touch ripple when it overlaps with
  /// other ripple effects. (e.g. overlappable, cancel, ignore)
  TouchRippleOverlapBehavior get overlapBehavior;
}

/// The enumeration defines when a gesture should be rejected,
/// specifying the conditions for rejection.
enum TouchRippleRejectBehavior {
  /// Sets the gesture to not be rejected regardless of any action or event.
  /// However, if the gesture is forcibly rejected due to a scroll gesture,
  /// the rejection will occur as expected.
  none,

  /// Sets the gesture to be canceled if the pointer movement distance
  /// is greater than or equal to [kTouchSlop].
  touchSlop,

  /// Sets the gesture to be canceled if the pointer position is
  /// outside the area occupied by the widget.
  leave,
}

/// The enumeration defines the behavior of a touch ripple
/// when it overlaps with other ripple effects.
enum TouchRippleOverlapBehavior {
  /// Sets the touch ripples to be allowed to overlap with each other.
  overlappable,

  /// Sets the touch ripple to be canceled if the effects overlap,
  /// with the new effect being added to the stack.
  cancel,

  /// Sets the event to be ignored if the effects overlap,
  /// canceling the previous touch effect until it disappears.
  ignore,
}

enum TouchRippleAliveBehavior {
  none,
  preview,
  started,
}