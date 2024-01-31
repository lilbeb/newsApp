import Foundation
import UIKit

final class HeaderView: UIView {
    private var fontSize: CGFloat
    
    private lazy var headingLabel: UILabel = {
        let v = UILabel()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.text = "Новости"
        v.font = UIFont.boldSystemFont(ofSize: fontSize)
        return v
    }()
    
    private lazy var headerPlanetImage: UIImageView = {
        let v = UIImageView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.contentMode = .scaleAspectFit
        
        let config = UIImage.SymbolConfiguration(pointSize: fontSize, weight: .bold)
        v.image = UIImage(systemName: "globe.americas.fill", withConfiguration: config)
        v.tintColor = UIColor.black
        return v
    }()
    
    private lazy var headerStackView: UIStackView = {
        let v = UIStackView(arrangedSubviews: [headerPlanetImage, headingLabel])
        v.translatesAutoresizingMaskIntoConstraints = false
        v.axis = .horizontal
        return v
    }()
    
    private lazy var subheadlineLabel: UILabel = {
        let v = UILabel()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.font = v.font.withSize(fontSize)
        v.text = "Популярные заголовки"
        v.textColor = .gray
        return v
    }()
    
    init(fontSize: CGFloat) {
        self.fontSize = fontSize
        super.init(frame: .zero)
        translatesAutoresizingMaskIntoConstraints = false
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        
        addSubview(headerStackView)
        addSubview(subheadlineLabel)
        setupConstraints()
        
    }
    
    func setupConstraints() {
    // news header
        NSLayoutConstraint.activate([
            headerStackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            headerStackView.topAnchor.constraint(equalTo: topAnchor)
        ])
        
        // subhead line
        NSLayoutConstraint.activate([
            subheadlineLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            subheadlineLabel.topAnchor.constraint(equalTo: headerStackView.bottomAnchor, constant: 8),
            subheadlineLabel.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}
