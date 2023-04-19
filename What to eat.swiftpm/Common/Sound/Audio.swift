//
//  File.swift
//  
//
//  Created by Hieu Vuong on 2023-04-18.
//

import Foundation
import AVFoundation
var audioPlayer: AVAudioPlayer?
var audioPlayer2: AVAudioPlayer?
func playSound(sound: String, type: String) {
    if let path = Bundle.main.path(forResource: sound, ofType: type) {
        do {
            audioPlayer2 = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
            audioPlayer2?.play()
        } catch {
            print("ERROR")
        }
    }
    else {
        print("NO SOUND")
    }
}
func playInfiniteSound(sound: String, type: String) {
    if let path = Bundle.main.path(forResource: sound, ofType: type) {
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
            audioPlayer?.numberOfLoops = -1
            audioPlayer?.play()
        } catch {
            print("ERROR")
        }
    }
    else {
        print("NO SOUND")
    }
}
