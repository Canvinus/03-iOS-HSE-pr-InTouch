//
//  ViewController.swift
//  InTouch
//
//  Created by Andrey Gruzdev on 12.10.2020.
//

import UIKit
import MessageUI

class ViewController: UIViewController, MFMessageComposeViewControllerDelegate, MFMailComposeViewControllerDelegate{
    
    func messageComposeViewController(_ controller: MFMessageComposeViewController, didFinishWith result: MessageComposeResult) {
        switch result {
        case MessageComposeResult.sent:
        print("Result: Text Message Sent!") case MessageComposeResult.cancelled:
        print("Result: Text Message Cancelled.") case MessageComposeResult.failed:
        print("Result: Error, Unable to Send Text Message.")
            
        }
        self.dismiss(animated:true, completion: nil)
    }
    
    func mailComposeController(_ didFinishWithcontroller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: NSError?) {
        switch result {
        case MFMailComposeResult.sent:
        print("Result: Email Sent!")
        case MFMailComposeResult.cancelled:
        print("Result: Email Cancelled.") case MFMailComposeResult.failed:
        print("Result: Error, Unable to Send Email.") case MFMailComposeResult.saved:
        print("Result: Mail Saved as Draft.")
        }
    self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func sendEmail(_sender: Any){
        if MFMailComposeViewController.canSendMail(){
            let mailVC = MFMailComposeViewController()
            mailVC.setSubject("MySubject")
            mailVC.setToRecipients(["angruzdev@edu.hse.ru"])
            mailVC.setMessageBody("<p>Hello!</p>", isHTML: true)
            mailVC.mailComposeDelegate = self;
            
            self.present(mailVC, animated: true, completion: nil)
        }
        else{
            print("This device is curently unable to send email")
        }
    }
    
    @IBAction func sendText(_sender: Any){
        if MFMessageComposeViewController.canSendText() {
            let smsVC : MFMessageComposeViewController = MFMessageComposeViewController(); smsVC.messageComposeDelegate = self
            smsVC.recipients = ["1234500000"]
            smsVC.body = "Please call me back."
            self.present(smsVC, animated: true, completion: nil)
            
        } else {
        print("This device is currently unable to send text messages")
            
        }
    }
    
    @IBAction func openWebsite(_sender: Any){
        UIApplication.shared.open(URL(string: "http://hse.ru")!, options: [:], completionHandler: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

