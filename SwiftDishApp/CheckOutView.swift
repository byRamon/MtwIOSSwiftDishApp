//
//  CheckOutView.swift
//  SwiftDishApp
//
//  Created by ByRamon on 07/03/20.
//  Copyright © 2020 ByRamon. All rights reserved.
//

import SwiftUI

struct CheckOutView: View {
    @EnvironmentObject var order : Order
    @State private var addLoyalitydetails = false
    @State private var loyalityNumber = ""
    @State private var paymentType = 0
    @State private var tipAmount = 1
    @State private var showingAlert = false
    let tipAmounts = [10, 15, 25, 0]
    let paymentTypes = ["Cash", "Credit Card", "SwiftDish Points"]
    var totalPrice: Double{
        let total = Double(order.total)
        let tip = total / 100 * Double(self.tipAmounts[tipAmount])
        return total + tip
    }
    var body: some View {
        Form{
            Section{
                Picker("How do you wnat to pay?", selection: $paymentType){
                    ForEach(0 ..< self.paymentTypes.count){
                        Text(self.paymentTypes[$0])
                    }
                }
                Toggle(isOn: $addLoyalitydetails){
                    Text("Add SwiftDish loyality card")
                }
                if addLoyalitydetails{
                    TextField("Enter your SwiftDish ID", text: $loyalityNumber)
                }
            }
            Section(header: Text("Add tip?")){
                Picker("Percentage:", selection: $tipAmount){
                    ForEach(0 ..< tipAmounts.count){
                        Text("\(self.tipAmounts[$0])%")
                    }
                }.pickerStyle(SegmentedPickerStyle())
            }
            Section(header: Text("TOTAL: $\(totalPrice, specifier: "%.2f")")
                    .font(.largeTitle)){
                Button("Confirm order"){
                    //self.showingAlert = true
                    self.showingAlert.toggle()
                }
            }
        }.navigationBarTitle(Text("Payment"), displayMode: .inline)
            .alert(isPresented: $showingAlert){
                Alert(title: Text("Order confirmed"), message: Text("Your Total was $\(totalPrice, specifier: "%.2f") - thank you!"), dismissButton: .default(Text("Ok")))
        }
    }
}


struct CheckOutView_Previews: PreviewProvider {
    static let order = Order()
    static var previews: some View {
        CheckOutView().environmentObject(order)
    }
}
