//
//  LoginStatus.swift
//  AirFlight
//
//  Created by Ahmed Amin on 06/09/2023.
//

import Foundation

enum LoginStatus: String, CaseIterable {
    
    case connecting = "Connecting ..."
    case authorizing = "Authorizing ..."
    case sendingCredentials = "Sending credentials ..."
    case successed = "Successed"
    
}
