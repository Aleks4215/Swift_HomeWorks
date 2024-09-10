//
//  ViewController.swift
//  hw21
//
//  Created by Алексей on 7.09.24.
//

import UIKit

class ViewController: UIViewController {
    
    lazy var wrapper: UIView = {
       let view = UIView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var textView: UITextView = {
        let textVIew = UITextView()
        textVIew.text = "42354234534533545656436546453456645645"
//        textVIew.delegate = self
        textVIew.translatesAutoresizingMaskIntoConstraints = false
        return textVIew
    }()
    
    lazy var vStack: UIStackView = {
       let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fillProportionally
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    lazy var clearAtributedButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Отменить изменения", for: .normal)
        button.isEnabled = false
        button.addTarget(self, action: #selector(removeAllAttributes), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    
    func createSegmentedControl(title: String, firstTitle: String?, secondTitle: String?, thirdTitle: String?, firstAction: @escaping () -> Void, secondAction: @escaping () -> Void, thirdAction: @escaping () -> Void) -> UIView {
        let container = UIView()
        
        let titleLabel = UILabel()
        titleLabel.text = title
        titleLabel.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        titleLabel.textAlignment = .center
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        let segmentedControl = UISegmentedControl()
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        segmentedControl.tintColor = .systemBlue
        segmentedControl.backgroundColor = .white
        
        if let firstTitle = firstTitle {
            segmentedControl.insertSegment(withTitle: firstTitle, at: 0, animated: true)
        }
        if let secondTitle = secondTitle {
            segmentedControl.insertSegment(withTitle: secondTitle, at: 1, animated: true)
        }
        if let thirdTitle = thirdTitle {
            segmentedControl.insertSegment(withTitle: thirdTitle, at: 2, animated: true)
        }
        
        segmentedControl.addAction(UIAction { _ in
            switch segmentedControl.selectedSegmentIndex {
            case 0:
                firstAction()
            case 1:
                secondAction()
            case 2:
                thirdAction()
            default:
                break
            }
        }, for: .valueChanged)
        
        container.addSubview(titleLabel)
        container.addSubview(segmentedControl)
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: container.topAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: container.leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: container.trailingAnchor),
            
            segmentedControl.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8),
            segmentedControl.leadingAnchor.constraint(equalTo: container.leadingAnchor),
            segmentedControl.trailingAnchor.constraint(equalTo: container.trailingAnchor),
            segmentedControl.bottomAnchor.constraint(equalTo: container.bottomAnchor)
        ])
        
