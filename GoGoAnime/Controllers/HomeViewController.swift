//
//  HomeViewController.swift
//  GoGoAnime
//
//  Created by Makwana Bhavin on 27/05/22.
//

import UIKit
import SDWebImage


class HomeViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate{
    
    private var anime =  [Anime]()
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return anime.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AnimeCollectionViewCell.identifier, for: indexPath) as? AnimeCollectionViewCell else{
            return UICollectionViewCell()
        }
        
        var cellAnime = Anime()
        cellAnime = anime[indexPath.row]
        if let imageUrl = URL(string: cellAnime.cover_image ?? "") {
            cell.backgroundImage.sd_setImage(with: imageUrl, completed: nil)
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let animeDetails = anime[indexPath.row] as? Anime else{
            return
        }
        let vc = AnimeDetails1ViewController()
        vc.animeDetails = animeDetails
        let navController = UINavigationController(rootViewController: vc)
        navController.modalPresentationStyle = .fullScreen
        present(navController, animated: true, completion: nil)
    }

    var animeCollectionView: UICollectionView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchData()
        view.backgroundColor = .systemBackground
        
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.minimumInteritemSpacing = 2
        layout.minimumLineSpacing = 2
//        layout.sectionInset = UIEdgeInsets(top: 1, left: 1, bottom: 1, right: 1)
        layout.itemSize = CGSize(width: (self.view.width - 4)/3 , height: 180)
        animeCollectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)
        animeCollectionView?.register(AnimeCollectionViewCell.self, forCellWithReuseIdentifier: AnimeCollectionViewCell.identifier)
        animeCollectionView?.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cellId")
        view.addSubview(animeCollectionView ?? UICollectionView())
        animeCollectionView?.delegate = self
        animeCollectionView?.dataSource = self
    }
    
    
    private func fetchData(){
        APICaller.shared.getAnime { result in
            
            DispatchQueue.main.async {
                
                switch result{
                case .success(let model):
                    self.anime = model
                    self.animeCollectionView?.reloadData()
                case .failure(let error):
                    print(error)
                }
            }
            
        }
    }
    
    
}

