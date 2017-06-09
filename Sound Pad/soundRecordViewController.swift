//
//  soundRecordViewController.swift
//  Sound Pad
//
//  Created by Karthik Thirunavukkarasan on 6/8/17.
//  Copyright © 2017 Karthik Thiru. All rights reserved.
//

import UIKit
import AVFoundation

class soundRecordViewController: UIViewController {
    
    @IBOutlet weak var recordButton: UIButton!
    @IBOutlet weak var soundName: UITextField!
    
    var audioRecorder : AVAudioRecorder?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupRecorder()
        
        // Do any additional setup after loading the view.
    }
    
    func setupRecorder(){
        
        do{
            //create an audio session
            let session = AVAudioSession.sharedInstance()
            try session.setCategory(AVAudioSessionCategoryPlayAndRecord)
            try session.overrideOutputAudioPort(.speaker)
            try session.setActive(true)
            
            //create the url fro the audio file
            let basePath : String = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
            let pathComponents = [basePath, "audio.m4a"]
            let audioURL = NSURL.fileURL(withPathComponents: pathComponents)!
           
            
            //create setting for the audio recorder
            
            var settings : [String:Any] = [:]
            settings[AVFormatIDKey] = Int(kAudioFormatMPEG4AAC)
            settings[AVSampleRateKey] = 44100.0
            settings[AVNumberOfChannelsKey] = 2
            
            //create audio recorder object
            
            
            audioRecorder = try AVAudioRecorder(url:audioURL, settings: settings)
            audioRecorder?.prepareToRecord()
            
        }catch let error as NSError{
            print(error)
        }
    }
    
        @IBAction func recordButtonTapped(_ sender: Any) {
        }
        @IBAction func playTapped(_ sender: Any) {
        }
        @IBAction func AddTapped(_ sender: Any) {
        }
}
