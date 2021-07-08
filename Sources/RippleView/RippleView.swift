//
//  RippleView.swift
//
//
//  Created by Emmanuel Kehinde on 07/07/2021.
//

import SwiftUI

/// A view that shows Ripple animation based on the style defined
public struct RippleView: View {
    @State private var currentStep: Int = -1
    @State private var timer: Timer?
    @Binding private var shouldAnimate: Bool
    private var style: Style
    private var rippleCount: Int
    private var tintColor: Color
    private var timeIntervalBetweenRipples: Double

    /**
     Creates an instance with the given parameters

     - Parameters:
        - style: The chosen ripple style, defaults to `solid`
        - rippleCount: The number of ripples to display, defaults to `5`
        - tintColor: The color to tint the riple with, defaults to `black`
        - timeIntervalBetweenRipples: The expected time interval between each ripple display, defaults to `0.13`
        - shouldAnimate: A binding that tells if animation should begin or not, defaults to `true`
     */
    public init(
        style: Style = .solid,
        rippleCount: Int = 5,
        tintColor: Color = Color.black,
        timeIntervalBetweenRipples: Double = 0.13,
        shouldAnimate: Binding<Bool> = .constant(true)
    ) {
        self.style = style
        self.rippleCount = rippleCount
        self.tintColor = tintColor
        self.timeIntervalBetweenRipples = timeIntervalBetweenRipples
        self._shouldAnimate = shouldAnimate
    }

    public var body: some View {
        ZStack {
            GeometryReader { geometry in
                ZStack(alignment: .center) {
                    // To keep the ZStack in shape and initial circles at the center...
                    // even when the circle is at it's smallest size
                    Color.clear

                    if shouldAnimate {
                        circleViews(geometry: geometry)
                            .onAppear(perform: {
                                startAnimation()
                            })
                    }
                }
            }
        }
        .onDisappear(perform: {
            stopAnimation()
        })
    }

    @ViewBuilder
    private func circleViews(geometry: GeometryProxy) -> some View {
        ZStack {
            ForEach(0..<rippleCount) { index in
                if index >= currentStep {
                    Circle()
                        .strokeBorder(
                            style == .solid ? Color.clear : tintColor,
                            lineWidth: 1
                        )
                        .background(
                            Circle().foregroundColor(
                                style == .solid ? tintColor.opacity(0.3) : Color.clear
                            )
                        )
                        .frame(
                            width: geometry.size.width / (CGFloat(index) + 1),
                            height: geometry.size.height / (CGFloat(index) + 1)
                        )
                        .animation(.spring(response: 0, dampingFraction: 0, blendDuration: 1))
                        .animation(.easeInOut)
                }
            }
        }
    }

    private func startAnimation() {
        if timer != nil {
            return
        }

        currentStep = rippleCount - 1
        timer = Timer.scheduledTimer(
            withTimeInterval: timeIntervalBetweenRipples,
            repeats: true
        ) { timer in
            var nextStep = currentStep - 1
            if nextStep == -1 {
                nextStep = rippleCount - 1
            }
            withAnimation {
                currentStep = nextStep
            }
        }
    }

    private func stopAnimation() {
        timer?.invalidate()
        timer = nil
    }

    /// The available Ripple styles
    ///
    /// Value is passed during initialization
    public enum Style {
        case solid
        case outlined
    }
}

struct RippleView_Previews: PreviewProvider {
    static var previews: some View {
        RippleView()
            .frame(width: 250, height: 250, alignment: .center)
    }
}
