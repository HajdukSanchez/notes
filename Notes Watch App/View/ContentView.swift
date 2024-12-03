//
//  ContentView.swift
//  Notes Watch App
//
//  Created by Jozek Andrzej Hajduk Sanchez on 3/12/24.
//

import SwiftUI

struct ContentView: View {
    
    // MARK: - Porpeties
    @State private var notes : [Note] = [Note]()
    @State private var text : String = ""
    
    // MARK: - Functions
    func saveNewNote() {
        guard text.isEmpty == false else { return }
        let newNote = Note(id: UUID(), text: text)
        notes.append(newNote)
        text = ""
    }
    
    func saveNoteLocally() {
        dump(notes)
    }
    
    // MARK: - Body
    var body: some View {
        NavigationStack {
            VStack {
                HStack(alignment: .center, spacing: 6) {
                    TextField("Add new note", text: $text)
                    Button {
                        saveNewNote()
                        saveNoteLocally()
                    } label: {
                        Image(systemName: "plus.circle")
                            .font(.system(size: 42, weight: .semibold))
                    }
                    .fixedSize()
                    .buttonStyle(PlainButtonStyle())
                    .foregroundStyle(.accent)
                }
                Spacer()
                Text("\(notes.count)")
            }
            .navigationTitle("Notes")
        }
    }
}

#Preview {
    ContentView()
}
