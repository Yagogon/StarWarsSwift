//
//  CafPlayer.swift
//  StarWarsSwift
//
//  Created by Yago de la Fuente on 14/5/15.
//  Copyright (c) 2015 cinnika. All rights reserved.
//

import UIKit
import AVFoundation


class CafPlayer: NSObject {
    
    private var player : AVAudioPlayer?
    
    func playSoundData(data : NSData) {
        
        var error : NSError?
        
        player = AVAudioPlayer(data: data, error: &error)
        player?.numberOfLoops = 0
        
        if let anError = error {
            println("Error al reproducir el error \(error)")
        } else {
            player?.play()
        }
    }
    
    func playFile(soundFile : NSURL) {
        
        let soundData = NSData(contentsOfURL: soundFile)
        
        if let sound = soundData {
            playSoundData(sound)
        }
    }
    
}
