//
//  PlayerView.swift
//  MusicApp
//
//  Created by Ilyas Tyumenev on 10.07.2021.
//

import UIKit

class PlayerView: UIView {
        
    let albumImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.masksToBounds = true
        imageView.image = UIImage(systemName: "purchased")
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    let songNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 30.0)
        label.text = "songNameLabel"
        label.textColor = .white
        label.textAlignment = .center
        return label
    }()
    
    let artistNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 20)
        label.text = "artistNameLabel"
        label.textColor = .white
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    let albumNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 20.0)
        label.text = "albumNameLabel"
        label.textColor = .white
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    let volumeSlider: UISlider = {
        let slider = UISlider()
        slider.translatesAutoresizingMaskIntoConstraints = false
        slider.layer.masksToBounds = true
        slider.tintColor = .white
        slider.value = 0.5
        return slider
    }()
    
    let backButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.masksToBounds = true
        button.setBackgroundImage(UIImage(systemName: "backward.fill"), for: .normal)
        button.tintColor = .white
        return button
    }()
    
    let playPauseButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.masksToBounds = true
        button.setBackgroundImage(UIImage(systemName: "pause.fill"), for: .normal)
        button.tintColor = .white
        return button
    }()
    
    let nextButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.masksToBounds = true
        button.setBackgroundImage(UIImage(systemName: "forward.fill"), for: .normal)
        button.tintColor = .white
        return button
    }()
    
    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUI() {
        addSubview(albumImageView)
        addSubview(songNameLabel)
        addSubview(artistNameLabel)
        addSubview(albumNameLabel)
        addSubview(volumeSlider)
        addSubview(backButton)
        addSubview(playPauseButton)
        addSubview(nextButton)
        
        NSLayoutConstraint.activate([
            albumImageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 10),
            albumImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            albumImageView.heightAnchor.constraint(equalToConstant: 270.0),
            albumImageView.widthAnchor.constraint(equalToConstant: 270.0),
            
            songNameLabel.topAnchor.constraint(equalTo: albumImageView.bottomAnchor, constant: 15),
            songNameLabel.centerXAnchor.constraint(equalTo: centerXAnchor),

            artistNameLabel.topAnchor.constraint(equalTo: songNameLabel.bottomAnchor, constant: 15),
            artistNameLabel.centerXAnchor.constraint(equalTo: centerXAnchor),

            albumNameLabel.topAnchor.constraint(equalTo: artistNameLabel.bottomAnchor, constant: 15),
            albumNameLabel.centerXAnchor.constraint(equalTo: centerXAnchor),

            backButton.topAnchor.constraint(equalTo: albumNameLabel.bottomAnchor, constant: 40.0),
            backButton.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor, constant: 50),

            playPauseButton.topAnchor.constraint(equalTo: albumNameLabel.bottomAnchor, constant: 40),
            playPauseButton.centerXAnchor.constraint(equalTo: centerXAnchor),

            nextButton.topAnchor.constraint(equalTo: albumNameLabel.bottomAnchor, constant: 40),
            nextButton.rightAnchor.constraint(equalTo: safeAreaLayoutGuide.rightAnchor, constant: -50),
            
            volumeSlider.topAnchor.constraint(equalTo: playPauseButton.bottomAnchor, constant: 40),
            volumeSlider.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor, constant: 30),
            volumeSlider.rightAnchor.constraint(equalTo: safeAreaLayoutGuide.rightAnchor, constant: -30),
        ])
    }
    
}
