//
//  HeaderTableViewCell.swift
//  Delivery Mobile App
//
//  Created by Seakthong Aing on 6/15/21.
//

import UIKit

class HeaderTableViewCell: UITableViewCell, CellProtocol {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var narrativeLabel: UILabel!
    @IBOutlet weak var headerImageView: UIImageView!
    
    @IBOutlet weak var headerImageViewHeightConstraint: NSLayoutConstraint!

    override func awakeFromNib() {
        super.awakeFromNib()
        setupView()
    }
    
    private func setupView() {
        selectionStyle = .none
    }
    
    func configCell(with viewModel: BaseViewModel) {
        guard let vm = viewModel as? HeaderViewModel else {
            return
        }
        titleLabel.isHidden = vm.title == nil
        narrativeLabel.isHidden = vm.narrative == nil
        headerImageView.isHidden = vm.image == nil
        titleLabel.text = vm.title
        narrativeLabel.text = vm.narrative
        headerImageView.image = vm.image
        headerImageViewHeightConstraint.constant = (vm.image == nil) ? 0 : vm.imageHeight
    }
    
}
