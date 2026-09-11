//
//  AnswerScreen.swift
//  CrossDotProductCalculator
//
//  Created by ALVIN WEI on 9/3/26.
//
import SwiftUI
struct AnswerScreen: View {
    
    @State var dotProduct: Double
    @State var crossProduct: [Double]
    @State var vectors: [Double]
    
    var body: some View {
        Spacer()
        Text("Entered vectors:\n <\(vectors[0].formatted(.number.precision(.fractionLength(2)))), \(vectors[1].formatted(.number.precision(.fractionLength(2)))), \(vectors[2].formatted(.number.precision(.fractionLength(2))))>\n<\(vectors[3].formatted(.number.precision(.fractionLength(2)))), \(vectors[4].formatted(.number.precision(.fractionLength(2)))), \(vectors[5].formatted(.number.precision(.fractionLength(2))))>")
            .multilineTextAlignment(.center)
            .font(.custom("Georgia", size: 20, relativeTo: .headline))
        Spacer()
        Text("Dot Product")
            .font(.custom("Georgia", size: 20, relativeTo: .headline))
            .multilineTextAlignment(.center)
        
        Text("Answer: ")
            .font(.custom("Georgia", size: 20, relativeTo: .headline))
            .multilineTextAlignment(.center)
        
        Text(String(dotProduct.formatted(.number.precision(.fractionLength(2)))))
            .font(.custom("Georgia", size: 20, relativeTo: .headline))
            .multilineTextAlignment(.center)
        
        Spacer()
        
        CrossDotProductCalculator.dotProduct(vectors: vectors)
        
        Spacer()
        
        Text("Cross Product")
            .font(.custom("Georgia", size: 20, relativeTo: .headline))
            .multilineTextAlignment(.center)
        
        Text("Answer: ")
            .font(.custom("Georgia", size: 20, relativeTo: .headline))
            .multilineTextAlignment(.center)
        
        Text("<\(crossProduct[0].formatted(.number.precision(.fractionLength(2)))), \(crossProduct[1].formatted(.number.precision(.fractionLength(2)))), \(crossProduct[2].formatted(.number.precision(.fractionLength(2))))>")
            .font(.custom("Georgia", size: 20, relativeTo: .headline))
            .multilineTextAlignment(.center)
        
        Spacer()
        CrossDotProductCalculator.crossProduct(vectors: vectors)
        Spacer()
    }
}
#Preview {
    AnswerScreen(dotProduct: 0, crossProduct: [0,0,0], vectors: [0,0,0,0,0,0])
}

