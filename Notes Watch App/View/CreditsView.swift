//
//  CreditsView.swift
//  Notes Watch App
//
//  Created by Jozek Andrzej Hajduk Sanchez on 22/12/24.
//

import SwiftUI

struct CreditsView: View {
    // MARK: - Properties
    @State var randomImageNumber: Int = Int.random(in: 1..<4)
    private var randomImageName: String {
        return "developer-no\(randomImageNumber)"
    }
    
    // MARK: - Body
    var body: some View {
        VStack(spacing: 3) {
            Image(randomImageName)
                .resizable()
                .scaledToFit()
                .layoutPriority(1)
            HeaderView(title: "Credits")
            Text("Some Dev")
                .foregroundStyle(.primary)
                .bold()
            Text("Developer")
                .font(.footnote)
                .foregroundStyle(.secondary)
                .fontWeight(.light)
        }
    }
}

#Preview {
    CreditsView()
}
