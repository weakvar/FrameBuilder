# FrameBuilder

FrameBuilder is a lightweight library designed for building frame-based interfaces in a simple manner inspired by AutoLayout. It provides a fluent API for constructing layout attributes and generating a frame, which can be applied to any UIView with ease. 

Instead of calculating every pixel of the frame for your UIView:
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

You can describe the position and size of the UIView in a simple human-readable code using FrameBuilder:
```swift
let fooView = UIView()
fooView.applyAttributesToFrame(
    FrameBuilder()
        .leading(12)
        .top(12)
        .width(48)
        .height(48)
        .build()
)

let barView = UIView()
barView.applyAttributesToFrame(
    FrameBuilder()
        .leading(equalTo: .trailing, ofView: fooView, withOffset: 12)
        .top(equalTo: .top, ofView: contentView, withOffset: 16)
        .width(from: .trailing, ofView: fooView, withOffset: 12, to: .trailing, ofView: contentView, withOffset: 12)
        .height(20)
        .build()
)
```

With FrameBuilder, you can easily create complex layout structures without the need for tedious manual frame calculations. It's the perfect solution for anyone who wants to build responsive and scalable interfaces with ease.

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

There is an [Example Project](https://github.com/weakvar/FrameBuilder/tree/main/Example/FrameBuilderExample) in the repository that demonstrates the layout of `MessengerDialogCell` on frames using FrameBuilder. If you're new to FrameBuilder, it's a great way to get started. Below are examples of using each of the methods provided by `FrameBuilder` class.

### Methods for setting the width of the view

Sets the specific width of the view:
```swift
let fooView = UIView()
fooView.applyAttributesToFrame(
    FrameBuilder()
        .width(64)
        .build()
)
```

Sets the width of the view relative to the leading and trailing edges of the specified views:
```swift
let fooView = UIView()
fooView.applyAttributesToFrame(
    FrameBuilder()
        .width(from: .leading, ofView: barView, withOffset: 12, to: .trailing, ofView: barView, withOffset: 12)
        .build()
)
```

Sets the width of the view equal to the width of another view:
```swift
let fooView = UIView()
fooView.applyAttributesToFrame(
    FrameBuilder()
        .width(equalTo: barView)
        .build()
)
```

### Methods for setting the height of the view

Sets the specific height of the view:
```swift
let fooView = UIView()
fooView.applyAttributesToFrame(
    FrameBuilder()
        .height(64)
        .build()
)
```

Sets the height of the view relative to the specified top and bottom views and their edges:
```swift
let fooView = UIView()
fooView.applyAttributesToFrame(
    FrameBuilder()
        .height(from: .top, ofView: barView, withOffset: 8, to: .bottom, ofView: barView, withOffset: 8)
        .build()
)
```

Sets the height of the view equal to the height of another view:
```swift
let fooView = UIView()
fooView.applyAttributesToFrame(
    FrameBuilder()
        .height(equalTo: barView)
        .build()
)
```

### Methods for setting position of the view from the leading edge

Sets the leading position of the view:
```swift
let fooView = UIView()
fooView.applyAttributesToFrame(
    FrameBuilder()
        .leading(12)
        .build()
)
```

Sets the leading position of the view equal to the given edge of another view:
```swift
let fooView = UIView()
fooView.applyAttributesToFrame(
    FrameBuilder()
        .leading(equalTo: .leading, ofView: barView, withOffset: 12)
        .build()
)
```

### Methods for setting position of the view from the trailing edge

Sets the trailing position of the view:
```swift
let fooView = UIView()
fooView.applyAttributesToFrame(
    FrameBuilder()
        .trailing(12)
        .build()
)
```

Sets the trailing position of the view equal to the given edge of another view:
```swift
let fooView = UIView()
fooView.applyAttributesToFrame(
    FrameBuilder()
        .trailing(equalTo: .trailing, ofView: barView, withOffset: 12)
        .build()
)
```

### Methods for setting position of the view from the top edge

Sets the top position of the view:
```swift
let fooView = UIView()
fooView.applyAttributesToFrame(
    FrameBuilder()
        .top(24)
        .build()
)
```

Sets the top position of the view equal to the given edge of another view:
```swift
let fooView = UIView()
fooView.applyAttributesToFrame(
    FrameBuilder()
        .top(equalTo: .bottom, ofView: barView, withOffset: 8)
        .build()
)
```

### Methods for setting position of the view from the bottom edge

Sets the bottom position of the viewL:
```swift
let fooView = UIView()
fooView.applyAttributesToFrame(
    FrameBuilder()
        .bottom(24)
        .build()
)
```

Sets the bottom position of the view equal to the given edge of another view:
```swift
let fooView = UIView()
fooView.applyAttributesToFrame(
    FrameBuilder()
        .bottom(equalTo: .bottom, ofView: barView, withOffset: 8)
        .build()
)
```

### Methods for centring the view's position

Sets the horizontal center of the view to the horizontal center of another view:
```swift
let fooView = UIView()
fooView.applyAttributesToFrame(
    FrameBuilder()
        .centerXToCenterX(ofView: barView)
        .build()
)
```

Sets the vertical center of the view to the vertical center of another view:
```swift
let fooView = UIView()
fooView.applyAttributesToFrame(
    FrameBuilder()
        .centerYToCenterY(ofView: barView)
        .build()
)
```

## Contributing

Contributions to FrameBuilder are welcome and encouraged. To contribute, please submit a pull request with your changes.

## License

FrameBuilder is available under the MIT license. See the LICENSE file for more information.
