import XCTest
@testable import FrameBuilder

final class CenterPositioningTests: XCTestCase {
    
    func test_centerXToCenterXOfView() throws {
        let rootView = UIView(frame: CGRect(x: 0, y: 0, width: 414, height: 896))
        
        let testView = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        rootView.addSubview(testView)
        
        testView.buildFrame(
            FrameBuilder()
                .centerXToCenterX(ofView: rootView)
        )
        
        XCTAssertEqual(testView.frame.origin.x, 157)
    }
    
    func test_centerXToCenterXOfViewWithOffset() throws {
        let rootView = UIView(frame: CGRect(x: 0, y: 0, width: 414, height: 896))
        
        let testView = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        rootView.addSubview(testView)
        
        testView.buildFrame(
            FrameBuilder()
                .centerXToCenterX(ofView: rootView, offset: 8)
        )
        
        XCTAssertEqual(testView.frame.origin.x, 165)
    }
    
    func test_centerYToCenterYOfView() throws {
        let rootView = UIView(frame: CGRect(x: 0, y: 0, width: 414, height: 896))
        
        let testView = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        rootView.addSubview(testView)
        
        testView.buildFrame(
            FrameBuilder()
                .centerYToCenterY(ofView: rootView)
        )
        
        XCTAssertEqual(testView.frame.origin.y, 398)
    }
    
    func test_centerYToCenterYOfViewWithOffset() throws {
        let rootView = UIView(frame: CGRect(x: 0, y: 0, width: 414, height: 896))
        
        let testView = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        rootView.addSubview(testView)
        
        testView.buildFrame(
            FrameBuilder()
                .centerYToCenterY(ofView: rootView, offset: 8)
        )
        
        XCTAssertEqual(testView.frame.origin.y, 406)
    }
    
}
