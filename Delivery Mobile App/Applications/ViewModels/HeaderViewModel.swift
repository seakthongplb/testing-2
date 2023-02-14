//
//  HeaderViewModel.swift
//  Delivery Mobile App
//
//  Created by Seakthong Aing on 6/15/21.
//

import UIKit

class HeaderViewModel: BaseViewModel {
    var title: String?
    var narrative: String?
    var image: UIImage?
    var imageHeight: CGFloat
    init(title: String? = nil, narrative: String? = nil, image: UIImage? = nil, imageHeight: CGFloat = 100) {
        self.title = title
        self.narrative = narrative
        self.image = image
        self.imageHeight = imageHeight
    }
}
