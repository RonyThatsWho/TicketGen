//
//  Ticket.swift
//  TicketTest
//
//  Created by Rony Vargas on 5/27/17.
//  Copyright © 2017 Rony Vargas. All rights reserved.
//

import Foundation

enum TicketValidationError : Error {
    case InvalidTicketName
    
}


class Ticket {
    
    private(set) var ticketName : String?
    private(set) var fromStation : String?
    private(set) var toStation : String?
    private(set) var connection : String?
    private(set) var mainColor : String?
    private(set) var color1 : String?
    private(set) var color2 : String?
    private(set) var color3 : String?
    var created: Date?
    var expires: Date?
    
    init (ticketName tn: String) {
        ticketName = tn
        created = Date()

    }
    
    func setName (tn: String) throws {
        if (tn.characters.count < 1){
            throw TicketValidationError.InvalidTicketName
        }
        ticketName = tn
    }
    
    func setFromStation (fs: String) {
        fromStation = fs
    }
    
    func setToStation (ts: String) {
        toStation = ts
    }
    
    
    
}
