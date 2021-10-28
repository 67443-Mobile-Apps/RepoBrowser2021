// Created for RepoBrowser on 11/16/20 
// Using Swift 5.0 
// Running on macOS 11.0
// Qapla'
//

import SwiftUI
import WebKit

struct WebView: UIViewRepresentable {

  let request: URLRequest

  func makeUIView(context: Context) -> WKWebView  {
    return WKWebView()
  }

  func updateUIView(_ uiView: WKWebView, context: Context) {
    uiView.load(request)
  }

}

//struct WebView_Previews: PreviewProvider {
//  static var previews: some View {
//    WebView(request: URLRequest(url: URL(string: "https://www.github.com")!))
//  }
//}
