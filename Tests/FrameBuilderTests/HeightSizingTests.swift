import XCTest
@testable import FrameBuilder

final class HeightSizingTests: XCTestCase {
    
    func test_height() throws {
        let rootView = UIView(frame: CGRect(x: 0, y: 0, width: 414, height: 896))
        
        let testView = UIView()
        rootView.addSubview(testView)
        
        testView.buildFrame(
            FrameBuilder()
                .height(100)
        )
        
        XCTAssertEqual(testView.frame.size.height, 100)
    }
    
    func test_height_fromTopEdgeOfView_toTopEdgeOfView() throws {
        let rootView = UIView(frame: CGRect(x: 0, y: 0, width: 414, height: 896))
        
        let otherView = UIView(frame: CGRect(x: 12, y: 64, width: 100, height: 100))
        rootView.addSubview(otherView)
        
        let testView = UIView()
        rootView.addSubview(testView)
        
        testView.buildFrame(
            FrameBuilder()
                .height(from: .top, ofView: rootView, to: .top, ofView: otherView)
        )
        
        XCTAssertEqual(testView.frame.size.height, 64)
    }
    
    func test_height_fromTopEdgeOfViewWithOffset_toTopEdgeOfView() throws {
        let rootView = UIView(frame: CGRect(x: 0, y: 0, width: 414, height: 896))
        
        let otherView = UIView(frame: CGRect(x: 12, y: 64, width: 100, height: 100))
        rootView.addSubview(otherView)
        
        let testView = UIView()
        rootView.addSubview(testView)
        
        testView.buildFrame(
            FrameBuilder()
                .height(from: .top, ofView: rootView, withOffset: 8, to: .top, ofView: otherView)
        )
        
        XCTAssertEqual(testView.frame.size.height, 56)
    }
    
    func test_height_fromTopEdgeOfView_toTopEdgeOfViewWithOffset() throws {
        let rootView = UIView(frame: CGRect(x: 0, y: 0, width: 414, height: 896))
        
        let otherView = UIView(frame: CGRect(x: 12, y: 64, width: 100, height: 100))
        rootView.addSubview(otherView)
        
        let testView = UIView()
        rootView.addSubview(testView)
        
        testView.buildFrame(
            FrameBuilder()
                .height(from: .top, ofView: rootView, withOffset: 0, to: .top, ofView: otherView, withOffset: 8)
        )
        
        XCTAssertEqual(testView.frame.size.height, 56)
    }
    
    func test_height_fromTopEdgeOfView_toTopEdgeOfView_withOffsets() throws {
        let rootView = UIView(frame: CGRect(x: 0, y: 0, width: 414, height: 896))
        
        let otherView = UIView(frame: CGRect(x: 12, y: 64, width: 100, height: 100))
        rootView.addSubview(otherView)
        
        let testView = UIView()
        rootView.addSubview(testView)
        
        testView.buildFrame(
            FrameBuilder()
                .height(from: .top, ofView: rootView, withOffset: 8, to: .top, ofView: otherView, withOffset: 8)
        )
        
        XCTAssertEqual(testView.frame.size.height, 48)
    }
    
    func test_height_fromTopEdgeOfView_toBottomEdgeOfView() throws {
        let rootView = UIView(frame: CGRect(x: 0, y: 0, width: 414, height: 896))
        
        let otherView = UIView(frame: CGRect(x: 12, y: 64, width: 100, height: 100))
        rootView.addSubview(otherView)
        
        let testView = UIView()
        rootView.addSubview(testView)
        
        testView.buildFrame(
            FrameBuilder()
                .height(from: .top, ofView: rootView, to: .bottom, ofView: otherView)
        )
        
        XCTAssertEqual(testView.frame.size.height, 164)
    }
    
    func test_height_fromTopEdgeOfViewWithOffset_toBottomEdgeOfView() throws {
        let rootView = UIView(frame: CGRect(x: 0, y: 0, width: 414, height: 896))
        
        let otherView = UIView(frame: CGRect(x: 12, y: 64, width: 100, height: 100))
        rootView.addSubview(otherView)
        
        let testView = UIView()
        rootView.addSubview(testView)
        
        testView.buildFrame(
            FrameBuilder()
                .height(from: .top, ofView: rootView, withOffset: 8, to: .bottom, ofView: otherView)
        )
        
        XCTAssertEqual(testView.frame.size.height, 156)
    }
    
