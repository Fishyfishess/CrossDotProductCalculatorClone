//
//  AnswerScreen.swift
//  CrossDotProductCalculator
//
//  Created by ALVIN WEI on 9/3/26.
//

import SwiftUI

struct AnswerScreen: View {
    
    @State var dotProduct: Int
    @State var crossProduct: [Int]
    
    var body: some View {
                
        Spacer()
        Text("Dot Product")
            .font(.custom("Georgia", size: 20, relativeTo: .headline))
            .multilineTextAlignment(.center)
        
        Text("Answer: ")
            .font(.custom("Georgia", size: 20, relativeTo: .headline))
            .multilineTextAlignment(.center)
        
        Spacer()
        
        Text("Cross Product")
            .font(.custom("Georgia", size: 20, relativeTo: .headline))
            .multilineTextAlignment(.center)
        
        Text("Answer: ")
            .font(.custom("Georgia", size: 20, relativeTo: .headline))
            .multilineTextAlignment(.center)
        
        Spacer()
        
    }
}

#Preview {
    AnswerScreen(dotProduct: 0, crossProduct: [0,0,0])
}
