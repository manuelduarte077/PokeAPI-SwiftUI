//
//  LoadingView.swift
//  PokeAPI
//
//  Created by Manuel Duarte on 25/11/25.
//

import SwiftUI

struct LoadingView: View {
    @State private var isAnimating = false
    
    var body: some View {
        ZStack {
            Circle()
                .fill(Color.black)
                .frame(width: 203, height: 203)
            
            Circle()
                .frame(width: 200, height: 200)
                .clipShape(Rectangle().offset(y: -70))
                .foregroundStyle(.red.shadow(.inner(radius: 10, x: 5, y: 0)))
            
            Circle()
                .frame(width: 200, height: 200)
                .clipShape(Rectangle().offset(y: 100))
                .foregroundStyle(.white.shadow(.inner(radius: 10, x: 5, y: 0)))
            
            Rectangle()
                .fill(Color.black)
                .frame(width: 200, height: 18)
            
            Circle()
                .fill(Color.black)
                .frame(width: 60, height: 60)
            
            Circle()
                .fill(Color.white)
                .frame(width: 30, height: 30)
        }
        .rotationEffect(.degrees(isAnimating ? 360 : 0))
        .animation(.easeInOut(duration: 1).repeatForever(autoreverses: false), value: isAnimating)
        .onTapGesture {
            isAnimating.toggle()
        }
    }
}

#Preview {
    LoadingView()
}
