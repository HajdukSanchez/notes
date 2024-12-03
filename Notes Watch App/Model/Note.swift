//
//  Note.swift
//  Notes Watch App
//
//  Created by Jozek Andrzej Hajduk Sanchez on 3/12/24.
//

import Foundation

struct Note: Identifiable, Codable {
    let id: UUID
    let text: String
}
