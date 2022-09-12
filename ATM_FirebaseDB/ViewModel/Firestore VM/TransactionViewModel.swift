//
//  TransactionViewModel.swift
//  ATM_FirebaseDB
//
//  Created by Grizzowl on 2022/09/02.
//

import Foundation

protocol TransactionViewModel {
    func logTransaction()
    var service: TransactionHandler { get }
    var newUserTransactionHistory: TransactionHistoryModel { get }
    init(service: TransactionHandler)
}

final class TransactionViewModelImp: ObservableObject, TransactionViewModel {
    
    let service: TransactionHandler
    
    @Published var newUserTransactionHistory = TransactionHistoryModel(username: "Bob123",
                                                                transactionPaymentReference: "",
                                                                transactionHistoryAmount: 0,
                                                                transactionHistoryDate: "")
    
    init(service: TransactionHandler) {
        self.service = service
    }
    
    func logTransaction() {
        
        service
            .logTransactionHistory(with: newUserTransactionHistory)

    }
    
}
