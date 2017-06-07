//
//  TicketViewController.swift
//  TicketTest
//
//  Created by Rony Vargas on 5/27/17.
//  Copyright © 2017 Rony Vargas. All rights reserved.
//

import UIKit
import Foundation

class DetailViewController: UIViewController {
    
    @IBOutlet weak var detailDescriptionLabel: UILabel!
    
    @IBOutlet weak var ticketNameLabel: UILabel?
    @IBOutlet weak var fromStationLabel: UILabel?
    @IBOutlet weak var toStationLabel: UILabel?
    @IBOutlet weak var transfStationLabel: UILabel?
    @IBOutlet weak var currentDateLabel: UILabel?
    @IBOutlet weak var currentTimeLabel: UILabel?
    @IBOutlet weak var expiresLabel: UILabel?

    
    
    
    func configureView() {
        // Update the user interface for the detail item.
        
        
        let today = Date()
        
        let calendar = Calendar.current
        let year = calendar.component(.year, from: today)
        let month = calendar.component(.month, from: today)
        let day = calendar.component(.day, from: today)
        
        if let detail = detailItem {
            self.title = detail.ticketName
            
            ticketNameLabel?.text = detail.ticketName
            fromStationLabel?.text = detail.fromStation
            toStationLabel?.text = detail.toStation
            currentDateLabel?.text = day.description + ", " +  month.description + "," + year.description
            ticketNameLabel?.text = detail.ticketName
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        configureView()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    var detailItem: Ticket? {
        didSet {
            // Update the view.
            configureView()
        }
    }
    
    
}
