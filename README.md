# RippleView

A simple Ripple animation view in SwiftUI.

## Basic Usage

Place the `RippleView` anywhere you want it to appear in your SwiftUI View.

```swift
ZStack {
   RippleView()
}
```

You also have access to some customization options.

```swift
@State private var rippleShouldAnimate: Bool = true

ZStack {
  RippleView(
      style: .solid,
      rippleCount: 7,
      tintColor: Color.blue,
      timeIntervalBetweenRipples: 0.18,
      shouldAnimate: $rippleShouldAnimate
  )
}
```

Available parameters include:

- *style*: The ripple style, either `solid` or `outlined`, defaults to `solid`
- *rippleCount*: The number of ripples to display, defaults to `5`
- *tintColor*: The color to tint the ripples with, defaults to `black`
- *timeIntervalBetweenRipples*: The expected time interval between each ripple display, defaults to `0.13`
- *shouldAnimate*: A binding that tells if animation should begin or not, defaults to `true`

Enjoy 🚀
