//
//  SpreadResult.swift
//  ProgramaticCalc
//
//  Created by Devin Singh on 2/11/20.
//  Copyright © 2020 Devin Singh. All rights reserved.
//

import Foundation

struct SpreadResult {
    
    let buyStrikePrice: Double
    let sellStrikePrice: Double
    let limitPrice: Double
    let pop: Double
    
    var isCCS: Bool {
        return buyStrikePrice > sellStrikePrice
    }
    
    var collateral: Double {
        return (abs(buyStrikePrice - sellStrikePrice)) * 100
    }
    
    var premium: Double {
        return limitPrice * 100
    }
    
    var maxLoss: Double {
        return collateral - premium
    }
    
    var approxYtd: Double {
        let poL = 100-pop
        let profit =  (premium*pop)-(poL*maxLoss)
        return profit/(collateral*100)*100
    }
}
