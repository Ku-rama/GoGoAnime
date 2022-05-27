//
//  WelcomeViewController.swift
//  GoGoAnime
//
//  Created by Makwana Bhavin on 27/05/22.
//

import UIKit

class WelcomeViewController: UIViewController {
    
    private let signInButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .white
        button.setTitle("Tap here to sign In", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Aniflix"
        view.backgroundColor = .systemPink
        view.addSubview(signInButton)
        signInButton.addTarget(self, action: #selector(didTapSignIn), for: .touchUpInside)
    }
    
    @objc func didTapSignIn(){
        let vc = AuthViewController()
        vc.completionHandler = {[weak self] success in
            DispatchQueue.main.async {
                self?.handleSignIn(success: success)
            }
            
        }
        navigationController?.pushViewController(vc, animated: true)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        signInButton.frame = CGRect(x: 20, y: view.frame.midY, width: view.frame.width-40, height: 40)
    }
    
    private func handleSignIn(success: Bool){
         // Log user in or yell at them for error
    }

}
