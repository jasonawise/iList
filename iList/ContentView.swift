//
//  ContentView.swift
//  iList
//
//  Created by Jason Wise on 5/27/23.
//

import CoreData
import SwiftUI

struct ContentView: View {
 
  var body: some View {
    VStack {
      ListView()
      ItemInputView()
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
