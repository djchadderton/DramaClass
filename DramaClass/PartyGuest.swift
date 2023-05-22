//
//  PartyGuest.swift
//  DramaClass
//
//  Created by David Chadderton on 02/12/2022.
//

import Foundation

class PartyGuests: Codable, Identifiable {
  var guests: [String]
  var usedGuests: [String] {
    get {
      if pointer > 0 {
        return guests[..<pointer].map {String($0)}
      } else {
        return []
      }
    }
  }
  private var pointer = 0
  
  init() {
    guests = Bundle.main.decode("PartyGuests.json")
    guests.shuffle()
  }
  
  func next() -> String {
    let nextItem = guests[pointer]
    pointer += 1
    return nextItem
  }
  
}
