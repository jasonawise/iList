//
//  ListView.swift
//  iList
//
//  Created by Jason Wise on 5/27/23.
//

import SwiftUI
import CoreData


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
              ListItemView(ListItem: item.name ?? "")
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
