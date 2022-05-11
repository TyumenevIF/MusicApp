//
//  PlayerViewController.swift
//  MusicApp
//
//  Created by Ilyas Tyumenev on 10.07.2021.
//

import UIKit
import AVFoundation

class PlayerViewController: UIViewController {
    
    var position: Int = 0
    var songs: [Song] = []
    var player: AVAudioPlayer?
    
    let holder = UIView()
    
    private var playerView: PlayerView = {
        PlayerView()
    }()    
    
    // MARK: - ViewController Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        if holder.subviews.count == 0 {
            configure()
        }
    }

    override func loadView() {
        self.view = playerView
        self.view.backgroundColor = .lightGray
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        if let player = player {
            player.stop()
        }
    }
    
    // MARK: - configure
    func configure() {
        let song = songs[position]
        let urlString = Bundle.main.path(forResource: song.trackName, ofType: "mp3")
        
        do {
            try AVAudioSession.sharedInstance().setMode(.default)
            try AVAudioSession.sharedInstance().setActive(true, options: .notifyOthersOnDeactivation)
            
            guard let urlString = urlString else {
                print("urlString is nil")
                return
            }
            
            player = try AVAudioPlayer(contentsOf: URL(string: urlString)!)
            
            guard let player = player else {
                print("Player is nil")
                return
            }
            player.volume = 0.5
            player.play()
        } catch {
            print("Error ocurred")
        }
        
        playerView.albumImageView.image = UIImage(named: song.imageName)
        playerView.songNameLabel.text = song.name
        playerView.albumNameLabel.text = song.albumName
        playerView.artistNameLabel.text = song.artistName
        
        playerView.backButton.addTarget(self, action: #selector(didTapBackButton), for: .touchUpInside)
        playerView.playPauseButton.addTarget(self, action: #selector(didTapPlayPauseButton), for: .touchUpInside)
        playerView.nextButton.addTarget(self, action: #selector(didTapNextButton), for: .touchUpInside)
        playerView.volumeSlider.addTarget(self, action: #selector(didChangeSlider(_:)), for: .valueChanged)
    }
    
    // MARK: - didTapPlayPauseButton
    @objc func didTapPlayPauseButton() {
        if player?.isPlaying == true {
            player?.pause()
            print("pause")
            playerView.playPauseButton.setBackgroundImage(UIImage(systemName: "play.fill"), for: .normal)
        } else {
            player?.play()
            print("play")
            playerView.playPauseButton.setBackgroundImage(UIImage(systemName: "pause.fill"), for: .normal)
        }
    }
    
    // MARK: - didTapBackButton
    @objc func didTapBackButton() {
        if position > 0 {
            position -= 1
            player?.stop()
            
            for subview in holder.subviews {
                subview.removeFromSuperview()
            }
            configure()
        }
    }
    
    // MARK: - didTapNextButton
    @objc func didTapNextButton() {
        if position < (songs.count - 1) {
            position += 1
            player?.stop()
            
            for subview in holder.subviews {
                subview.removeFromSuperview()
            }
            configure()
        }
    }
    
    // MARK: - didChangeSlider
    @objc func didChangeSlider(_ slider: UISlider) {
        let value = slider.value
        player?.volume = value
    }
}
