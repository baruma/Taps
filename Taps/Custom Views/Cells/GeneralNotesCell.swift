//
//  GeneralNotesCell.swift
//  Taps
//
//  Created by Liana Haque on 4/5/21.
//

import UIKit

protocol GeneralNotesCellDelegate {
    func updateTextViewHeight()
}

class GeneralNotesCell: UITableViewCell {
    static let reuseID = "GeneralNotesCell"
    var delegate: GeneralNotesCellDelegate?

    @IBOutlet weak var textView: UITextView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        textView.delegate = self
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

extension GeneralNotesCell: UITextViewDelegate {
    func textViewDidChange(_ textView: UITextView) {
        delegate?.updateTextViewHeight()
    }
}
