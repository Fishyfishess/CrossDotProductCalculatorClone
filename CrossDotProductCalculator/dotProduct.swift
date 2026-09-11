//
//  dotProduct.swift
//  CrossDotProductCalculator
//
//  Created by Alvin Wei on 9/10/26.
//
import SwiftUI
struct dotProduct: View {
    @State var show = false
    @State var vectors: [Double]
    var body: some View {
        VStack{
            Button("show step by step for dot product"){
                show.toggle()
            }
            .buttonStyle(.borderedProminent)
            .tint(.orange)
            
            if show {
                Text(
                    "1. <\(vectors[0].formatted(.number.precision(.fractionLength(2)))), \(vectors[1].formatted(.number.precision(.fractionLength(2)))), \(vectors[2].formatted(.number.precision(.fractionLength(2))))> x <\(vectors[3].formatted(.number.precision(.fractionLength(2)))), \(vectors[4].formatted(.number.precision(.fractionLength(2)))), \(vectors[5].formatted(.number.precision(.fractionLength(2))))>\n2. (\(vectors[0].formatted(.number.precision(.fractionLength(2)))) * \(vectors[3].formatted(.number.precision(.fractionLength(2))))) + (\(vectors[1].formatted(.number.precision(.fractionLength(2)))) * \(vectors[4].formatted(.number.precision(.fractionLength(2))))) + (\(vectors[2].formatted(.number.precision(.fractionLength(2)))) * \(vectors[5].formatted(.number.precision(.fractionLength(2)))))\n3. dot product = \(dotProduct(vector: vectors))"
                )
                .font(.custom("Georgia", size: 15, relativeTo: .headline))
            }
        }
    }
    func dotProduct(vector:[Double])->String{
        let dotProduct = (vector[0] * vector[3]) + (vector[1] * vector[4]) + (vector[2] * vector[5])
        
        return "\(dotProduct)"
    }
}
#Preview {
    dotProduct(show: false, vectors: [0,0,0,0,0,0])
}
