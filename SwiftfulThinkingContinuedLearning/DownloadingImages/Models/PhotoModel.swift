//
//  PhotoModel.swift
//  SwiftfulThinkingContinuedLearning
//
//  Created by user274186 on 1/10/25.
//

import Foundation

struct PhotoModel: Identifiable, Codable {
    let albumId: Int
    let id: Int
    let title: String
    let url: String
    let thumbnailUrl: String
}
