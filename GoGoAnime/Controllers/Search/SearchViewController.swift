//
//  SearchViewController.swift
//  GoGoAnime
//
//  Created by Makwana Bhavin on 27/05/22.
//

import UIKit
import SwiftUI

class SearchViewController: UIViewController, UISearchBarDelegate, UISearchResultsUpdating {
    
    func updateSearchResults(for searchController: UISearchController) {
        
    }
    
    let searchController: UISearchController = {
       let sc = UISearchController(searchResultsController: SearchResultViewController())
        sc.searchBar.placeholder = "Search Here"
        sc.searchBar.searchBarStyle = .minimal
        sc.definesPresentationContext = true
        return sc
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        navigationItem.searchController = searchController
        searchController.searchBar.delegate = self
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
        guard let query = searchController.searchBar.text?.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed), !query.trimmingCharacters(in: .whitespaces).isEmpty else{
            return
        }
        
        guard let resultController = searchController.searchResultsController as? SearchResultViewController else{
            return
        }
        
        APICaller.shared.searchAnimeDetais(for: query) { result in
            DispatchQueue.main.async {
                switch result{
                case .success(let model):
                    print(model)
                    resultController.update(with: model)
                    break
                case .failure(_): break
                }
            }
        }
    }
    
    
    
    
}
