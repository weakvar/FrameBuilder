import XCTest
@testable import FrameBuilder

final class WidthSizingTests: XCTestCase {
    
    func test_width() throws {
        let rootView = UIView(frame: CGRect(x: 0, y: 0, width: 414, height: 896))
        
        let testView = UIView()
        rootView.addSubview(testView)
        
        testView.buildFrame(
            FrameBuilder()
                .width(100)
        )
        
        XCTAssertEqual(testView.frame.size.width, 100)
    }
    
    func test_width_fromLeadingEdgeOfView_toLeadingEdgeOfView() throws {
        let rootView = UIView(frame: CGRect(x: 0, y: 0, width: 414, height: 896))
        
        let otherView = UIView(frame: CGRect(x: 64, y: 64, width: 100, height: 100))
        rootView.addSubview(otherView)
        
        let testView = UIView()
        rootView.addSubview(testView)
        
        testView.buildFrame(
            FrameBuilder()
                .width(from: .leading, ofView: rootView, to: .leading, ofView: otherView)
        )
        
        XCTAssertEqual(testView.frame.size.width, 64)
    }
    
    func test_width_fromLeadingEdgeOfViewWithOffset_toLeadingEdgeOfView() throws {
        let rootView = UIView(frame: CGRect(x: 0, y: 0, width: 414, height: 896))
        
        let otherView = UIView(frame: CGRect(x: 64, y: 64, width: 100, height: 100))
        rootView.addSubview(otherView)
        
        let testView = UIView()
        rootView.addSubview(testView)
        
        testView.buildFrame(
            FrameBuilder()
                .width(from: .leading, ofView: rootView, withOffset: 8, to: .leading, ofView: otherView)
        )
        
        XCTAssertEqual(testView.frame.size.width, 56)
    }
    
    func test_width_fromLeadingEdgeOfView_toLeadingEdgeOfViewWithOffset() throws {
        let rootView = UIView(frame: CGRect(x: 0, y: 0, width: 414, height: 896))
        
        let otherView = UIView(frame: CGRect(x: 64, y: 64, width: 100, height: 100))
        rootView.addSubview(otherView)
        
        let testView = UIView()
        rootView.addSubview(testView)
        
        testView.buildFrame(
            FrameBuilder()
                .width(from: .leading, ofView: rootView, withOffset: 0, to: .leading, ofView: otherView, withOffset: 8)
        )
        
        XCTAssertEqual(testView.frame.size.width, 56)
    }
    
    func test_width_fromLeadingEdgeOfView_toLeadingEdgeOfView_withOffsets() throws {
        let rootView = UIView(frame: CGRect(x: 0, y: 0, width: 414, height: 896))
        
        let otherView = UIView(frame: CGRect(x: 64, y: 64, width: 100, height: 100))
        rootView.addSubview(otherView)
        
        let testView = UIView()
        rootView.addSubview(testView)
        
        testView.buildFrame(
            FrameBuilder()
                .width(from: .leading, ofView: rootView, withOffset: 8, to: .leading, ofView: otherView, withOffset: 8)
        )
        
        XCTAssertEqual(testView.frame.size.width, 48)
    }
    
    func test_width_fromLeadingEdgeOfView_toTrailingEdgeOfView() throws {
        let rootView = UIView(frame: CGRect(x: 0, y: 0, width: 414, height: 896))
        
        let otherView = UIView(frame: CGRect(x: 64, y: 64, width: 100, height: 100))
        rootView.addSubview(otherView)
        
        let testView = UIView()
        rootView.addSubview(testView)
        
        testView.buildFrame(
            FrameBuilder()
                .width(from: .leading, ofView: rootView, to: .trailing, ofView: otherView)
        )
        
        XCTAssertEqual(testView.frame.size.width, 164)
    }
    
    func test_width_fromLeadingEdgeOfViewWithOffset_toTrailingEdgeOfView() throws {
        let rootView = UIView(frame: CGRect(x: 0, y: 0, width: 414, height: 896))
        
        let otherView = UIView(frame: CGRect(x: 64, y: 64, width: 100, height: 100))
        rootView.addSubview(otherView)
        
        let testView = UIView()
        rootView.addSubview(testView)
        
        testView.buildFrame(
            FrameBuilder()
                .width(from: .leading, ofView: rootView, withOffset: 8, to: .trailing, ofView: otherView)
        )
        
        XCTAssertEqual(testView.frame.size.width, 156)
    }
    
