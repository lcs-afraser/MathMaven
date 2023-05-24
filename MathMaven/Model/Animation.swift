//
//  FavouriteAnimation.swift
//  LottieAnimationsList
//
//  Created by Alistair Fraser on 2023-01-28.
//

import Foundation

struct FavouriteAnimation: Identifiable {
    let id = UUID()
    let fileName: String
    let description: String
}

let favourites = [
    FavouriteAnimation(fileName: "123026-celebrations-begin", description: "Confetti")
    
]
