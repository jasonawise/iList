//
//  ListView.swift
//  iList
//
//  Created by Jason Wise on 5/27/23.
//

import CoreData
import SwiftUI

struct ListView: View {
  @FetchRequest(
    sortDescriptors: [NSSortDescriptor(keyPath: \Item.name, ascending: true)],
    animation: .default)
  private var items: FetchedResults<Item>

  var body: some View {
    NavigationView {
      VStack {
        List {
          ForEach(items, id: \.self) { item in
            if (!item.completed) {ListItemView(listItem: item)}
          }
        }
      }
    }
    .navigationTitle("List")
  }
}

struct ListView_Previews: PreviewProvider {
  static var previews: some View {
    ListView()
  }
}
