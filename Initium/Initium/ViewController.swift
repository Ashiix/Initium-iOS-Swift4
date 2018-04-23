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
    @IBOutlet weak var webview2: WKWebView!
    @IBOutlet weak var switchacc: UIButton!
    @IBOutlet weak var switchacc2: UIButton!
    
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
        
        let initiumgoogurl = URL(string: "https://www.playinitium.com/")
        let initiumreq = URLRequest(url: initiumgoogurl!)
        webview.load(initiumreq)
        
        let initiumgoogurl2 = URL(string: "https://www.playinitium.com/")
        let initiumreq2 = URLRequest(url: initiumgoogurl2!)
        webview2.load(initiumreq2)
        
        
    }

    
    //disable status bar
    override var prefersStatusBarHidden: Bool
    {
        return true
    }

    @IBAction func switchacc(_ sender: Any) {

        webview.isHidden = true
        webview2.isHidden = false
        switchacc.isHidden = true
        switchacc2.isHidden = false
        
    }
    
    @IBAction func switchacc2(_ sender: Any) {
        
        webview2.isHidden = true
        webview.isHidden = false
        switchacc2.isHidden = true
        switchacc.isHidden = false
    
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

