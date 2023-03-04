Pod::Spec.new do |spec|
  spec.name         = "FrameBuilder"
  spec.version      = "1.0.0"
  spec.summary      = "A lightweight library designed for building frame-based interfaces in a simple manner inspired by AutoLayout."
  spec.description  = "FrameBuilder is a lightweight library designed for building frame-based interfaces in a simple manner inspired by AutoLayout. It provides a fluent API for constructing layout attributes and generating a frame, which can be applied to any UIView with ease."
  spec.homepage     = "https://github.com/weakvar/FrameBuilder"
  spec.license      = { :type => "MIT", :file => "LICENSE" }
  spec.author       = { "Vladislav Kulikov" => "weakvar@gmail.com" }
  spec.platform     = :ios, "13.0"
  spec.source       = { :git => "https://github.com/weakvar/FrameBuilder.git", :tag => "#{spec.version}" }
  spec.source_files = "FrameBuilder/Sources/**/*.swift"
  spec.framework    = 'UIKit'
end
