// Created for RepoBrowser on 11/16/20 
// Using Swift 5.0 
// Running on macOS 11.0
// Qapla'
//

import Foundation

class RepoViewModel: ObservableObject {

  // MARK: - Fields

  @Published var searchText: String = ""
  @Published var repos: [Repository] = []
  @Published var filteredRepos: [Repository] = []

  
  // MARK: - Methods
  
  func search(searchText: String) {
    filteredRepos = repos.filter { repo in
      return repo.name.lowercased().contains(searchText.lowercased())
    }
  }
  
}
