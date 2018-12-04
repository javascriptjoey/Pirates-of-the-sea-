//
//  ViewController.swift
//  Fade-in-animation
//
//  Created by Joey Essak on 12/3/18.
//  Copyright © 2018 Joey Essak. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    var sound = AVAudioPlayer()
    var anotherSound = AVAudioPlayer()
    
    
    
    
    @IBOutlet weak var vwContainer: UIView!
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        func loadMusic()
        {
            if let path = Bundle.main.path(forAuxiliaryExecutable: "Krale - Jolly Roger (Epic Pirate Music).mp3")
            {
                let url = URL(fileURLWithPath: path)
                do{
                    anotherSound = try AVAudioPlayer(contentsOf: url)
                   
                 anotherSound.numberOfLoops = -1
             anotherSound.play()
                }
                catch {
                    print("cant find audio file")
                }
            }
            
            
        }
        loadMusic()
        
      
        //setting the aplha positioning of the vwContainer
        self.vwContainer.alpha = 0.0
    }

    @IBAction func Showviewwithanimations(_ sender: Any) {
        
        
        
        
  // Loads the sound file into button action
        func pressButton()
        {
            if let path = Bundle.main.path(forAuxiliaryExecutable: "Button-Sound.mp3")
            {
                let url = URL(fileURLWithPath: path)
                do{
                    sound = try AVAudioPlayer(contentsOf: url)
                    sound.play()
                }
                catch {
                    print("cant find audio file")
                }
            }
            
            
        }
        //Call press button function that plays sound effect 
        pressButton()
        
        if self.vwContainer.alpha == 0.0
        {
          //Display the view with fade in animations
            UIView.animate(withDuration: 3.5, delay: 0.5, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: .curveEaseIn, animations: {
                self.vwContainer.alpha = 1.0
            })
            
        }else{
            // hide the view with fade out animation
            UIView.animate(withDuration: 6.0, delay: 0.5, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: .curveEaseOut, animations: {
                self.vwContainer.alpha = 0.0
            })

        }
    }
    
}

