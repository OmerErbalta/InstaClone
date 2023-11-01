//
//  Extencions.swift
//  InstaProject
//
//  Created by OmerErbalta on 1.11.2023.
//

import Foundation
import Firebase

class Extencions{
    
    func calculateTimeDifference(date:Timestamp)-> String{
        let time = date.dateValue()
        let timeDifference = Calendar.current.dateComponents([.day,.hour,.minute], from: time,to: Date())
        print(timeDifference)
        
        if let day = timeDifference.day, day >= 1 {
            return "\(day) d"
        }
        
        if let hours = timeDifference.hour, hours >= 1 {
            return "\(hours) h"
        }
        else if let minute = timeDifference.minute {
            return "\(minute) m"
        }
        
        return ""
        
    }
}
