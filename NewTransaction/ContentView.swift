//
//  ContentView.swift
//  NewTransaction
//
//  Created by Fernando de Orbegoso on 12/25/23.
//

import SwiftUI

//struct Transaction {
//    let description: String
//    let amount: Double
//    let type: String
//}

struct ContentView: View {
    
    struct Transaction {
        let description: String
        let amount: Double
        let type: String
    }
    
    
    @State public var newDescription = "Description"
    @State public var newAmount = 0.0
    @State public var types = ["Income", "Expense"]
    @State public var newType = "Expense"
    

    var body: some View {
        
        NavigationView {
            
            Form {
                
                Section {
                    TextField("Description", text: $newDescription)
                    TextField("Amount", value:$newAmount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                        .keyboardType(.decimalPad)
                }
                
                Section {
                    Picker("Type", selection: $newType) {
                        ForEach(types, id:\.self) {
                            Text($0)
                        }
                    }
                }
                
                Section  {
                    Text("New Transaction")
                        .frame(maxWidth: .infinity, alignment: .center)
                        .bold()
                    //section title???
                    let newTransaction = Transaction(description: newDescription, amount: newAmount, type: newType)
                    Text("Description: \(newTransaction.description)")
                    Text("Amount: \(newTransaction.amount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))")
                    Text("Type: \(newTransaction.type)")
                }
                .navigationTitle("Enter Transaction")
            }
        }
    }
}
#Preview {
    ContentView()
}
