// Created for RepoBrowser on 11/16/20 
// Using Swift 5.0 
// Running on macOS 11.0
// Qapla'
//

import SwiftUI

struct AppView: View {
  var body: some View {
    
    TabView {

      RepoListView(language: "swift")
      .tabItem {
          Image("swift_icon")
          Text("Swift")
      }

      RepoListView(language: "ruby")
      .tabItem {
          Image("ruby_icon")
          Text("Ruby")
      }
      
      RepoListView(language: "kotlin")
      .tabItem {
          Image("android-3-16")
          Text("Kotlin")
      }
      
      MoreListView()
        .tabItem {
          Image(systemName: "ellipsis").padding(.top, 100)
          Text("More")
        }
      
    }
  }
}

struct AppView_Previews: PreviewProvider {
    static var previews: some View {
        AppView()
    }
}
