//
//  GameViewController.swift
//  Acceleromator
//
//  Created by Haruko Okada on 9/6/20.
//  Copyright © 2020 Haruko Okada. All rights reserved.
//

import UIKit
import CoreMotion


class GameViewController: UIViewController {

    @IBOutlet weak var bubbleImageView: UIImageView!
    
    let motionManager = CMMotionManager()
    var accelerationX: Double?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if motionManager.isAccelerometerAvailable {
            
            motionManager.accelerometerUpdateInterval = 0.01
            
            motionManager.startAccelerometerUpdates(to: OperationQueue.current!, withHandler: {(data, error) in
                self.accelerationX = (data?.acceleration.x)!
                
                self.bubbleImageView.center.x =
                    self.bubbleImageView.center.x - CGFloat(self.accelerationX!*20)
                
                if self.bubbleImageView.frame.origin.x < 40 {
                    self.bubbleImageView.frame.origin.x = 40
                }
                if self.bubbleImageView.frame.origin.x > 260{
                    self.bubbleImageView.frame.origin.x = 260
                }

            })
        }
        

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
