//
//  MainTableCell.swift
//  NotesApp
//
//  Created by Anton on 26.12.2022.
//

import UIKit
import SnapKit

class MainTableCell: UITableViewCell {
	
	// MARK: - Identifier
	
	static let identifier = "MainCell"
	
	// MARK: - SetupCell
	
	public func setupCellContent(with model: MainModel) {
		cellTitle.text = model.title
		cellSubtitle.text = model.note
	}
	
	// MARK: - Elements
	
	private lazy var cellTitle: UILabel = {
		let label = UILabel()
		label.numberOfLines = 1
		label.font = Fonts.systemLarge.medium
		label.text = "Test"
		return label
	}()
	
	private lazy var cellSubtitle: UILabel = {
		let label = UILabel()
		label.numberOfLines = 1
		label.font = Fonts.systemMedium.regular
		label.text = "Test1"
		return label
	}()
	
	// MARK: - Initialization
	
	override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)
		setupHierarchy()
		setupLayout()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	// MARK: - Setup
	
	private func setupHierarchy() {
		addSubview(cellTitle)
		addSubview(cellSubtitle)
	}
	
	private func setupLayout() {
		cellTitle.snp.makeConstraints { make in
			make.left.equalTo(snp.left).offset(20)
			make.top.equalTo(snp.top).offset(8)
			make.right.equalTo(snp.right).offset(-20)
		}
		
		cellSubtitle.snp.makeConstraints { make in
			make.left.right.equalTo(cellTitle)
			make.top.equalTo(cellTitle.snp.bottom).offset(8)
			make.bottom.equalTo(snp.bottom).offset(-8)
		}
	}
}
