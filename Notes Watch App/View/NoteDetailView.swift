//
//  NoteDetailView.swift
//  Notes Watch App
//
//  Created by Jozek Andrzej Hajduk Sanchez on 22/12/24.
//

import SwiftUI

struct NoteDetailView: View {
    
    // MARK: - Properties
    let note: Note
    let count: Int
    let index: Int
    
    @State private var isCreditsPresented : Bool = false
    
    // MARK: - Body
    var body: some View {
        VStack(alignment: .center, spacing: 3) {
            HeaderView()
            Spacer()
            ScrollView(.vertical) {
                Text(note.text)
                    .font(.title3)
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.center)
            }
            Spacer()
            HStack(alignment: .center) {
                Image(systemName: "gear")
                    .imageScale(.large)
                Spacer()
                Text("\(index + 1) / \(count)")
                Spacer()
                Image(systemName: "info.circle")
                    .imageScale(.large)
                    .onTapGesture {
                        isCreditsPresented.toggle()
                    }
                    .sheet(isPresented: $isCreditsPresented) {
                        CreditsView()
                    }
            }
            .foregroundStyle(.secondary)
        }
        .padding(3)
    }
}

#Preview {
    NoteDetailView(note: previewNote, count: 5, index: 0)
}
