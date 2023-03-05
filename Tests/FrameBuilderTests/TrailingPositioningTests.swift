import XCTest
@testable import FrameBuilder

final class TrailingPositioningTests: XCTestCase {
    
    func test_trailing_equalToLeadingEdgeOfView() throws {
        let rootView = UIView(frame: CGRect(x: 0, y: 0, width: 414, height: 896))
        
        let otherView = UIView(frame: CGRect(x: 12, y: 64, width: 100, height: 100))
        rootView.addSubview(otherView)
        
        let testView = UIView(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        rootView.addSubview(testView)
        
        testView.buildFrame(
            FrameBuilder()
                .trailing(equalTo: .leading, ofView: otherView)
        )
        
        XCTAssertEqual(testView.frame.origin.x, -38)
    }
    
    func test_trailing_equalToLeadingEdgeOfViewWithOffset() throws {
        let rootView = UIView(frame: CGRect(x: 0, y: 0, width: 414, height: 896))
        
        let otherView = UIView(frame: CGRect(x: 12, y: 64, width: 100, height: 100))
        rootView.addSubview(otherView)
        
        let testView = UIView(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        rootView.addSubview(testView)
        
        testView.buildFrame(
            FrameBuilder()
                .trailing(equalTo: .leading, ofView: otherView, withOffset: 8)
        )
        
        XCTAssertEqual(testView.frame.origin.x, -46)
    }

    func test_trailing_equalToTrailingEdgeOfView() throws {
        let rootView = UIView(frame: CGRect(x: 0, y: 0, width: 414, height: 896))
        
        let otherView = UIView(frame: CGRect(x: 12, y: 64, width: 100, height: 100))
        rootView.addSubview(otherView)
        
        let testView = UIView(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        rootView.addSubview(testView)
        
        testView.buildFrame(
            FrameBuilder()
                .trailing(equalTo: .trailing, ofView: otherView)
        )
        
        XCTAssertEqual(testView.frame.origin.x, 62)
    }

    func test_trailing_equalToTrailingEdgeOfViewWithOffset() throws {
        let rootView = UIView(frame: CGRect(x: 0, y: 0, width: 414, height: 896))
        
        let otherView = UIView(frame: CGRect(x: 12, y: 64, width: 100, height: 100))
        rootView.addSubview(otherView)
        
        let testView = UIView(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        rootView.addSubview(testView)
        
        testView.buildFrame(
            FrameBuilder()
                .trailing(equalTo: .trailing, ofView: otherView, withOffset: 8)
        )
        
        XCTAssertEqual(testView.frame.origin.x, 54)
    }

    
}
