//
//  ViewController.swift
//  Messenger
//
//  Created by iGuest on 11/3/16.
//  Copyright © 2016 yulongproductions. All rights reserved.
//

import UIKit
import MessageUI

class ViewController: UIViewController, MFMessageComposeViewControllerDelegate, MFMailComposeViewControllerDelegate {

    @IBAction func smsPressed(_ sender: AnyObject) {
        if (!MFMessageComposeViewController.canSendText()) {
            NSLog("SMS services not available")
            return
        }
        
        let composeVC = MFMessageComposeViewController()
        composeVC.messageComposeDelegate = self
        
        // Configure the fields of the interface.
        composeVC.recipients = ["4085551212"]
        composeVC.body = "Hello from Washington!!!!"
        
        // Present the view controller modally.
        self.present(composeVC, animated: true, completion: nil)
    }
    
    @IBAction func mailPressed(_ sender: AnyObject) {
        if (!MFMailComposeViewController.canSendMail()) {
            NSLog("Mail not available")
        }
        
    }
    
    func messageComposeViewController(_ controller: MFMessageComposeViewController, didFinishWith result: MessageComposeResult) {
        NSLog("Result: \(result)")
    }
    
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        NSLog("Result: (\result)")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    


}

