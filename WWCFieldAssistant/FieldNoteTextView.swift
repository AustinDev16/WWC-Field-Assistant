//
//  FieldNoteTextView.swift
//  WWCFieldAssistant
//
//  Created by Austin Blaser on 2/1/17.
//  Copyright © 2017 Austin Blaser. All rights reserved.
//

import UIKit

class FieldNoteTextView: UITextView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    override func layoutSubviews() {
        self.contentOffset = CGPoint(x: 0, y: self.contentOffset.y)
        super.layoutSubviews()
    }

}
