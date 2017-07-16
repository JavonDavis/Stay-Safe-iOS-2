//
//  CrimeReportViewController.swift
//  Stay Safe Jamaica
//
//  Created by Jamel Reid  on 7/15/17.
//  Copyright © 2017 Stay Safe Jamaica. All rights reserved.
//

import UIKit

class CrimeReportViewController: UIViewController
{
    @IBOutlet weak var crimeDescriptionTextView: UITextView!
    
    var buttonSelected: UIButton?
    
    var categories = ["Shooting", "Theft", "Accident", "Sexual Assault", "Other"]
    
    var latitude: Double?
    var longitude: Double?
    var reportCategory: String?
    var reportDescription: String?
    
    override func viewWillAppear(_ animated: Bool)
    {
        super.viewWillAppear(animated)
        subscribeToKeyboardNotifications()
        //show navigation bar
        navigationController?.setNavigationBarHidden(false, animated: true)
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        unsubscribeFromKeyboardNotifications()
    }
    
    func sendReport() {
        
    }
    
    
    @IBAction func selectReportCategory(_ sender: UIButton)
    {
        if let buttonSelected = buttonSelected
        {
            buttonSelected.isSelected = false
        }
        buttonSelected = sender
        
        sender.isSelected = true
        reportCategory = categories[sender.tag]
        print("Category: \(reportCategory!)")
    }
    
    @IBAction func submitReport(_ sender: UIButton)
    {
        reportDescription = crimeDescriptionTextView.text
        sendReport()
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
