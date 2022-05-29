//
//  SearchResultViewController.swift
//  GoGoAnime
//
//  Created by Makwana Bhavin on 28/05/22.
//

import UIKit

class SearchResultViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    public var animeSearchResult = [Anime]()
    
    private let searchResultTableView: UITableView = {
        let tv = UITableView(frame: .zero, style: .grouped)
        tv.register(SearchTableViewCell.self, forCellReuseIdentifier: SearchTableViewCell.identifier)
        tv.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return tv
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        view.addSubview(searchResultTableView)
        searchResultTableView.delegate = self
        searchResultTableView.dataSource = self
        searchResultTableView.isHidden = true
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        searchResultTableView.frame = view.bounds
        
    }
    
    func update(with searchresult: [Anime]){
        searchResultTableView.isHidden = false
        self.animeSearchResult = searchresult
        searchResultTableView.reloadData()
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return animeSearchResult.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: SearchTableViewCell.identifier, for: indexPath) as? SearchTableViewCell else{
            return UITableViewCell()
        }
        cell.configure(with: animeSearchResult[indexPath.item])
        return cell
    }
    


}
