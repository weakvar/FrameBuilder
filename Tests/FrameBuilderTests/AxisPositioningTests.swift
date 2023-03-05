import XCTest
@testable import FrameBuilder

final class AxisPositioningTests: XCTestCase {
    
    func test_x() throws {
        let rootView = UIView(frame: CGRect(x: 0, y: 0, width: 414, height: 896))
        
        let testView = UIView()
        testView.addSubview(rootView)
        
        testView.buildFrame(
            FrameBuilder()
                .x(12)
        )
        
        XCTAssertEqual(testView.frame.origin.x, 12)
    }
    
    func test_y() throws {
        let rootView = UIView(frame: CGRect(x: 0, y: 0, width: 414, height: 896))
        
        let testView = UIView()
        testView.addSubview(rootView)
        
        testView.buildFrame(
            FrameBuilder()
                .y(64)
        )
        
        XCTAssertEqual(testView.frame.origin.y, 64)
    }
    
}
