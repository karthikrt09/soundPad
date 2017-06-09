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
            
           
            
            //create setting for the audio recorder
            
            //create audio recorder object
            
            
            audioRecorder = AVAudioRecorder(url: <#T##URL#>, settings: <#T##[String : Any]#>)
        }catch{}
    }
    
        @IBAction func recordButtonTapped(_ sender: Any) {
        }
        @IBAction func playTapped(_ sender: Any) {
        }
        @IBAction func AddTapped(_ sender: Any) {
        }
}
