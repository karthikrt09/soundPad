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
    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var addButton: UIButton!
    
    var audioRecorder : AVAudioRecorder?
    var audioPlayer : AVAudioPlayer?
    var audioURL:URL?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupRecorder()
        playButton.isEnabled = false
        addButton.isEnabled = false
        
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
            audioURL = NSURL.fileURL(withPathComponents: pathComponents)!
            
            //create setting for the audio recorder
            
            var settings : [String:Any] = [:]
            settings[AVFormatIDKey] = Int(kAudioFormatMPEG4AAC)
            settings[AVSampleRateKey] = 44100.0
            settings[AVNumberOfChannelsKey] = 2
            
            //create audio recorder object
            
            
            audioRecorder = try AVAudioRecorder(url:audioURL!, settings: settings)
            audioRecorder?.prepareToRecord()
            
        }catch let error as NSError{
            print(error)
        }
    }
    
        @IBAction func recordButtonTapped(_ sender: Any) {
            
            if audioRecorder!.isRecording{
                // Stop the recording
                audioRecorder?.stop()
                
                //Change the button to Record
                recordButton.setTitle("Record", for: .normal)
                playButton.isEnabled = true
                addButton.isEnabled = true
                
            }else{
                
                // Start the recording
                audioRecorder?.record()
                
                //Change the button to Stop
                recordButton.setTitle("Stop", for: .normal)
            }
            
        }
        @IBAction func playTapped(_ sender: Any) {
            do {
                try audioPlayer = AVAudioPlayer(contentsOf:audioURL!)
                audioPlayer!.play()
            }catch{
            
            }
        }
        @IBAction func AddTapped(_ sender: Any) {
            let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
            let sound = Sound(context: context)
            sound.name = soundName.text
            sound.sound = NSData(contentsOf: audioURL!)
            
            (UIApplication.shared.delegate as! AppDelegate).saveContext()
            
            navigationController!.popViewController(animated: true)
        }
}
