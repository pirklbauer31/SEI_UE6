//
//  WiggleController.swift
//  UE6
//
//  Created by Student on 31/01/2017.
//  Copyright © 2017 Student. All rights reserved.
//

import UIKit

class WiggleController: UIViewController {

    @IBOutlet weak var view1: UIView!
    @IBOutlet weak var view2: UIView!
    @IBOutlet weak var view3: UIView!
    @IBOutlet weak var view4: UIView!
    @IBOutlet weak var view5: UIView!
    @IBOutlet weak var view6: UIView!
    @IBOutlet weak var view7: UIView!
    @IBOutlet weak var view8: UIView!
    @IBOutlet weak var view9: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        // Do any additional setup after loading the view.
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let rotateright = CGAffineTransform(rotationAngle: CGFloat.pi/25.0)
        let rotatemid = CGAffineTransform(rotationAngle: CGFloat(0))
        let rotateleft = CGAffineTransform(rotationAngle: -CGFloat.pi/25.0)
        
        UIView.animateKeyframes(withDuration: 0.15, delay: 0, options: .repeat, animations: {
            
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0.5, animations: {
                self.view1.transform = rotateright
                self.view2.transform = rotateright
                self.view3.transform = rotateright
                self.view4.transform = rotateright
                self.view5.transform = rotateright
                self.view6.transform = rotateright
                self.view7.transform = rotateright
                self.view8.transform = rotateright
                self.view9.transform = rotateright
                
            })
            
            UIView.addKeyframe(withRelativeStartTime: 0.05, relativeDuration: 0.5, animations: {
                self.view1.transform = rotatemid
                self.view2.transform = rotatemid
                self.view3.transform = rotatemid
                self.view4.transform = rotatemid
                self.view5.transform = rotatemid
                self.view6.transform = rotatemid
                self.view7.transform = rotatemid
                self.view8.transform = rotatemid
                self.view9.transform = rotatemid
                
            })
            
            UIView.addKeyframe(withRelativeStartTime: 0.1, relativeDuration: 0.5, animations: {
                self.view1.transform = rotateleft
                self.view2.transform = rotateleft
                self.view3.transform = rotateleft
                self.view4.transform = rotateleft
                self.view5.transform = rotateleft
                self.view6.transform = rotateleft
                self.view7.transform = rotateleft
                self.view8.transform = rotateleft
                self.view9.transform = rotateleft
                
            })
            
            }, completion: { (_) in
                print("finished animating!")
            })
    }

    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
