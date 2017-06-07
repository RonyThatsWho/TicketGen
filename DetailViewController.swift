//
//  DetailViewController.swift
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
    var expiredRef: Date?
    
    
    func timeString(time:TimeInterval) -> String {
        let hours = Int(time) / 3600
        let minutes = Int(time) / 60 % 60
        let seconds = Int(time) % 60
        return String(format: "%02i:%02i:%02i", hours, minutes, seconds)
    }

    
    
    
    func configureView() {
        // Update the user interface for the detail item.
        
        
        let dateFormatter = DateFormatter ()
        dateFormatter.dateStyle = .full
        dateFormatter.timeStyle = .none
        
        let timeFormatter = DateFormatter ()
        timeFormatter.dateStyle = .none
        timeFormatter.timeStyle = .medium
        
        
        let calendar = Calendar.current
        let startDate = Date()
        expiredRef = calendar.date(byAdding: .minute, value: 90, to: startDate)
        
        if let detail = detailItem {
            self.title = detail.ticketName
            
            ticketNameLabel?.text = detail.ticketName
            fromStationLabel?.text = detail.fromStation
            toStationLabel?.text = detail.toStation
            currentDateLabel?.text = dateFormatter.string(from: detail.created!)
            currentTimeLabel?.text = timeFormatter.string(from: startDate)
            expiresLabel?.text = "Expires in 00:" + timeString(time: expiredRef!.timeIntervalSinceNow)
        }
    }
    
    @IBOutlet weak var colorBar: UIImageView!
    func updateCounter (){
        
        let rightNow = Date()
        let calendar = Calendar.current
        
        let timeFormatter = DateFormatter ()
        timeFormatter.dateStyle = .none
        timeFormatter.timeStyle = .medium
        
        currentTimeLabel?.text = timeFormatter.string(from: rightNow)
        expiresLabel?.text = "Expires in 00:" + timeString(time: expiredRef!.timeIntervalSinceNow)
        
        
        //Toggle Tri-Color Flash
        if (calendar.component(.second, from: rightNow) % 2 == 0){
            colorBar.isHidden = true
        }
        else{
            colorBar.isHidden = false
        }
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        configureView()
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        
        _ = Timer.scheduledTimer(timeInterval: 1, target:self, selector: #selector(DetailViewController.updateCounter), userInfo: nil, repeats: true)
        
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
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
