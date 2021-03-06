//
//  MusiclistViewController.swift
//  TwoStepsFromHell
//
//  Created by mac011 on 2017/6/6.
//  Copyright © 2017 NQU. All rights reserved.
//

import UIKit
import SafariServices

class TrackTableViewCell: UITableViewCell{
    @IBOutlet var TrackNameLabel: UILabel!
}

class TrackViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet var TrackTableView: UITableView!
    @IBOutlet var AlbumImageView: UIImageView!
    @IBOutlet var AlbumDescriptionLabel: UILabel!
    
    var album: Album!
    var tracks: [Track]!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = album.name
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "Back", style: UIBarButtonItemStyle.plain, target: nil, action: nil)
        AlbumImageView.image = album.image
        AlbumDescriptionLabel.text = album.description
        tracks = album.tracks
    }
    
    override func viewWillAppear(_ animated: Bool) {
        UIApplication.shared.statusBarStyle = .lightContent
        
        if let indexPath = TrackTableView.indexPathForSelectedRow {
            TrackTableView.deselectRow(at: indexPath, animated: true)
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        UIApplication.shared.statusBarStyle = UIStatusBarStyle.default
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tracks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "Cell"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! TrackTableViewCell
        
        cell.TrackNameLabel.text = String(indexPath.row + 1) + ". " + tracks[indexPath.row].name
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let url = URL(string: tracks[indexPath.row].url) {
            let safariController = SFSafariViewController(url: url)
            present(safariController, animated: true, completion: nil)
        }
    }

}
