//
//  DetailViewController.swift
//  tentwenty
//
//  Created by Omeesh Sharma on 29/06/20.
//  Copyright © 2020 Omeesh Sharma. All rights reserved.
//

import UIKit


class DetailViewController: UIViewController {
    
    //MARK:- OUTLETS
    @IBOutlet weak var table: UITableView!
    
    //MARK:- VARIABLES
    var movieID : Int?
    var viewModel = DetailViewModel()
    
    let videoPlayer = VideoPlayer()
    
    //MARK:- ACTIVITY CYCLE
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.table.tableFooterView = UIView()
        
        self.viewModel.getDetails(id: self.movieID) {
            self.table.delegate = self
            self.table.dataSource = self
            self.table.reloadData()
        }
        // Do any additional setup after loading the view.
    }
    
    //MARK:- ACTIONS
    
    @objc func watchTrailer(_ sender: UIButton){
        let key = (self.viewModel.detail?.videos?.results?.first?.key ?? "")
        self.videoPlayer.playVideo(key: key)
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        self.table.reloadData()
    }
    
}

extension DetailViewController: UITableViewDelegate , UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard section != 1 else {
            return 3
        }
        return 1
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "DetailTableViewCell")as! DetailTableViewCell
        
        switch indexPath.section {
        case 0:
            if UIDevice.current.orientation.isLandscape{
                cell = tableView.dequeueReusableCell(withIdentifier: "LandscapeCell")as! DetailTableViewCell
            }else{
                cell = tableView.dequeueReusableCell(withIdentifier: "PortraitCell")as! DetailTableViewCell
            }
            
            cell.loadImage(model: self.viewModel.detail)
            cell.trailerBtn.addTarget(self, action: #selector(self.watchTrailer(_:)), for: .touchUpInside)
            
        default:
            cell = tableView.dequeueReusableCell(withIdentifier: "DetailTableViewCell")as! DetailTableViewCell
            switch indexPath.row {
            case 0:
                cell.loadDetails(model: self.viewModel.detail, type: .Genres)
            case 1:
                cell.loadDetails(model: self.viewModel.detail, type: .Date)
            default:
                cell.loadDetails(model: self.viewModel.detail, type: .Overview)
            }
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {

        return UITableView.automaticDimension
    }
    
}

