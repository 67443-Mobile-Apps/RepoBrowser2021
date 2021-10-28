// Created for RepoBrowser on 11/16/20 
// Using Swift 5.0 
// Running on macOS 11.0
// Qapla'
//

import Foundation
import Alamofire

class Parser {

  var language: String
  var urlString: String
  
  init(language: String) {
    self.language = language
    self.urlString = "https://api.github.com/search/repositories?q=language:\(self.language.lowercased())&sort=stars&order=desc"
  }
  
  func fetchRepositories(completionHandler: @escaping ([Repository]) -> Void) {
    AF.request(self.urlString).responseDecodable(of: Repositories.self) { (response) in
      guard let repositories: Repositories = response.value else { return }
      completionHandler(repositories.items)
    }
  }

}
