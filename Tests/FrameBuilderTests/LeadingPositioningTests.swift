import XCTest
@testable import FrameBuilder

final class LeadingPositioningTests: XCTestCase {
    
    func test_leading_equalToLeadingEdgeOfView() throws {
        let rootView = UIView(frame: CGRect(x: 0, y: 0, width: 414, height: 896))
        
        let otherView = UIView(frame: CGRect(x: 12, y: 64, width: 100, height: 100))
        rootView.addSubview(otherView)
        
        let testView = UIView(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        rootView.addSubview(testView)
        
        testView.buildFrame(
            FrameBuilder()
                .leading(equalTo: .leading, ofView: otherView)
        )
        
        XCTAssertEqual(testView.frame.origin.x, 12)
    }
    
    func test_leading_equalToLeadingEdgeOfViewWithOffset() throws {
        let rootView = UIView(frame: CGRect(x: 0, y: 0, width: 414, height: 896))
        
        let otherView = UIView(frame: CGRect(x: 12, y: 64, width: 100, height: 100))
        rootView.addSubview(otherView)
        
        let testView = UIView(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        rootView.addSubview(testView)
        
        testView.buildFrame(
            FrameBuilder()
                .leading(equalTo: .leading, ofView: otherView, withOffset: 8)
        )
        
        XCTAssertEqual(testView.frame.origin.x, 20)
    }
    
    func test_leading_equalToTrailingEdgeOfView() throws {
        let rootView = UIView(frame: CGRect(x: 0, y: 0, width: 414, height: 896))
        
        let otherView = UIView(frame: CGRect(x: 12, y: 64, width: 100, height: 100))
        rootView.addSubview(otherView)
        
        let testView = UIView(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        rootView.addSubview(testView)
        
        testView.buildFrame(
            FrameBuilder()
                .leading(equalTo: .trailing, ofView: otherView)
        )
        
        XCTAssertEqual(testView.frame.origin.x, 112)
    }
    
    func test_leading_equalToTrailingEdgeOfViewWithOffset() throws {
        let rootView = UIView(frame: CGRect(x: 0, y: 0, width: 414, height: 896))
        
        let otherView = UIView(frame: CGRect(x: 12, y: 64, width: 100, height: 100))
        rootView.addSubview(otherView)
        
        let testView = UIView(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        rootView.addSubview(testView)
        
        testView.buildFrame(
            FrameBuilder()
                .leading(equalTo: .trailing, ofView: otherView, withOffset: 8)
        )
        
        XCTAssertEqual(testView.frame.origin.x, 120)
    }
    
}
