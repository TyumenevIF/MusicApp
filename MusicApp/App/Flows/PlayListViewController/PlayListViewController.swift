//
//  PlayListViewController.swift
//  MusicApp
//
//  Created by Ilyas Tyumenev on 04.07.2021.
//

import UIKit

class PlayListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    private let songs = FakeSong.getSong()
    let playListTableView = UITableView()

    // MARK: - ViewController Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableViewController()
        setPlayListTableViewCell()
        
        playListTableView.dataSource = self
        playListTableView.delegate = self
        playListTableView.register(PlayListTableViewCell.self, forCellReuseIdentifier: "playListCell")
    }
    
    func configureTableViewController() {
        self.view.backgroundColor = .systemTeal
    }
    
    func setPlayListTableViewCell() {
        view.addSubview(playListTableView)
        playListTableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            playListTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            playListTableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            playListTableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            playListTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    // MARK: - Table view data source
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return songs.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "playListCell", for: indexPath) as! PlayListTableViewCell
        let song = songs[indexPath.row]

        cell.artistNameLabel.text = song.artistName + " - " + song.name
        cell.albumNameLabel.text = song.albumName
        cell.albumImageView.image = UIImage(named: song.imageName)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let position = indexPath.row

        let playerController = PlayerViewController()
        playerController.songs = songs
        playerController.position = position
        playerController.modalPresentationStyle = .automatic
        self.present(playerController, animated: true, completion: nil)        
    }
}
