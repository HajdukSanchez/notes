//
//  ContentView.swift
//  Notes Watch App
//
//  Created by Jozek Andrzej Hajduk Sanchez on 3/12/24.
//

import SwiftUI

struct ContentView: View {
    
    // MARK: - Porpeties
    @AppStorage(lineCountKey) var lineCount: Int = 1
    @State private var notes : [Note] = [Note]()
    @State private var text : String = ""
    
    // MARK: - Functions
    
    // Create the note to save
    func createSavingNote() {
        guard text.isEmpty == false else { return }
        let newNote = Note(id: UUID(), text: text)
        notes.append(newNote)
        text = ""
    }
    
    // Get the directory assigned to the app, in order to save and get data there
    func getDocumentDirectory() -> URL {
        let path = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return path[0]
    }
    
    // Save the notes locally
    func saveNoteLocally() {
        do {
            let data = try JSONEncoder().encode(notes)
            let url = getDocumentDirectory().appendingPathComponent("notes")
            try data.write(to: url)
        } catch {
            print("Saving data fails")
        }
    }
    
    // Load the saved notes locally
    func loadNotesLocally() {
        DispatchQueue.main.async {
            do {
                let url = getDocumentDirectory().appendingPathComponent("notes")
                let data = try Data(contentsOf: url)
                notes = try JSONDecoder().decode([Note].self, from: data)
            } catch {
                print("No data yet")
            }
        }
    }
    
    func deleteNote(offsets: IndexSet) {
        withAnimation {
            notes.remove(atOffsets: offsets)
            saveNoteLocally()
        }
    }
    
    // MARK: - Body
    var body: some View {
        NavigationStack {
            VStack {
                HStack(alignment: .center, spacing: 6) {
                    TextField("Add new note", text: $text)
                    Button {
                        createSavingNote()
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
                if notes.count >= 1 {
                    List {
                        ForEach(0..<notes.count, id: \.self) { index in
                            let note = notes[index]
                            
                            NavigationLink {
                                NoteDetailView(note: note, count: notes.count, index: index)
                            } label: {
                                HStack {
                                    Capsule()
                                        .frame(width: 4)
                                        .foregroundStyle(Color.accentColor)
                                    Text(note.text)
                                        .lineLimit(lineCount)
                                        .padding(.leading, 5)
                                }
                            }

                        }
                        .onDelete(perform: deleteNote)
                    }
                } else {
                    Spacer()
                    Image(systemName: "note.text")
                        .resizable()
                        .scaledToFit()
                        .foregroundStyle(.gray)
                        .opacity(0.25)
                        .padding(25)
                    Spacer()
                }
            }
            .navigationTitle("Notes")
            .onAppear {
                loadNotesLocally()
            }
        }
    }
}

#Preview {
    ContentView()
}
