//
//  SoundClient.swift
//  GuitarTunerSwiftUI
//
//  Created by Kody Deda on 1/20/21.
//

import AVFoundation

/// Load and play notes with a MidiSoundFont
class SoundClient {
    private let audioEngine = AVAudioEngine()
    private let unitSampler = AVAudioUnitSampler()
    private let midiSoundFont: MidiSoundFont

    init(_ midiSoundFont: MidiSoundFont, volume: Float = 0.5) {
        self.midiSoundFont = midiSoundFont
        
        audioEngine.mainMixerNode.volume = volume
        audioEngine.attach(unitSampler)
        audioEngine.connect(unitSampler, to: audioEngine.mainMixerNode, format: nil)
        if let _ = try? audioEngine.start() {
            loadSoundFont()
        }
    }

    deinit {
        if audioEngine.isRunning {
            audioEngine.disconnectNodeOutput(unitSampler)
            audioEngine.detach(unitSampler)
            audioEngine.stop()
        }
    }

    private func loadSoundFont() {
        guard let url = Bundle.main.url(
                forResource: midiSoundFont.rawValue,
                withExtension: "sf2")
        else { return }
        try? unitSampler.loadSoundBankInstrument(
            at: url, program: 0,
            bankMSB: UInt8(kAUSampler_DefaultMelodicBankMSB),
            bankLSB: UInt8(kAUSampler_DefaultBankLSB)
        )
    }

    func play(_ note: Int) {
        unitSampler.startNote(UInt8(note), withVelocity: 80, onChannel: 0)
    }

    func stop(_ note: Int) {
        unitSampler.stopNote(UInt8(note), onChannel: 0)
    }
}


extension SoundClient: Equatable {
    static func == (lhs: SoundClient, rhs: SoundClient) -> Bool {
        lhs.midiSoundFont == rhs.midiSoundFont
    }
}


