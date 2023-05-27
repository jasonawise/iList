//
//  ListItemView.swift
//  iList
//
//  Created by Jason Wise on 5/27/23.
//

import SwiftUI
import CoreData

struct ListItemView: View { @Environment(\.managedObjectContext) private var viewContext
  
  @FetchRequest(
    sortDescriptors: [NSSortDescriptor(keyPath: \Item.name, ascending: true)],
    animation: .default)
  private var items: FetchedResults<Item>

  @State var listItem: Item
    var body: some View {
      HStack {
        Circle()
          .foregroundColor(.orange)
          .frame(width: 20, height: 20)
          .overlay(
            Circle()
              .stroke(.black, lineWidth: 1.5)
          )
        Text(listItem.name ?? "")
          .padding(5.0)
          .swipeActions(edge: .trailing) {
            Button(action: {
              markComplete()
            }) {
              Label("Complete", systemImage: "checkmark.circle")
            }
          }
      }
    }
  
  private func markComplete() {
    withAnimation {
      
      listItem.completed = true
      
      do {
        try viewContext.save()
      } catch {
        // Replace this implementation with code to handle the error appropriately.
        // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
        let nsError = error as NSError
        fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
      }
    }
  }
}

//struct ListItemView_Previews: PreviewProvider {
//    static var previews: some View {
//        ListItemView(listItem: <#T##Item#>)
//    }
//}