    func test_height_fromTopEdgeOfView_toBottomEdgeOfViewWithOffset() throws {
        let rootView = UIView(frame: CGRect(x: 0, y: 0, width: 414, height: 896))
        
        let otherView = UIView(frame: CGRect(x: 12, y: 64, width: 100, height: 100))
        rootView.addSubview(otherView)
        
        let testView = UIView()
        rootView.addSubview(testView)
        
        testView.buildFrame(
            FrameBuilder()
                .height(from: .top, ofView: rootView, withOffset: 0, to: .bottom, ofView: otherView, withOffset: 8)
        )
        
        XCTAssertEqual(testView.frame.size.height, 156)
    }
    
    func test_height_fromTopEdgeOfView_toBottomEdgeOfView_withOffsets() throws {
        let rootView = UIView(frame: CGRect(x: 0, y: 0, width: 414, height: 896))
        
        let otherView = UIView(frame: CGRect(x: 12, y: 64, width: 100, height: 100))
        rootView.addSubview(otherView)
        
        let testView = UIView()
        rootView.addSubview(testView)
        
        testView.buildFrame(
            FrameBuilder()
                .height(from: .top, ofView: rootView, withOffset: 8, to: .bottom, ofView: otherView, withOffset: 8)
        )
        
        XCTAssertEqual(testView.frame.size.height, 148)
    }
    
    func test_height_fromBottomEdgeOfView_toTopEdgeOfView() throws {
        let rootView = UIView(frame: CGRect(x: 0, y: 0, width: 414, height: 896))
        
        let otherViewA = UIView(frame: CGRect(x: 12, y: 64, width: 100, height: 100))
        rootView.addSubview(otherViewA)
        
        let otherViewB = UIView(frame: CGRect(x: 12, y: 320, width: 100, height: 100))
        rootView.addSubview(otherViewB)
        
        let testView = UIView()
        rootView.addSubview(testView)
        
        testView.buildFrame(
            FrameBuilder()
                .height(from: .bottom, ofView: otherViewA, to: .top, ofView: otherViewB)
        )
        
        XCTAssertEqual(testView.frame.size.height, 156)
    }
    
    func test_height_fromBottomEdgeOfViewWithOffset_toTopEdgeOfView() throws {
        let rootView = UIView(frame: CGRect(x: 0, y: 0, width: 414, height: 896))
        
        let otherViewA = UIView(frame: CGRect(x: 12, y: 64, width: 100, height: 100))
        rootView.addSubview(otherViewA)
        
        let otherViewB = UIView(frame: CGRect(x: 12, y: 320, width: 100, height: 100))
        rootView.addSubview(otherViewB)
        
        let testView = UIView()
        rootView.addSubview(testView)
        
        testView.buildFrame(
            FrameBuilder()
                .height(from: .bottom, ofView: otherViewA, withOffset: 8, to: .top, ofView: otherViewB)
        )
        
        XCTAssertEqual(testView.frame.size.height, 148)
    }
    
    func test_height_fromBottomEdgeOfView_toTopEdgeOfViewWithOffset() throws {
        let rootView = UIView(frame: CGRect(x: 0, y: 0, width: 414, height: 896))
        
        let otherViewA = UIView(frame: CGRect(x: 12, y: 64, width: 100, height: 100))
        rootView.addSubview(otherViewA)
        
        let otherViewB = UIView(frame: CGRect(x: 12, y: 320, width: 100, height: 100))
        rootView.addSubview(otherViewB)
        
        let testView = UIView()
        rootView.addSubview(testView)
        
        testView.buildFrame(
            FrameBuilder()
                .height(from: .bottom, ofView: otherViewA, withOffset: 0, to: .top, ofView: otherViewB, withOffset: 8)
        )
        
        XCTAssertEqual(testView.frame.size.height, 148)
    }
    
