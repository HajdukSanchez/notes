//
//  SettingsView.swift
//  Notes Watch App
//
//  Created by Jozek Andrzej Hajduk Sanchez on 22/12/24.
//

import SwiftUI

struct SettingsView: View {
    // MARK: - Properties
    
    // AppStorage uses userDefaults under the hood
    @AppStorage(lineCountKey) var lineCount: Int = 1
    @State private var value: Float = 1.0
    
    // MARK: - Functions
    func updateLine() {
        lineCount = Int(value)
    }
    
    // MARK: - Body
    var body: some View {
        VStack(spacing: 8) {
            HeaderView(title: "Settings")
            Text("Lines: \(lineCount)".uppercased())
                .bold()
            // Custom binding value to update and make changes when the value changes
            Slider(value: Binding(get: {
                self.value
            }, set: { newValue in
                self.value = newValue
                self.updateLine()
            }), in: 1...4, step: 1)
                .tint(.accent)
        }
        .onAppear {
            value = Float(lineCount)
        }
    }
}

#Preview {
    SettingsView()
}
