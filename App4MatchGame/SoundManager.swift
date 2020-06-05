//
//  SoundManger.swift
//  App4MatchGame
//
//  Created by Nadia Mettioui on 22/04/2020.
//  Copyright © 2020 Nadia Mettioui. All rights reserved.
//

import Foundation
import  AVFoundation

class SoundManager {
    var audioPlayer: AVAudioPlayer?
    enum SoundEffect{
        case flip
        case shuffle
        case match
        case nomatch
    }
    func playSound(effect: SoundEffect) {
        var soundFilename = ""
        // Determine witch sound wil play
        // And set the appropriate filename
        switch effect {
        case .flip:
            soundFilename = "cardflip"
        case .shuffle:
            soundFilename = "shuffle"
        case .match:
            soundFilename = "dingcorrect"
        case .nomatch:
            soundFilename = "dingwrong"
            
            
        }
        let bundelPath =  Bundle.main.path(forResource: soundFilename, ofType: "wav")
        
        guard  bundelPath != nil else  {
            print("Couldn't find sound file \(soundFilename) in the bundle")
            
            return
        }
        
        //create a url obj frim this path
        let soundUrl = URL(fileURLWithPath: bundelPath!)
        
        
        do {
            //create audio player obj
            audioPlayer = try AVAudioPlayer(contentsOf: soundUrl)
            // Paly sound
            audioPlayer?.play()
            
          }
        catch {
            //Couldn t create ausi palyer, log the error
            print("Couldnt create the audio player objetc for \(soundFilename)")
        }
}
}
