//
//  MainTableCell.swift
//  NotesApp
//
//  Created by Anton on 26.12.2022.
//

import UIKit
import SnapKit

class MainTableCell: UITableViewCell, Identifiable {
	
	// MARK: - Identifier
	
	static let identifier = String(describing: MainTableCell.self)
	
	// MARK: - SetupCell
	
	public func setupCellContent(with model: NoteModel) {
		cellTitle.text = model.title
		cellSubtitle.text = model.note
	}
	
	// MARK: - Elements
	
	private lazy var cellTitle: UILabel = {
		let label = UILabel()
		label.numberOfLines = 1
		label.font = Fonts.systemLarge.medium
		return label
	}()
	
	private lazy var cellSubtitle: UILabel = {
		let label = UILabel()
		label.numberOfLines = 1
		label.font = Fonts.systemMedium.regular
		return label
	}()
	
	private lazy var stack: UIStackView = {
		let stack = UIStackView()
		stack.axis = .vertical
		stack.alignment = .leading
		stack.spacing = 8
		stack.contentMode = .center
		return stack
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
		stack.addArrangedSubview(cellTitle)
		stack.addArrangedSubview(cellSubtitle)
		addSubview(stack)
	}
	
	private func setupLayout() {
		stack.snp.makeConstraints { make in
			make.centerY.equalTo(snp.centerY)
			make.left.equalTo(snp.left).offset(22)
			make.right.equalTo(snp.right).offset(-22)
			make.height.equalTo(65)
		}
	}
}
