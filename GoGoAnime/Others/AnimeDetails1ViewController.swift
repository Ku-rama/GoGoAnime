//
//  AnimeDetails1ViewController.swift
//  GoGoAnime
//
//  Created by Makwana Bhavin on 27/05/22.
//

import UIKit
import SDWebImage

class AnimeDetails1ViewController: UIViewController {
    
    var animeDetails = Anime()
    var anime = AnimeDetailsResponse()
    
    private let animePoster: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    
    let containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemPink
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(handleDismiss))
        navigationItem.rightBarButtonItem?.tintColor = .white
        view.addSubview(animePoster)
        animePoster.sd_setImage(with: URL(string: animeDetails.cover_image ?? ""), completed: nil)
        view.addSubview(containerView)
        getAnimeDetails()
        print("Printing from viewDidload",anime)
    }
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        animePoster.frame = CGRect(x: view.frame.midX-90, y: 60, width: 180, height: 320)
        containerView.frame = CGRect(x: 0, y: animePoster.frame.maxY, width: view.frame.width, height: view.frame.height-25-view.frame.midY)
    }
    
    @objc func handleDismiss(){
        self.dismiss(animated: true, completion: nil)
    }
    
    private func getAnimeDetails(){
        guard let animeId = animeDetails.id else{
            return
        }
        APICaller.shared.getAnimeDetails(for: animeId) { result in
            switch result{
            case .success(let model):
                self.anime = model
                break
            case .failure(let err):
                print(err)
                break
            }
        }
    }
    
    
}