        return container
    }
    
    func setupWrapper() {
        view.addSubview(wrapper)
        NSLayoutConstraint.activate([
            wrapper.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            wrapper.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            wrapper.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            wrapper.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    func setupTextView() {
        wrapper.addSubview(textView)
        NSLayoutConstraint.activate([
            textView.topAnchor.constraint(equalTo: wrapper.safeAreaLayoutGuide.topAnchor, constant: 25),
            textView.leadingAnchor.constraint(equalTo: wrapper.safeAreaLayoutGuide.leadingAnchor, constant: 25),
            textView.trailingAnchor.constraint(equalTo: wrapper.safeAreaLayoutGuide.trailingAnchor, constant: -25),
            textView.heightAnchor.constraint(equalTo: wrapper.heightAnchor, multiplier: 0.2)
        ])
        textView.backgroundColor = .systemFill
    }
    
    func setupVStackView() {
        wrapper.addSubview(vStack)
        NSLayoutConstraint.activate([
            vStack.heightAnchor.constraint(equalTo: wrapper.heightAnchor, multiplier: 0.3),
            vStack.topAnchor.constraint(equalTo: textView.safeAreaLayoutGuide.bottomAnchor, constant: 15),
            vStack.leadingAnchor.constraint(equalTo: wrapper.safeAreaLayoutGuide.leadingAnchor, constant: 15),
            vStack.trailingAnchor.constraint(equalTo: wrapper.safeAreaLayoutGuide.trailingAnchor, constant: -15)
        ])
        let changeStyleSegment = createSegmentedControl(title: "Смена стиля",
                                                        firstTitle: "Bold",
                                                        secondTitle: "Italic",
                                                        thirdTitle: "Medium",
                                                        firstAction: { self.changeStyle(style: .traitBold) },
                                                        secondAction: { self.changeStyle(style: .traitItalic) },
                                                        thirdAction: { self.changeStyle(style: .traitBold) })
        let changeFontSizeSegment = createSegmentedControl(title: "Изменить размер",
                                                           firstTitle: "3",
                                                           secondTitle: "15",
                                                           thirdTitle: "35",
                                                           firstAction: { self.changeFontSize(to: 3) },
                                                           secondAction: { self.changeFontSize(to: 15) },
                                                           thirdAction: { self.changeFontSize(to: 35) })
        let changeTextColorSegment = createSegmentedControl(title: "Изменить цвет",
                                                            firstTitle: "Красный",
                                                            secondTitle: "Зеленый",
                                                            thirdTitle: "Синий",
                                                            firstAction: { self.changeTextColor(to: .red) },
                                                            secondAction: { self.changeTextColor(to: .green)  },
                                                            thirdAction: { self.changeTextColor(to: .blue) })
        
        vStack.addArrangedSubview(changeStyleSegment)
        vStack.addArrangedSubview(changeFontSizeSegment)
        vStack.addArrangedSubview(changeTextColorSegment)
        vStack.setCustomSpacing(20, after: changeTextColorSegment)
        vStack.addArrangedSubview(clearAtributedButton)

    }
    
    func changeStyle(style: UIFontDescriptor.SymbolicTraits) {
        let range = textView.selectedRange
        guard range.length > 0 else { return }
        
        let currentAttributes = textView.attributedText.attributes(at: range.location, effectiveRange: nil)
        let currentFont = currentAttributes[.font] as? UIFont ?? UIFont.systemFont(ofSize: 18)
        var fontDescriptor = currentFont.fontDescriptor
        
        switch style {
        case .traitBold:
            fontDescriptor = fontDescriptor.withSymbolicTraits(fontDescriptor.symbolicTraits.union(.traitBold)) ?? fontDescriptor

        case .traitItalic:
            fontDescriptor = fontDescriptor.withSymbolicTraits(fontDescriptor.symbolicTraits.union(.traitItalic)) ?? fontDescriptor

        case [.traitBold, .traitItalic]:
            fontDescriptor = fontDescriptor.withSymbolicTraits([.traitBold, .traitItalic]) ?? fontDescriptor

        default:
            break
        }
        
        let newFont = UIFont(descriptor: fontDescriptor, size: currentFont.pointSize)

        let attributedString = NSMutableAttributedString(attributedString: textView.attributedText)
        attributedString.addAttribute(.font, value: newFont, range: range)
        
        textView.attributedText = attributedString
        textView.selectedRange = range
        clearAtributedButton.isEnabled = true
    }



    
    func changeFontSize(to newSize: CGFloat) {
        let range = textView.selectedRange
        
        guard range.length > 0 else { return }

        let attributedString = NSMutableAttributedString(attributedString: textView.attributedText)
        
        attributedString.enumerateAttribute(.font, in: range, options: []) { (value, range, _) in
            if let currentFont = value as? UIFont {
                let fontDescriptor = currentFont.fontDescriptor
                let newFont = UIFont(descriptor: fontDescriptor, size: newSize)
                attributedString.addAttribute(.font, value: newFont, range: range)
            }
        }
        
        textView.attributedText = attributedString
        textView.selectedRange = range
        clearAtributedButton.isEnabled = true
    }



    
    func changeTextColor(to color: UIColor) {
        let range = textView.selectedRange
        guard range.length > 0 else { return }
        
        let attributedString = NSMutableAttributedString(attributedString: textView.attributedText)
        attributedString.addAttribute(.foregroundColor, value: color, range: range)
        
        textView.attributedText = attributedString
        textView.selectedRange = range
        clearAtributedButton.isEnabled = true
    }


    @objc func removeAllAttributes() {
        let selectedRange = textView.selectedRange
        let plainText = textView.text(in: textView.selectedTextRange!)
        let newAttributedText = NSAttributedString(string: plainText ?? "")
        let mutableAttributedText = NSMutableAttributedString(attributedString: textView.attributedText)
        mutableAttributedText.replaceCharacters(in: NSRange(location: selectedRange.location, length: selectedRange.length), with: newAttributedText)
        
        textView.attributedText = mutableAttributedText
        textView.selectedRange = selectedRange
        clearAtributedButton.isEnabled = true
    }


    override func viewDidLoad() {
        super.viewDidLoad()
        setupWrapper()
        setupTextView()
        setupVStackView()
    }

}
