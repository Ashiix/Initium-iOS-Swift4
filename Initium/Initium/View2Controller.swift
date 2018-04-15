//
//  View2Controller.swift
//  Initium
//
//  Created by Will Schmidt on 3/2/18.
//  Copyright © 2018 Cyph4r. All rights reserved.
//

import UIKit
import WebKit

class View2Controller: UIViewController {
    
    @IBOutlet weak var webview: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let initiumgoogurl = URL(string: "https://www.playinitium.com/")
        let initiumreq = URLRequest(url: initiumgoogurl!)
        webview.load(initiumreq)
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override var prefersStatusBarHidden: Bool
    {
        return true
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
