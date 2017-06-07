//
//  AddTicketController.swift
//  TicketTest
//
//  Created by Rony Vargas on 5/27/17.
//  Copyright © 2017 Rony Vargas. All rights reserved.
//

import Foundation
import UIKit

class AddTicketController : UIViewController, UIPickerViewDataSource, UIPickerViewDelegate, UITextFieldDelegate {

    let items:[String] = ["NY PENN", "NEWARK BROAD ST", "NW BRUN", "EDISON"]
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    @available(iOS 2.0, *)
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return items.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int ,forComponent component: Int) -> String? {
        return items[row]
    }


    
    @IBOutlet weak var nameField: UITextField!
    
    
    
    
    
    
    
    
    //SAVE CURRENT TICKET
    
    @IBAction func addButtonPressed(sender : UIButton){

        let ticket = Ticket(ticketName: nameField.text!)
        
        
        //TEMP HARD VALUES for Stations
        ticket.setFromStation(fs: "NW BRUN")
        ticket.setToStation(ts: "EDISON")
        
        
        //Get Station Values from Picket View
        //ticket.setFromStation(fs: items[pickerView.selectedRow(inComponent: 0)])
        //        ticket.setFromStation(fs: variable)
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.ticketArray.append(ticket)
        
        //print("Created a Ticket:\(ticket.ticketName)")
        self.navigationController?.popViewController(animated: true)
    
    }
    
    
    
    
    
    
    override func viewDidLoad(){
        super.viewDidLoad()
            
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.dismissKeyboard))
        view.addGestureRecognizer(tap)
        
    }
    
    func dismissKeyboard(){
        view.endEditing(true)
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        view.endEditing(true)
        return false
    }

    

}
