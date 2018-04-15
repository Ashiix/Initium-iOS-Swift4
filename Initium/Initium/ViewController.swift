//
//  ViewController.swift
//  Initium
//
//  Created by Evelyn Schmidt on 2/17/18.
//  Copyright © 2018 Cyph4r. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController {

    @IBOutlet weak var webview: WKWebView!
    @IBOutlet weak var firstloadpng: UIImageView!
    @IBOutlet weak var buttonhide: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        if(!UserDefaults.standard.bool (forKey: "onfirstlaunch"))
        
        {
            //run this on first launch
            firstloadpng.isHidden = false
            buttonhide.isEnabled = true
            
            
            
            UserDefaults.standard.set (true, forKey: "onfirstlaunch")
            UserDefaults.standard.synchronize();
        }

        
        
        //load google view
        
        let initiumgoogurl = URL(string: "https://www.google.com/accounts/ServiceLogin?service=ah&passive=true&continue=https://appengine.google.com/_ah/conflogin%3Fcontinue%3Dhttps://www.playinitium.com/ServletUserControl%253Ftype%253Doauth%2526authType%253Dgoogle")
        let initiumreq = URLRequest(url: initiumgoogurl!)
        webview.load(initiumreq)
        
        
    }

    
    //disable status bar
    override var prefersStatusBarHidden: Bool
    {
        return true
    }

    
    @IBAction func buttontohide(_ sender: Any)
    {
        firstloadpng.isHidden = true
        buttonhide.isEnabled = false
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

