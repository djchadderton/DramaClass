//
//  ContentView.swift
//  DramaClass
//
//  Created by David Chadderton on 02/12/2022.
//

import SwiftUI

struct ContentView: View {
  var partyGuests = PartyGuests()
  @State private var guest: String
  @State private var listVisible: Bool = false
  
  init(partyGuests: PartyGuests = PartyGuests()) {
    self.partyGuests = partyGuests
    self.guest = self.partyGuests.next()
  }
  
  var body: some View {
    ZStack() {
      listButton
      HStack {
        
        if listVisible {
          List(partyGuests.usedGuests, id: \.self) {
            Text($0)
          }
          .padding(.top, 20)
        }
        
        
        VStack {
          Text(guest)
            .font(.custom("full", size: 64.0, relativeTo: .body))
            .fontWeight(.heavy)
            .multilineTextAlignment(.center)
            .padding()
            .onTapGesture {
              guest = partyGuests.next()
            }
        }
      }
    }
  }
  
  
  @ViewBuilder
  private var listButton: some View {
    let buttonText = listVisible ? "Hide list" : "Show list"
    
    Button {
      listVisible.toggle()
    } label: {
      Text(buttonText)
        .font(.headline)
    }
    .zIndex(1000)
    .position(x: 70, y: 30)

  }
}


struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
