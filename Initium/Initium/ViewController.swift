//
//  ViewController.swift
//  Initium
//
//  Copyright © 2018 NiteIsAFK. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController {

    @IBOutlet weak var Welcome: UIImageView!
    @IBOutlet weak var HideWelcome: UIButton!
    @IBOutlet weak var LPMWarning: UIImageView!
    @IBOutlet weak var Webview1: WKWebView!
    @IBOutlet weak var Webview2: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // On first launch preform actions below
        if(!UserDefaults.standard.bool (forKey: "onfirstlaunch"))
        {
            // Unhide Initium intro
            Welcome.isHidden = false
            HideWelcome.isEnabled = true
            
            // Save
            UserDefaults.standard.set (true, forKey: "onfirstlaunch")
            UserDefaults.standard.synchronize();
        }
        
        // Check the client for any issues
        CheckClient()
        
        // Load Initium Google login on Webview 1
        let InitiumGoogURL = URL(string: "https://www.playinitium.com/ServletUserControl?type=oauth&authType=google")
        let InitiumGoogReq = URLRequest(url: InitiumGoogURL!)
        Webview1.load(InitiumGoogReq)
        
        // Load Initium login on Webview 2
        let InitiumURL = URL(string: "https://www.playinitium.com/")
        let InitiumReq = URLRequest(url: InitiumURL!)
        Webview2.load(InitiumReq)
    }
    
    // Disable status bar
    override var prefersStatusBarHidden: Bool { return true }

    // Switch Webviews
    @IBAction func SwitchAcc(_ sender: Any)
    {
        if (!Webview1.isHidden)
        {
            Webview1.isHidden = true
            Webview2.isHidden = false
        }
            // Switch to Webview 1
        else if (!Webview2.isHidden)
        {
            Webview2.isHidden = true
            Webview1.isHidden = false
        }
    }
    
    // Hide introduction
    @IBAction func buttontohide(_ sender: Any)
    {
        Welcome.isHidden = true
        HideWelcome.isEnabled = false
    }
    
    // If recieved a memory warning, delete many items from view, and
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func CheckClient()
    {
        // Check if connected to the internet
        if !Reachability.isConnectedToNetwork()
        {
            // If not, disply a warning that forces the user to close the app
            let alert = UIAlertController(title: "Unable to connect", message: "Please check your internet connection and restart the app.", preferredStyle: .alert)
            
            self.present(alert, animated: true)
            
            return
        }
        
        // Determine if LPM is enabled, if so, display warning
        if ProcessInfo.processInfo.isLowPowerModeEnabled { LPMWarning.isHidden = false }
    }
    
}