    func test_width_fromLeadingEdgeOfView_toTrailingEdgeOfViewWithOffset() throws {
        let rootView = UIView(frame: CGRect(x: 0, y: 0, width: 414, height: 896))
        
        let otherView = UIView(frame: CGRect(x: 64, y: 64, width: 100, height: 100))
        rootView.addSubview(otherView)
        
        let testView = UIView()
        rootView.addSubview(testView)
        
        testView.buildFrame(
            FrameBuilder()
                .width(from: .leading, ofView: rootView, withOffset: 0, to: .trailing, ofView: otherView, withOffset: 8)
        )
        
        XCTAssertEqual(testView.frame.size.width, 156)
    }
    
    func test_width_fromLeadingEdgeOfView_toTrailingEdgeOfView_withOffsets() throws {
        let rootView = UIView(frame: CGRect(x: 0, y: 0, width: 414, height: 896))
        
        let otherView = UIView(frame: CGRect(x: 64, y: 64, width: 100, height: 100))
        rootView.addSubview(otherView)
        
        let testView = UIView()
        rootView.addSubview(testView)
        
        testView.buildFrame(
            FrameBuilder()
                .width(from: .leading, ofView: rootView, withOffset: 8, to: .trailing, ofView: otherView, withOffset: 8)
        )
        
        XCTAssertEqual(testView.frame.size.width, 148)
    }
    
    func test_width_fromTrailingEdgeOfView_toLeadingEdgeOfView() throws {
        let rootView = UIView(frame: CGRect(x: 0, y: 0, width: 414, height: 896))
        
        let otherViewA = UIView(frame: CGRect(x: 64, y: 64, width: 100, height: 100))
        rootView.addSubview(otherViewA)
        
        let otherViewB = UIView(frame: CGRect(x: 207, y: 64, width: 100, height: 100))
        rootView.addSubview(otherViewB)
        
        let testView = UIView()
        rootView.addSubview(testView)
        
        testView.buildFrame(
            FrameBuilder()
                .width(from: .trailing, ofView: otherViewA, to: .leading, ofView: otherViewB)
        )
        
        XCTAssertEqual(testView.frame.size.width, 43)
    }
    
    func test_width_fromTrailingEdgeOfViewWithOffset_toLeadingEdgeOfView() throws {
        let rootView = UIView(frame: CGRect(x: 0, y: 0, width: 414, height: 896))
        
        let otherViewA = UIView(frame: CGRect(x: 64, y: 64, width: 100, height: 100))
        rootView.addSubview(otherViewA)
        
        let otherViewB = UIView(frame: CGRect(x: 207, y: 64, width: 100, height: 100))
        rootView.addSubview(otherViewB)
        
        let testView = UIView()
        rootView.addSubview(testView)
        
        testView.buildFrame(
            FrameBuilder()
                .width(from: .trailing, ofView: otherViewA, withOffset: 8, to: .leading, ofView: otherViewB)
        )
        
        XCTAssertEqual(testView.frame.size.width, 35)
    }
    
    func test_width_fromTrailingEdgeOfView_toLeadingEdgeOfViewWithOffset() throws {
        let rootView = UIView(frame: CGRect(x: 0, y: 0, width: 414, height: 896))
        
        let otherViewA = UIView(frame: CGRect(x: 64, y: 64, width: 100, height: 100))
        rootView.addSubview(otherViewA)
        
        let otherViewB = UIView(frame: CGRect(x: 207, y: 64, width: 100, height: 100))
        rootView.addSubview(otherViewB)
        
        let testView = UIView()
        rootView.addSubview(testView)
        
        testView.buildFrame(
            FrameBuilder()
                .width(from: .trailing, ofView: otherViewA, withOffset: 0, to: .leading, ofView: otherViewB, withOffset: 8)
        )
        
        XCTAssertEqual(testView.frame.size.width, 35)
    }
    
