//
//  autoFillFuncModel.swift
//  ATM_FirebaseDB
//
//  Created by Grizzowl on 2022/08/15.
//

import Foundation

class AutoFillFuncModel: ObservableObject {
    
    // EXP DATE
   
    func setCardExpDate() -> String{
        
        let currentDate = Date()
        var cardExpDatemodifier = DateComponents()
        cardExpDatemodifier.year = 5
        let cardExpDate = Calendar.current.date(byAdding: cardExpDatemodifier, to: currentDate)
        let expDateMonth = cardExpDate!.formatted(.dateTime.month(.twoDigits))
        let expDateYear = cardExpDate!.formatted(.dateTime.year(.twoDigits))
        
        return ("\(expDateMonth)/\(expDateYear)")
    }
    
    // CARD NUMBER
    func cardNumberAutoGen() -> String {
        
        let bankCodeCardNumber: Int = 4550
        let cardNumberSegOne = Int.random(in: 1000...9999)
        let cardNumberSegTwo = Int.random(in: 1000...9999)
        let cardNumberSegThree = Int.random(in: 1000...9999)
        
        return ("\(bankCodeCardNumber) \(cardNumberSegOne) \(cardNumberSegTwo) \(cardNumberSegThree)")
    }
    
    // CVV NUMBER
    func cvvAutoGen() -> String {
        
        let cvvAutoGen = Int.random(in: 100...999)
        
        return ("\(cvvAutoGen)")
    }
    
}
