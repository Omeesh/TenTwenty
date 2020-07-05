//
//  VideoPlayer.swift
//  tentwenty
//
//  Created by Omeesh Sharma on 05/07/20.
//  Copyright © 2020 Omeesh Sharma. All rights reserved.
//

import UIKit
import youtube_ios_player_helper

class VideoPlayer: NSObject {
    
    //MARK:- VARIABLES
    static let sharedInstance = VideoPlayer()
    var player = YTPlayerView()
    
    override init() {
        super.init()
    }
    
    func playVideo(key: String) {
        self.player.frame = UIScreen.main.bounds
        self.player.load(withVideoId: key)
        self.player.delegate = self
        self.player.ignoreSwitchingByNextPrevious = true
        self.player.isHidden = true
        UIApplication.shared.windows.first?.addSubview(self.player)
        rootVC?.view.startProgresshud()
    }

}

extension VideoPlayer: YTPlayerViewDelegate {
    
    func playerViewDidBecomeReady(_ playerView: YTPlayerView) {
        playerView.playVideo()
    }
    
    func playerView(_ playerView: YTPlayerView, didPlayTime playTime: Float) {
        rootVC?.view.stopProgressHud()
    }
    
    func playerView(_ playerView: YTPlayerView, didChangeTo state: YTPlayerState) {
        switch state {
        case .ended:
            playerView.stopVideo()
            playerView.removeFromSuperview()
            
        default:
            break;
        }
    }
    
    func playerView(_ playerView: YTPlayerView, receivedError error: YTPlayerError) {
        playerView.stopVideo()
        playerView.removeFromSuperview()
        rootVC?.view.stopProgressHud()
    }
    
}
