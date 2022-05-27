//
//  AuthViewController.swift
//  GoGoAnime
//
//  Created by Makwana Bhavin on 27/05/22.
//

import UIKit
import WebKit

class AuthViewController: UIViewController, WKNavigationDelegate {
    
    private let webView: WKWebView = {
        let pref = WKWebpagePreferences()
        pref.allowsContentJavaScript = true
        let config = WKWebViewConfiguration()
        config.defaultWebpagePreferences = pref
        let webView = WKWebView(frame: .zero, configuration: config)
        return webView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Sign In"
        webView.navigationDelegate = self
        view.addSubview(webView)
        guard let url = AuthManager.shared.signInURL else{
            return
        }
        webView.load(URLRequest(url: url))
    }
    
    // This will tell us that user has sucsessfully Signed In
    public var completionHandler: ((Bool) -> (Void))?
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        webView.frame = view.bounds
    }
    
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        guard let url = webView.url else{
            return
        }
        
        // Exchange the code for accsess token
      
        guard let component = URLComponents(string: url.absoluteString),  let code = component.queryItems?.first(where: {
            $0.name == "code"
        })?.value else{
            return
        }
        print("code: \(code)")
        
        webView.isHidden = true
        AuthManager.shared.exchangeCodeForToken(code: code) { [weak self] success in
            
            DispatchQueue.main.async {
                self?.navigationController?.popViewController(animated: true)
                self?.completionHandler?(success)
            }
            
        }
        
    }
    
}
