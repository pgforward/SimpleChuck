//
//  jvmSpeach.swift
//  SimpleChuck
//
//  Created by Peter Forward on 3/26/22.
//

import Foundation
import AVFoundation

extension JokeViewModel {
    func textToSpeech(inputString: String) {
        
        let randomPitch = Float.random(in: 0.7 ..< 1.2)
        let randomRate = Float.random(in: 0.2 ..< 0.5)
        
        let utterance = AVSpeechUtterance(string: inputString)
        utterance.voice = AVSpeechSynthesisVoice(language: "en-US")
        utterance.pitchMultiplier = randomPitch
        utterance.rate = randomRate
        let synthesizer = AVSpeechSynthesizer()
        synthesizer.speak(utterance)
    }
}
