//
//  MvvmTableViewCell.swift
//  Finance
//
//  Created by Даниил Виноградов on 03.02.2023.
//

import UIKit
import RxSwift

public class MvvmTableViewCell: UITableViewCell {
    public private(set) var disposeBag = DisposeBag()

    public override func prepareForReuse() {
        super.prepareForReuse()
        disposeBag = DisposeBag()
    }
}
