//
//  View.swift
//  StartupIos
//
//  Created by haithem ghattas on 14/6/2024.
//


import SwiftUI

extension View {
    /// Apply corner radius to specific corners of a view.
    ///
    /// - Parameters:
    ///   - radius: The corner radius to apply.
    ///   - corners: The corners to round.
    ///
    /// - Returns: A modified view with corner radius applied to specified corners.
    func cornerRadius(radius: CGFloat, corners: UIRectCorner) -> some View {
        ModifiedContent(content: self, modifier: CornerRadiusStyle(radius: radius, corners: corners))
    }
    
    /// Apply a linear gradient background to a view.
    ///
    /// - Parameters:
    ///   - colors: An array of `Color` objects representing the gradient colors.
    ///   - startPoint: The starting point of the gradient. Defaults to `.top`.
    ///   - endPoint: The ending point of the gradient. Defaults to `.bottom`.
    ///
    /// - Returns: A modified view with a linear gradient background.
    func commonLinearGradient(colors: [Color], startPoint: UnitPoint = .top, endPoint: UnitPoint = .bottom) -> some View {
        self.background(
            LinearGradient(
                gradient: Gradient(colors: colors),
                startPoint: startPoint,
                endPoint: endPoint
            )
        )
    }
    func hLeading()-> some View {
        self.frame(maxWidth: .infinity,alignment: .leading)
    }
    func hTrailing()-> some View {
        self.frame(maxWidth: .infinity,alignment: .trailing)
    }
    func hCenter()-> some View {
        self.frame(maxWidth: .infinity,alignment: .center)
    }
    //MARK: Safe Area
    func getSafeArea()-> UIEdgeInsets{
        guard let screen = UIApplication.shared.connectedScenes.first as? UIWindowScene else {
            return .zero
        }
        guard let safeArea = screen.windows.first?.safeAreaInsets else {
            return .zero
        }
        return safeArea
    }
    
}
