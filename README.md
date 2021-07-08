# RippleView

A simple Ripple animation view in SwiftUI.


<table>
<tr>
<th> solid </th>
<th> outlined </th>
</tr>
<tr>
<td>

<img src=https://raw.githubusercontent.com/emmanuelkehinde/RippleView/main/Media/solid.gif width=400 align="center" />

</td>
<td>

<img src=https://raw.githubusercontent.com/emmanuelkehinde/RippleView/main/Media/outlined.gif width=400 align="center" />

</td>
</tr>
</table>

## Installation

Here is how to integrate the library into your iOS project.

### Swift Package Manager

- File > Swift Packages > Add Package Dependency
- Add `https://github.com/emmanuelkehinde/RippleView.git`
- Select "Up to Next Major Version" with "1.0.2"

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

### Blog Post
https://emmanuelkehinde.io/how-to-control-the-display-order-of-overlapping-views-in-swiftui/

Enjoy 🚀
