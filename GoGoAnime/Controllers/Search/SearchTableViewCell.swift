//
//  Search1TableViewCell.swift
//  GoGoAnime
//
//  Created by Makwana Bhavin on 28/05/22.
//

import UIKit

class SearchTableViewCell: UITableViewCell {
    
    static let identifier = "Search1TableViewCell"
    
    let animeImageView: UIImageView = {
        let iv = UIImageView()
        iv.clipsToBounds = true
        iv.layer.cornerRadius = 28
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
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        addSubview(animeImageView)
        addSubview(animeNameLabel)
        addSubview(separatorView)
        animeImageView.frame = CGRect(x: 10, y: 5, width: 56, height: 56)
        animeNameLabel.frame = CGRect(x: animeImageView.frame.maxX+15, y: 5, width: frame.width-animeImageView.frame.width-30, height: 50)
        separatorView.frame = CGRect(x: 90, y: frame.height-0.5, width: frame.width-50, height: 0.5)
    }
    
    func configure(with anime: Anime){
        if let animeName = anime.titles, let animeImage = anime.cover_image{
            animeNameLabel.attributedText = NSMutableAttributedString(string: animeName, attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 14)])
            animeImageView.sd_setImage(with: URL(string: animeImage))
            
        }
    }

}
