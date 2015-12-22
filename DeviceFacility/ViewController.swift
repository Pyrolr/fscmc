//
//  ViewController.swift
//  DeviceFacility
//
//  Created by Hardik on 22/12/15.
//  Copyright © 2015 HDG. All rights reserved.
//

import UIKit
import MessageUI

class ViewController: UIViewController,MFMessageComposeViewControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func btnMessageClicked(sender: AnyObject) {
        if(MFMessageComposeViewController.canSendText()){
            let messageComposeVC = MFMessageComposeViewController()
            messageComposeVC.messageComposeDelegate = self  //  Make sure to set this property to self, so that the controller can be dismissed!
            let receipientNo = "9711111111"
            messageComposeVC.recipients = [receipientNo]
            messageComposeVC.body = "Sample text"
            self.presentViewController(messageComposeVC, animated:true, completion: nil)
        }else
        {
            print("Can't send message")
        }
    }
    
    //---------------------------------------------------------------------
    
    // MARK: - MFMessageComposeViewController delegate methods
    
    //---------------------------------------------------------------------
    
    func messageComposeViewController(controller: MFMessageComposeViewController, didFinishWithResult result: MessageComposeResult) {
        switch (result.rawValue) {
        case MessageComposeResultCancelled.rawValue:
            print("Message was cancelled")
            self.dismissViewControllerAnimated(true, completion: nil)
        case MessageComposeResultFailed.rawValue:
            print("Message failed")
            self.dismissViewControllerAnimated(true, completion: nil)
        case MessageComposeResultSent.rawValue:
            print("Message was sent")
            self.dismissViewControllerAnimated(true, completion: nil)
        default:
            break;
        }
    }

    @IBAction func btnCallClicked(sender: AnyObject) {
        let strCallNo: String = "9711111111"
        let trimmedString = strCallNo.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceCharacterSet())
        let telUrl:NSURL? = NSURL(string:trimmedString)
        if ((telUrl) != nil){
            if(UIApplication.sharedApplication().canOpenURL(telUrl!)){
                UIApplication.sharedApplication().openURL(NSURL(string: "telprompt://"+strCallNo)!)
            }else
            {
                print("Call not available")
            }
        }
    }
 
}

