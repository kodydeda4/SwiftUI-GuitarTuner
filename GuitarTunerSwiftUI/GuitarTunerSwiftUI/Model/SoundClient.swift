//
//  SoundClient.swift
//  GuitarTunerSwiftUI
//
//  Created by Kody Deda on 1/20/21.
//

import AVFoundation

struct SoundClient {
    let soundFont: SoundFont
    let audioEngine = AVAudioEngine()
    let unitSampler = AVAudioUnitSampler()
    var volume: Float = 0.5

    init(_ soundFont: SoundFont) {
        self.soundFont = soundFont
        
        // Setup AudioEngine
        audioEngine.mainMixerNode.volume = volume
        audioEngine.attach(unitSampler)
        audioEngine.connect(unitSampler, to: audioEngine.mainMixerNode, format: nil)
        
        // Load SoundFont into UnitSampler
        if let _ = try? audioEngine.start() {
            try? unitSampler.loadSoundBankInstrument(
                at: soundFont.url, program: 0,
                bankMSB: UInt8(kAUSampler_DefaultMelodicBankMSB),
                bankLSB: UInt8(kAUSampler_DefaultBankLSB)
            )
        }
    }
}

extension SoundClient {
    func play(_ note: Int) {
        unitSampler.startNote(UInt8(note), withVelocity: 80, onChannel: 0)
    }
    
    func stop(_ note: Int) {
        unitSampler.stopNote(UInt8(note), onChannel: 0)
    }
}