    func test_height_fromBottomEdgeOfView_toTopEdgeOfView_withOffsets() throws {
        let rootView = UIView(frame: CGRect(x: 0, y: 0, width: 414, height: 896))
        
        let otherViewA = UIView(frame: CGRect(x: 12, y: 64, width: 100, height: 100))
        rootView.addSubview(otherViewA)
        
        let otherViewB = UIView(frame: CGRect(x: 12, y: 320, width: 100, height: 100))
        rootView.addSubview(otherViewB)
        
        let testView = UIView()
        rootView.addSubview(testView)
        
        testView.buildFrame(
            FrameBuilder()
                .height(from: .bottom, ofView: otherViewA, withOffset: 8, to: .top, ofView: otherViewB, withOffset: 8)
        )
        
        XCTAssertEqual(testView.frame.size.height, 140)
    }
    
    func test_height_fromBottomEdgeOfView_toBottomEdgeOfView() throws {
        let rootView = UIView(frame: CGRect(x: 0, y: 0, width: 414, height: 896))
        
        let otherViewA = UIView(frame: CGRect(x: 12, y: 64, width: 100, height: 100))
        rootView.addSubview(otherViewA)
        
        let otherViewB = UIView(frame: CGRect(x: 12, y: 320, width: 100, height: 100))
        rootView.addSubview(otherViewB)
        
        let testView = UIView()
        rootView.addSubview(testView)
        
        testView.buildFrame(
            FrameBuilder()
                .height(from: .bottom, ofView: otherViewA, to: .bottom, ofView: otherViewB)
        )
        
        XCTAssertEqual(testView.frame.size.height, 256)
    }
    
    func test_height_fromBottomEdgeOfViewWithOffset_toBottomEdgeOfView() throws {
        let rootView = UIView(frame: CGRect(x: 0, y: 0, width: 414, height: 896))
        
        let otherViewA = UIView(frame: CGRect(x: 12, y: 64, width: 100, height: 100))
        rootView.addSubview(otherViewA)
        
        let otherViewB = UIView(frame: CGRect(x: 12, y: 320, width: 100, height: 100))
        rootView.addSubview(otherViewB)
        
        let testView = UIView()
        rootView.addSubview(testView)
        
        testView.buildFrame(
            FrameBuilder()
                .height(from: .bottom, ofView: otherViewA, withOffset: 8, to: .bottom, ofView: otherViewB)
        )
        
        XCTAssertEqual(testView.frame.size.height, 248)
    }
    
    func test_height_fromBottomEdgeOfView_toBottomEdgeOfViewWithOffset() throws {
        let rootView = UIView(frame: CGRect(x: 0, y: 0, width: 414, height: 896))
        
        let otherViewA = UIView(frame: CGRect(x: 12, y: 64, width: 100, height: 100))
        rootView.addSubview(otherViewA)
        
        let otherViewB = UIView(frame: CGRect(x: 12, y: 320, width: 100, height: 100))
        rootView.addSubview(otherViewB)
        
        let testView = UIView()
        rootView.addSubview(testView)
        
        testView.buildFrame(
            FrameBuilder()
                .height(from: .bottom, ofView: otherViewA, withOffset: 0, to: .bottom, ofView: otherViewB, withOffset: 8)
        )
        
        XCTAssertEqual(testView.frame.size.height, 248)
    }
    
    func test_height_fromBottomEdgeOfView_toBottomEdgeOfView_withOffsets() throws {
        let rootView = UIView(frame: CGRect(x: 0, y: 0, width: 414, height: 896))
        
        let otherViewA = UIView(frame: CGRect(x: 12, y: 64, width: 100, height: 100))
        rootView.addSubview(otherViewA)
        
        let otherViewB = UIView(frame: CGRect(x: 12, y: 320, width: 100, height: 100))
        rootView.addSubview(otherViewB)
        
        let testView = UIView()
        rootView.addSubview(testView)
        
        testView.buildFrame(
            FrameBuilder()
                .height(from: .bottom, ofView: otherViewA, withOffset: 8, to: .bottom, ofView: otherViewB, withOffset: 8)
        )
        
        XCTAssertEqual(testView.frame.size.height, 240)
    }
    
    func test_height_equalToView() throws {
        let rootView = UIView(frame: CGRect(x: 0, y: 0, width: 414, height: 896))
        
        let otherView = UIView(frame: CGRect(x: 12, y: 64, width: 100, height: 100))
        rootView.addSubview(otherView)
        
        let testView = UIView()
        rootView.addSubview(testView)
        
        testView.buildFrame(
            FrameBuilder()
                .height(equalTo: otherView)
        )
        
        XCTAssertEqual(testView.frame.size.height, 100)
    }
    
}
