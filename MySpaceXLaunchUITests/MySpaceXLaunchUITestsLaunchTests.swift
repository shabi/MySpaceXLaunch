//
//  MySpaceXLaunchUITestsLaunchTests.swift
//  MySpaceXLaunchUITests
//
//  Created by Shabi Naqvi on 07/08/22.
//

import XCTest

class MySpaceXLaunchUITestsLaunchTests: XCTestCase {

    override class var runsForEachTargetApplicationUIConfiguration: Bool {
        true
    }

    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    func testLaunch() throws {
        let app = XCUIApplication()
        app.launch()

        // Insert steps here to perform after app launch but before taking a screenshot,
        // such as logging into a test account or navigating somewhere in the app

        let attachment = XCTAttachment(screenshot: app.screenshot())
        attachment.name = "Launch Screen"
        attachment.lifetime = .keepAlways
        add(attachment)
    }
}

import SwiftUI

struct ScrollObserverModifier: ViewModifier {
    @Binding var isScrolling: Bool
    @State private var lastOffset: CGFloat = 0
    @State private var scrollTimer: Timer?

    func body(content: Content) -> some View {
        content
            .background(
                GeometryReader { geo in
                    Color.clear
                        .preference(key: ScrollOffsetPreferenceKey.self, value: geo.frame(in: .global).minY)
                }
                .frame(height: 0)
            )
            .onPreferenceChange(ScrollOffsetPreferenceKey.self) { offset in
                if offset != lastOffset {
                    lastOffset = offset
                    isScrolling = true

                    scrollTimer?.invalidate()
                    scrollTimer = Timer.scheduledTimer(withTimeInterval: 0.2, repeats: false) { _ in
                        isScrolling = false
                    }
                }
            }
    }
}


struct ScrollOffsetPreferenceKey: PreferenceKey {
    static var defaultValue: CGFloat = 0

    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = nextValue()
    }
}


struct ScrollOffsetPreferenceKey: PreferenceKey {
    static var defaultValue: CGFloat = 0

    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = nextValue()
    }
}


extension View {
    func onScrollActivity(_ isScrolling: Binding<Bool>) -> some View {
        self.modifier(ScrollObserverModifier(isScrolling: isScrolling))
    }
}


struct ContentView: View {
    @State private var isScrolling = false

    var body: some View {
        VStack {
            Text(isScrolling ? "Scrolling..." : "Stopped")
                .padding()

            ScrollView {
                VStack(spacing: 20) {
                    ForEach(0..<50) { i in
                        Text("Item \(i)")
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color(.systemGray6))
                            .cornerRadius(8)
                    }
                }
                .padding()
            }
            .onScrollActivity($isScrolling)
        }
    }
}
