// Created for RepoBrowser on 10/13/21 
// Using Swift 5.0 
// Running on macOS 11.5
// Qapla'
//

import SwiftUI

struct MoreListView: View {
  private let languages = ["c", "dart", "javascript", "python"]

  var body: some View {
    return NavigationView {
      return VStack {
        Text("Additional Lanuages").fontWeight(.bold).padding(.top, 25)
        
        ForEach(languages, id: \.self) { language in
          HStack {
            NavigationLink(destination: RepoListView(language: "\(language)")) {
              Image("\(language)").padding(.leading, 20)
              Text("\(language.capitalized)")
              Spacer()
            }

          }
          .navigationBarTitle("")
          .navigationBarHidden(true)
        }

        Spacer()
        
        }
    }
  }
}

