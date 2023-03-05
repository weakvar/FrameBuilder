Pod::Spec.new do |spec|
  spec.name         = "FrameBuilder"
  spec.version      = "1.0.0"
  spec.summary      = "A tiny library designed for building frame-based views on UIKit in an easy to understand syntax inspired by AutoLayout."
  spec.description  = "FrameBuilder is a tiny library designed for building frame-based views on UIKit in an easy to understand syntax inspired by AutoLayout."
  spec.homepage     = "https://github.com/weakvar/FrameBuilder"
  spec.license      = { :type => "MIT", :file => "LICENSE" }
  spec.author       = { "Vladislav Kulikov" => "weakvar@gmail.com" }
  spec.platform     = :ios, "13.0"
  spec.source       = { :git => "https://github.com/weakvar/FrameBuilder.git", :tag => "#{spec.version}" }
  spec.source_files = "Sources/**/*.swift"
  spec.swift_version = "5.5"
  spec.framework    = 'UIKit'
end
