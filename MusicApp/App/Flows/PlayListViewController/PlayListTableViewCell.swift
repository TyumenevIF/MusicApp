//
//  PlayListTableViewCell.swift
//  MusicApp
//
//  Created by Ilyas Tyumenev on 04.07.2021.
//

import UIKit

class PlayListTableViewCell: UITableViewCell {
    
    let albumImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let artistNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Helvetica-Bold", size: 18)
        label.clipsToBounds = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let albumNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Helvetica", size: 17)
        label.clipsToBounds = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // MARK: - Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUI()
    }

     required init?(coder aDecoder: NSCoder) {
       super.init(coder: aDecoder)
    }
    
    func setUI() {
        contentView.addSubview(albumImageView)
        contentView.addSubview(artistNameLabel)
        contentView.addSubview(albumNameLabel)
        
        NSLayoutConstraint.activate([
            albumImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            albumImageView.heightAnchor.constraint(equalToConstant: 50.0),
            albumImageView.widthAnchor.constraint(equalToConstant: 50.0),
            
            artistNameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
            artistNameLabel.leftAnchor.constraint(equalTo: albumImageView.rightAnchor, constant: 5),
            
            albumNameLabel.topAnchor.constraint(equalTo: artistNameLabel.bottomAnchor, constant: 0),
            albumNameLabel.leftAnchor.constraint(equalTo: albumImageView.rightAnchor, constant: 5)
        ])
    }

}
