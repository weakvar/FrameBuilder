import XCTest
@testable import FrameBuilder

final class BottomPositioningTests: XCTestCase {
    
    func test_bottom_equalToTopEdgeOfView() throws {
        let rootView = UIView(frame: CGRect(x: 0, y: 0, width: 414, height: 896))
        
        let otherView = UIView(frame: CGRect(x: 12, y: 64, width: 100, height: 100))
        rootView.addSubview(otherView)
        
        let testView = UIView(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        rootView.addSubview(testView)
        
        testView.buildFrame(
            FrameBuilder()
                .bottom(equalTo: .top, ofView: otherView)
        )
        
        XCTAssertEqual(testView.frame.origin.y, 14)
    }
    
    func test_bottom_equalToTopEdgeOfViewWithOffset() throws {
        let rootView = UIView(frame: CGRect(x: 0, y: 0, width: 414, height: 896))
        
        let otherView = UIView(frame: CGRect(x: 12, y: 64, width: 100, height: 100))
        rootView.addSubview(otherView)
        
        let testView = UIView(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        rootView.addSubview(testView)
        
        testView.buildFrame(
            FrameBuilder()
                .bottom(equalTo: .top, ofView: otherView, withOffset: 8)
        )
        
        XCTAssertEqual(testView.frame.origin.y, 6)
    }
    
    func test_bottom_equalToBottomEdgeOfView() throws {
        let rootView = UIView(frame: CGRect(x: 0, y: 0, width: 414, height: 896))
        
        let otherView = UIView(frame: CGRect(x: 12, y: 64, width: 100, height: 100))
        rootView.addSubview(otherView)
        
        let testView = UIView(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        rootView.addSubview(testView)
        
        testView.buildFrame(
            FrameBuilder()
                .bottom(equalTo: .bottom, ofView: otherView)
        )
        
        XCTAssertEqual(testView.frame.origin.y, 114)
    }
    
    func test_bottom_equalToBottomEdgeOfViewWithOffset() throws {
        let rootView = UIView(frame: CGRect(x: 0, y: 0, width: 414, height: 896))
        
        let otherView = UIView(frame: CGRect(x: 12, y: 64, width: 100, height: 100))
        rootView.addSubview(otherView)
        
        let testView = UIView(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        rootView.addSubview(testView)
        
        testView.buildFrame(
            FrameBuilder()
                .bottom(equalTo: .bottom, ofView: otherView, withOffset: 8)
        )
        
        XCTAssertEqual(testView.frame.origin.y, 106)
    }
    
}
