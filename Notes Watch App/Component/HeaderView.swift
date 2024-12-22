//
//  HeaderView.swift
//  Notes Watch App
//
//  Created by Jozek Andrzej Hajduk Sanchez on 22/12/24.
//

import SwiftUI

struct HeaderView: View {
    // MARK: - Properties
    var title: String = ""
    
    // MARK: - Body
    var body: some View {
        VStack {
            if (title != "") {
                Text(title.uppercased())
                    .font(.title3)
                    .bold()
                    .foregroundStyle(.accent)
            }
            HStack {
                Capsule()
                    .frame(height: 1)
                Image(systemName: "note.text")
                Capsule()
                    .frame(height: 1)
            }
            .foregroundStyle(.accent)
        }
    }
}

#Preview {
    Group {
        HeaderView()
        Divider()
        HeaderView(title: "This is a Title")
    }
}