    func test_width_fromTrailingEdgeOfView_toLeadingEdgeOfView_withOffsets() throws {
        let rootView = UIView(frame: CGRect(x: 0, y: 0, width: 414, height: 896))
        
        let otherViewA = UIView(frame: CGRect(x: 64, y: 64, width: 100, height: 100))
        rootView.addSubview(otherViewA)
        
        let otherViewB = UIView(frame: CGRect(x: 207, y: 64, width: 100, height: 100))
        rootView.addSubview(otherViewB)
        
        let testView = UIView()
        rootView.addSubview(testView)
        
        testView.buildFrame(
            FrameBuilder()
                .width(from: .trailing, ofView: otherViewA, withOffset: 8, to: .leading, ofView: otherViewB, withOffset: 8)
        )
        
        XCTAssertEqual(testView.frame.size.width, 27)
    }
    
    func test_width_fromTrailingEdgeOfView_toTrailingEdgeOfView() throws {
        let rootView = UIView(frame: CGRect(x: 0, y: 0, width: 414, height: 896))
        
        let otherViewA = UIView(frame: CGRect(x: 64, y: 64, width: 100, height: 100))
        rootView.addSubview(otherViewA)
        
        let otherViewB = UIView(frame: CGRect(x: 207, y: 64, width: 100, height: 100))
        rootView.addSubview(otherViewB)
        
        let testView = UIView()
        rootView.addSubview(testView)
        
        testView.buildFrame(
            FrameBuilder()
                .width(from: .trailing, ofView: otherViewA, to: .trailing, ofView: otherViewB)
        )
        
        XCTAssertEqual(testView.frame.size.width, 143)
    }
    
    func test_width_fromTrailingEdgeOfViewWithOffset_toTrailingEdgeOfView() throws {
        let rootView = UIView(frame: CGRect(x: 0, y: 0, width: 414, height: 896))
        
        let otherViewA = UIView(frame: CGRect(x: 64, y: 64, width: 100, height: 100))
        rootView.addSubview(otherViewA)
        
        let otherViewB = UIView(frame: CGRect(x: 207, y: 64, width: 100, height: 100))
        rootView.addSubview(otherViewB)
        
        let testView = UIView()
        rootView.addSubview(testView)
        
        testView.buildFrame(
            FrameBuilder()
                .width(from: .trailing, ofView: otherViewA, withOffset: 8, to: .trailing, ofView: otherViewB)
        )
        
        XCTAssertEqual(testView.frame.size.width, 135)
    }
    
    func test_width_fromTrailingEdgeOfView_toTrailingEdgeOfViewWithOffset() throws {
        let rootView = UIView(frame: CGRect(x: 0, y: 0, width: 414, height: 896))
        
        let otherViewA = UIView(frame: CGRect(x: 64, y: 64, width: 100, height: 100))
        rootView.addSubview(otherViewA)
        
        let otherViewB = UIView(frame: CGRect(x: 207, y: 64, width: 100, height: 100))
        rootView.addSubview(otherViewB)
        
        let testView = UIView()
        rootView.addSubview(testView)
        
        testView.buildFrame(
            FrameBuilder()
                .width(from: .trailing, ofView: otherViewA, withOffset: 0, to: .trailing, ofView: otherViewB, withOffset: 8)
        )
        
        XCTAssertEqual(testView.frame.size.width, 135)
    }
    
    func test_width_fromTrailingEdgeOfView_toTrailingEdgeOfView_withOffsets() throws {
        let rootView = UIView(frame: CGRect(x: 0, y: 0, width: 414, height: 896))
        
        let otherViewA = UIView(frame: CGRect(x: 64, y: 64, width: 100, height: 100))
        rootView.addSubview(otherViewA)
        
        let otherViewB = UIView(frame: CGRect(x: 207, y: 64, width: 100, height: 100))
        rootView.addSubview(otherViewB)
        
        let testView = UIView()
        rootView.addSubview(testView)
        
        testView.buildFrame(
            FrameBuilder()
                .width(from: .trailing, ofView: otherViewA, withOffset: 8, to: .trailing, ofView: otherViewB, withOffset: 8)
        )
        
        XCTAssertEqual(testView.frame.size.width, 127)
    }
    
    func test_width_equalToView() throws {
        let rootView = UIView(frame: CGRect(x: 0, y: 0, width: 414, height: 896))
        
        let otherView = UIView(frame: CGRect(x: 64, y: 64, width: 100, height: 100))
        rootView.addSubview(otherView)
        
        let testView = UIView()
        rootView.addSubview(testView)
        
        testView.buildFrame(
            FrameBuilder()
                .width(equalTo: otherView)
        )
        
        XCTAssertEqual(testView.frame.size.width, 100)
    }
    
}
