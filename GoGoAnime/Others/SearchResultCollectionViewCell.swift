//
//  SearchResultCollectionViewCell.swift
//  GoGoAnime
//
//  Created by Makwana Bhavin on 28/05/22.
//

import UIKit
import SDWebImage

class SearchResultTableViewCell: UITableViewCell {
    
    static let identifier = "SearchResultCollectionViewCell"
    
    let animeImageView: UIImageView = {
        let iv = UIImageView()
        iv.clipsToBounds = true
        iv.layer.cornerRadius = 33
        iv.contentMode = .scaleAspectFill
        return iv
    }()
    
    let animeNameLabel: UILabel = {
        let tf = UILabel()
        tf.numberOfLines = 0
        return tf
    }()
    
    let separatorView: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray
        return view
    }()
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        addSubview(animeImageView)
        addSubview(animeNameLabel)
        addSubview(separatorView)
        animeImageView.frame = CGRect(x: 10, y: 5, width: 66, height: 66)
        animeNameLabel.frame = CGRect(x: animeImageView.frame.maxX+15, y: 5, width: frame.width-animeImageView.frame.width-30, height: 50)
        separatorView.frame = CGRect(x: 90, y: frame.height-0.5, width: frame.width-50, height: 0.5)
    }
    
    func configure(with anime: Anime){
        if let animeName = anime.titles, let animeImage = anime.cover_image{
            animeNameLabel.attributedText = NSMutableAttributedString(string: animeName, attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 18)])
            animeImageView.sd_setImage(with: URL(string: animeImage))
            
        }
    }
    
//    override func prepareForReuse() {
//        animeNameLabel.text = ""
//        animeImageView.sd_setImage(with: URL(string: ""))
//    }
}
