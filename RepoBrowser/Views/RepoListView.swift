// Created for RepoBrowser on 11/16/20 
// Using Swift 5.0 
// Running on macOS 11.0
// Qapla'
//

import SwiftUI

struct RepoListView: View {
  var language: String
  
  @ObservedObject var viewModel = RepoViewModel()
  @State var searchField: String = ""
  @State var displayedRepos = [Repository]()
  
  var body: some View {
    
    let binding = Binding<String>(get: {
      self.searchField
    }, set: {
      self.searchField = $0
      self.viewModel.search(searchText: self.searchField)
      self.displayRepos()
    })
    
    return NavigationView {
      VStack {
        TextField("Search", text: binding)
          .padding(.leading)
          .padding(.top, 5)
        List(displayedRepos) { repository in
          NavigationLink(
            destination: WebView(request: URLRequest(url:URL(string: repository.htmlURL)!))
              .navigationBarTitle(repository.name)) {
            RepositoryRowView(repository: repository)
          }
        }.navigationBarTitle("\(language.capitalized) Repos", displayMode: .inline)
        Spacer()
      }.onAppear(perform: loadData)
    }
    .navigationBarTitle("More languages", displayMode: .inline)
  }

  func loadData() {
    Parser(language: language).fetchRepositories { (repos) in
      self.viewModel.repos = repos
      self.displayedRepos = repos
    }
  }

  func displayRepos() {
    if searchField == "" {
      displayedRepos = viewModel.repos
    } else {
      displayedRepos = viewModel.filteredRepos
    }
  }
}

struct RepoListView_Previews: PreviewProvider {
    static var previews: some View {
      RepoListView(language: "swift")
    }
}
