<image width="128" height="128" src="https://github.com/weakvar/FrameBuilder/blob/main/logo.png?raw=true" alt="Logo">

# FrameBuilder

FrameBuilder is a tiny library designed for building frame-based views on UIKit in an easy to understand syntax inspired by AutoLayout.

Instead of manually calculating the frame for your UIView:
```swift
let fooView = UIView()
fooView.frame = CGRect(
    origin: CGPoint(x: 12, y: 12),
    size: CGSize(width: 48, height: 48)
)

let barView = UIView()
barView.frame = CGRect(
    origin: CGPoint(x: fooView.frame.maxX + 12, y: 16),
    size: CGSize(width: bounds.width - (fooView.frame.maxX + 12) - 12, height: 20)
)
```

You can describe the size and position of your UIView using an easy-to-understand syntax of FrameBuilder:
```swift
let fooView = UIView()
fooView.buildFrame(
    FrameBuilder()
        .x(12)
        .y(12)
        .width(48)
        .height(48)
)

let barView = UIView()
barView.buildFrame(
    FrameBuilder()
        .leading(equalTo: .trailing, ofView: fooView, withOffset: 12)
        .top(equalTo: .top, ofView: contentView, withOffset: 16)
        .width(from: .trailing, ofView: fooView, withOffset: 12, to: .trailing, ofView: contentView, withOffset: 12)
        .height(20)
)
```

With FrameBuilder, you can easily create complex layout structures without the need for tedious manual frame calculations. It's the perfect solution for those who want to layout views on frames, but don't like calculating the sizes and positions of views in a manual way.

## Features
* ⭐ Frame-based
* ⭐ An easy to understand syntax inspired by AutoLayout
* ⭐ Fully supports the RTL layout direction
* ⭐ Written in pure Swift 5
* ⭐ 650 lines of code, 35 KB
* ⭐ High performance
* ⭐ No dependencies

## Install

To install FrameBuilder, you can use either Swift Package Manager or CocoaPods.

### Swift Package Manager

To install FrameBuilder using Swift Package Manager, add the following line to your `Package.swift` file:

```swift
dependencies: [
    .package(url: "https://github.com/weakvar/FrameBuilder.git", from: "1.0.0")
]
```

Then, run `swift package update` to install the package.

### CocoaPods

To install FrameBuilder using CocoaPods, add the following line to your `Podfile`:

```ruby
pod 'FrameBuilder', '~> 1.0.0'
```

Then, run pod install to install the pod.

Once you have installed FrameBuilder, you can start using it in your project by importing the `FrameBuilder` module.

## Usage

### Methods for setting a width of the view

Sets the specific width of the `fooView`:
```swift
let fooView = UIView()
fooView.buildFrame(
    FrameBuilder()
        .width(64)
)
```

Sets the width of the `fooView` relative to the leading and trailing edges of the `barView` with some offsets:
```swift
let fooView = UIView()
fooView.buildFrame(
    FrameBuilder()
        .width(from: .leading, ofView: barView, withOffset: 12, to: .trailing, ofView: barView, withOffset: 12)
)
```

Sets the width of the `fooView` equal to the width of the `barView`:
```swift
let fooView = UIView()
fooView.buildFrame(
    FrameBuilder()
        .width(equalTo: barView)
)
```

### Methods for setting a height of the view

Sets the specific height of the `fooView`:
```swift
let fooView = UIView()
fooView.buildFrame(
    FrameBuilder()
        .height(64)
)
```


Sets the height of the `fooView` relative to the top and bottom edges of the `barView` with some offsets:
```swift
let fooView = UIView()
fooView.buildFrame(
    FrameBuilder()
        .height(from: .top, ofView: barView, withOffset: 8, to: .bottom, ofView: barView, withOffset: 8)
)
```

Sets the height of the `fooView` equal to the height of the `barView`:
```swift
let fooView = UIView()
fooView.buildFrame(
    FrameBuilder()
        .height(equalTo: barView)
)
```

### Methods for setting a position of the view by an axis

Sets the x position of the view:
```swift
let fooView = UIView()
fooView.buildFrame(
    FrameBuilder()
        .x(12)
)
```

Sets the y position of the view:
```swift
let fooView = UIView()
fooView.buildFrame(
    FrameBuilder()
        .y(24)
)
```

### Methods for setting a position of the view relative to a position of another UIVIew

Sets the leading position of the `fooView` equal to the leading edge of the `barView` with the offset:
```swift
let fooView = UIView()
fooView.buildFrame(
    FrameBuilder()
        .leading(equalTo: .leading, ofView: barView, withOffset: 12)
)
```

Sets the leading position of the `fooView` equal to the trailing edge of the `barView` with the offset:
```swift
let fooView = UIView()
fooView.buildFrame(
    FrameBuilder()
        .leading(equalTo: .trailing, ofView: barView, withOffset: 12)
)
```

Sets the trailing position of the `fooView` equal to the leading edge of the `barView` with the offset:
```swift
let fooView = UIView()
fooView.buildFrame(
    FrameBuilder()
        .trailing(equalTo: .leading, ofView: barView, withOffset: 12)
)
```

Sets the trailing position of the `fooView` equal to the trailing edge of the `barView` with the offset:
```swift
let fooView = UIView()
fooView.buildFrame(
    FrameBuilder()
        .trailing(equalTo: .trailing, ofView: barView, withOffset: 12)
)
```

Sets the top position of the `fooView` equal to the top edge of the `barView` with the offset:
```swift
let fooView = UIView()
fooView.buildFrame(
    FrameBuilder()
        .top(equalTo: .top, ofView: barView, withOffset: 8)
)
```

Sets the top position of the `fooView` equal to the bottom edge of the `barView` with the offset:
```swift
let fooView = UIView()
fooView.buildFrame(
    FrameBuilder()
        .top(equalTo: .bottom, ofView: barView, withOffset: 8)
)
```

Sets the bottom position of the `fooView` equal to the top edge of the `barView` with the offset:
```swift
let fooView = UIView()
fooView.buildFrame(
    FrameBuilder()
        .bottom(equalTo: .top, ofView: barView, withOffset: 8)
)
```

Sets the bottom position of the `fooView` equal to the bottom edge of the `barView` with the offset:
```swift
let fooView = UIView()
fooView.buildFrame(
    FrameBuilder()
        .bottom(equalTo: .bottom, ofView: barView, withOffset: 8)
)
```

### Methods for centring the view's position

Sets the horizontal center of the `fooView` to the horizontal center of the `barView`:
```swift
let fooView = UIView()
fooView.buildFrame(
    FrameBuilder()
        .centerXToCenterX(ofView: barView)
)
```

Sets the vertical center of the `fooView` to the vertical center of the `barView`:
```swift
let fooView = UIView()
fooView.buildFrame(
    FrameBuilder()
        .centerYToCenterY(ofView: barView)
)
```

## Contributing

Contributions to FrameBuilder are welcome and encouraged. To contribute, please submit a pull request with your changes.

## License

FrameBuilder is available under the MIT license. See the LICENSE file for more information.
