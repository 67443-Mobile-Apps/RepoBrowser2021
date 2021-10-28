// Created for RepoBrowser on 11/16/20 
// Using Swift 5.0 
// Running on macOS 11.0
// Qapla'
//

import SwiftUI

struct RepositoryRowView: View {
  var repository: Repository
  
  var body: some View {
    VStack(alignment: .leading) {
      Text(repository.name)
        .font(.headline)
      Text(repository.itemDescription ?? "N/A")
        .font(.subheadline)
        .lineLimit(1)
    }
  }
}

//struct RepositoryRowView_Previews: PreviewProvider {
//    static var previews: some View {
//        RepositoryRowView()
//    }
//}
