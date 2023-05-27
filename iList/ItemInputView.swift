//
//  ItemInputView.swift
//  iList
//
//  Created by Jason Wise on 5/27/23.
//

import SwiftUI

// TODO - make this better
struct CustomTextFieldStyle: TextFieldStyle {
  func _body(configuration: TextField<Self._Label>) -> some View {
    configuration
      .padding(10)
      .background(
        RoundedRectangle(cornerRadius: 5)
          .stroke(Color.orange, lineWidth: 1)
      )
  }
}

struct ItemInputView: View {
  @Environment(\.managedObjectContext) private var viewContext
  
  @State private var item: String = ""
  var body: some View {
    
    ZStack(alignment: .trailing) {
      TextField("Add to list", text: $item)
        .textFieldStyle(CustomTextFieldStyle())
        .padding()
      HStack {
        Spacer()
        Button(action: {
          // Perform action when the button is tapped
          // For example, you can clear the text field
          addItem(item: item)
        }) {
          Image(systemName: "plus.app")
            .foregroundColor(.gray)
            .font(.system(size: 32))
            .padding(.trailing, 24)
            .fontWeight(/*@START_MENU_TOKEN@*/.thin/*@END_MENU_TOKEN@*/)
        }
      }
    }
    
  }
  
  private func addItem(item: String) {
    withAnimation {
      let newItem = Item(context: viewContext)
      newItem.name = item
      
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

struct ItemInputView_Previews: PreviewProvider {
  static var previews: some View {
    ItemInputView()
  }
}