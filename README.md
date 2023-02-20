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

## Contributing

Contributions to FrameBuilder are welcome and encouraged. To contribute, please submit a pull request with your changes.

## License

FrameBuilder is available under the MIT license. See the LICENSE file for more information.
