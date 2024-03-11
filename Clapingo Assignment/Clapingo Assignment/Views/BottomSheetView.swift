//
//  BottomSheetView.swift
//  Clapingo Assignment
//
//  Created by Palak Satti on 10/03/24.
//

import SwiftUI

struct BottomSheetView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
         
            Text("About weekly session")
                .font(.title2)
                .bold()
                .padding(.bottom, 5)
            
          
            Group {
                Text("• Your 15 min. one-on-one subscription covers 4 session per week for 1 month.")
                Text("• It is advised to complete your weekly session on time.")
            }
            .padding(.bottom, 20)
            
           
            VStack(alignment: .leading, spacing: 5) {
                Text("Week 1")
                    .bold()
                
                HStack {
                    Text("Start date:")
                    Spacer()
                    Text("12 Jun, 2021")
                }
                
                HStack {
                    Text("End date:")
                    Spacer()
                    Text("19 Jun, 2021")
                }
            }
            
            Spacer()
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.white)
                .cornerRadius(20)
                .shadow(radius: 5)
        }
        .padding()
    }
}

struct BottomSheetView_Previews: PreviewProvider {
    static var previews: some View {
        BottomSheetView()
    }
}
