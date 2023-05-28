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
      List {
        ForEach(items, id: \.self) { item in
          if !item.completed { ListItemView(listItem: item) }
        }
        CompletedListItemView()
        
      }.navigationTitle("List")
        .toolbar {
          ToolbarItem(placement: .navigationBarTrailing) {
            HStack {
              Image(systemName: "gear")
            }
          }
        }
    }
  }
}

struct ListView_Previews: PreviewProvider {
  static var previews: some View {
    ListView()
  }
}
