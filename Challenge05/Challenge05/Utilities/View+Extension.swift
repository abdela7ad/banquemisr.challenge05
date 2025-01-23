//
//  View+when.swift
//  Challenge05
//
//  Created by Abdelahad on 23/01/2025.
//

import SwiftUI
extension View {
    /// Takes in a condition and then modifies the view
    ///
    /// - Parameters:
    ///     - condition: Boolean value. View is modified when true.
    ///     - modification: Closure that supplies the current state of the view. Modify the view here.
    /// - Returns: The modified view if true. If false returns the original view.
    @ViewBuilder
    func when(_ condition: Bool, _ modification: (Self) -> some View ) -> some View {
        if condition {
            modification(self)
        } else {
            self
        }
    }
    
    @inlinable
    public func ifSome<Value>(_ value: Value?, @ViewBuilder _ modification: (Self, Value) -> some View) -> some View {
        Group {
            if let value = value {
                modification(self, value)
            } else {
                self
            }
        }
    }
}


