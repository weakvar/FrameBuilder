import XCTest
@testable import FrameBuilder

final class TopPositioningTests: XCTestCase {
    
    func test_top_equalToTopEdgeOfView() throws {
        let rootView = UIView(frame: CGRect(x: 0, y: 0, width: 414, height: 896))
        
        let otherView = UIView(frame: CGRect(x: 12, y: 64, width: 100, height: 100))
        rootView.addSubview(otherView)
        
        let testView = UIView(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        rootView.addSubview(testView)
        
        testView.buildFrame(
            FrameBuilder()
                .top(equalTo: .top, ofView: otherView)
        )
        
        XCTAssertEqual(testView.frame.origin.y, 64)
    }
    
    func test_top_equalToTopEdgeOfViewWithOffset() throws {
        let rootView = UIView(frame: CGRect(x: 0, y: 0, width: 414, height: 896))
        
        let otherView = UIView(frame: CGRect(x: 12, y: 64, width: 100, height: 100))
        rootView.addSubview(otherView)
        
        let testView = UIView(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        rootView.addSubview(testView)
        
        testView.buildFrame(
            FrameBuilder()
                .top(equalTo: .top, ofView: otherView, withOffset: 8)
        )
        
        XCTAssertEqual(testView.frame.origin.y, 72)
    }
    
    func test_top_equalToBottomEdgeOfView() throws {
        let rootView = UIView(frame: CGRect(x: 0, y: 0, width: 414, height: 896))
        
        let otherView = UIView(frame: CGRect(x: 12, y: 64, width: 100, height: 100))
        rootView.addSubview(otherView)
        
        let testView = UIView(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        rootView.addSubview(testView)
        
        testView.buildFrame(
            FrameBuilder()
                .top(equalTo: .bottom, ofView: otherView)
        )
        
        XCTAssertEqual(testView.frame.origin.y, 164)
    }
    
    func test_top_equalToBottomEdgeOfViewWithOffset() throws {
        let rootView = UIView(frame: CGRect(x: 0, y: 0, width: 414, height: 896))
        
        let otherView = UIView(frame: CGRect(x: 12, y: 64, width: 100, height: 100))
        rootView.addSubview(otherView)
        
        let testView = UIView(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        rootView.addSubview(testView)
        
        testView.buildFrame(
            FrameBuilder()
                .top(equalTo: .bottom, ofView: otherView, withOffset: 8)
        )
        
        XCTAssertEqual(testView.frame.origin.y, 172)
    }
    
}
