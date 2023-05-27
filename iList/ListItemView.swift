//
//  ListItemView.swift
//  iList
//
//  Created by Jason Wise on 5/27/23.
//

import SwiftUI

struct ListItemView: View {
  @State var ListItem: String
    var body: some View {
      HStack {
        Circle()
          .foregroundColor(.orange)
          .frame(width: 20, height: 20)
          .overlay(
            Circle()
              .stroke(.black, lineWidth: 1.5)
          )
        Text(ListItem)
          .padding(5.0)
      }
    }
}

struct ListItemView_Previews: PreviewProvider {
    static var previews: some View {
        ListItemView(ListItem: "item")
    }
}
