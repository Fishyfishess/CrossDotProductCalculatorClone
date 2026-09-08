//
//  ContentView.swift
//  CrossDotProductCalculator
//
//  Created by ALVIN WEI on 9/2/26.
//

import SwiftUI

struct ContentView: View {
    
    @State var vect = [1,2,3]
    @State var x1 = "0"
    @State var y1 = "0"
    @State var z1 = "0"
    @State var x2 = "0"
    @State var y2 = "0"
    @State var z2 = "0"
//    @State var answerDot = ""
//    @State var answerCross = ""
    
    var body: some View {
        NavigationView{
            VStack {
                Text("Dot product and cross product Calculator")
                    .font(.custom("Georgia", size: 40, relativeTo: .headline))
                    .multilineTextAlignment(.center)
                
                Spacer()
                
                Text("Enter two vectors in <x,y,z> format")
                    .font(.custom("Georgia", size: 20, relativeTo: .headline))
                    .multilineTextAlignment(.center)
                
                HStack {
                    Text("Vector 1: ")
                        .font(.custom("Georgia", size: 20, relativeTo: .headline))
                    
                    TextField("x value", text: $x1)
                        .padding()
                        .font(.custom("Georgia", size: 20, relativeTo: .headline))
                        .multilineTextAlignment(.center)
                        .background(RoundedRectangle(cornerRadius: 10)
                            .stroke(.black, lineWidth: 2)
                        )
                        .keyboardType(.numberPad)

                    TextField("y value", text: $y1)
                        .padding()
                        .font(.custom("Georgia", size: 20, relativeTo: .headline))
                        .multilineTextAlignment(.center)
                        .background(RoundedRectangle(cornerRadius: 10)
                            .stroke(.black, lineWidth: 2)
                        )
                        .keyboardType(.numberPad)

                    TextField("z value", text: $z1)
                        .padding()
                        .font(.custom("Georgia", size: 20, relativeTo: .headline))
                        .multilineTextAlignment(.center)
                        .background(RoundedRectangle(cornerRadius: 10)
                            .stroke(.black, lineWidth: 2)
                        )
                        .keyboardType(.numberPad)

                    
                }
                HStack {
                    Text("Vector 2: ")
                        .font(.custom("Georgia", size: 20, relativeTo: .headline))
                    
                    TextField("x value", text: $x2)
                        .padding()
                        .font(.custom("Georgia", size: 20, relativeTo: .headline))
                        .multilineTextAlignment(.center)
                        .background(RoundedRectangle(cornerRadius: 10)
                            .stroke(.black, lineWidth: 2)
                        )
                        .keyboardType(.numberPad)
                    
                    TextField("y value", text: $y2)
                        .padding()
                        .font(.custom("Georgia", size: 20, relativeTo: .headline))
                        .multilineTextAlignment(.center)
                        .background(RoundedRectangle(cornerRadius: 10)
                            .stroke(.black, lineWidth: 2)
                        )
                        .keyboardType(.numberPad)

                    TextField("z value", text: $z2)
                        .padding()
                        .font(.custom("Georgia", size: 20, relativeTo: .headline))
                        .multilineTextAlignment(.center)
                        .background(RoundedRectangle(cornerRadius: 10)
                            .stroke(.black, lineWidth: 2)
                        )
                        .keyboardType(.numberPad)

                }
                
                Spacer()
                
                Button("Calculate"){
                    
                }
                
                NavigationLink("show Answers") {
                    AnswerScreen(dotProduct: dotProduct(x1: x1, y1: y1, z1: z1, x2: x2, y2: y2, z2: z2), crossProduct: crossProduct(x1: x1, y1: y1, z1: z1, x2: x2, y2: y2, z2: z2))
                }
                .buttonStyle(.borderedProminent)
                .tint(.black)
                
                Spacer()
                
            }
        }
        .padding()
    }
    
    func dotProduct(x1: String, y1: String, z1: String, x2: String, y2: String, z2: String)->Int{
        
        //finish guard statement
        //guard let IntX1 = Int(x1) || IntY1 = Int(y1)
        
        let intX1 = Int(x1) ?? 0
        let intY1 = Int(y1) ?? 0
        let intZ1 = Int(z1) ?? 0
        let intX2 = Int(x2) ?? 0
        let intY2 = Int(y2) ?? 0
        let intZ2 = Int(z2) ?? 0
        
        return (intX1 * intX2) + (intY1 * intY2) + (intZ1 * intZ2)
    }
    
    func crossProduct(x1: String, y1: String, z1: String, x2: String, y2: String, z2: String)->[Int]{
        
        let intX1 = Int(x1) ?? 0
        let intY1 = Int(y1) ?? 0
        let intZ1 = Int(z1) ?? 0
        let intX2 = Int(x2) ?? 0
        let intY2 = Int(y2) ?? 0
        let intZ2 = Int(z2) ?? 0
        
        let i = (intY1 * intZ2) - (intY2 * intZ1)
        
        let j = (intX1 * intZ2) - (intX2 * intZ1)
        
        let k = (intX1 * intY2) - (intX2 * intY1)
        
        return [i, -j, k]
    }

}

#Preview {
    ContentView()
}
