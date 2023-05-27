//
//  CompletedListItemView.swift
//  iList
//
//  Created by Jason Wise on 5/27/23.
//

import CoreData
import SwiftUI

struct CompletedListItemView: View {
  @FetchRequest(
    sortDescriptors: [NSSortDescriptor(keyPath: \Item.name, ascending: true)],
    animation: .default)

  private var items: FetchedResults<Item>

  var body: some View {
    VStack {
      List {
        Section(header: Text("Completed")) {
          ForEach(items, id: \.self) { item in
            if (item.completed) {Text(item.name ?? "")}
          }
        }
      }
    }
  }
}

struct CompletedListItemView_Previews: PreviewProvider {
  static var previews: some View {
    CompletedListItemView()
  }
}
