//
//  UICollectionTableViewCell+Helper.swift
//  Delivery Mobile App
//
//  Created by Seakthong Aing on 6/14/21.
//

import UIKit

extension UICollectionViewCell {
    
    class func reuseIdentifier() -> String {
        let className = NSStringFromClass(self)
        let components = className.components(separatedBy: ".")
        return components.count > 1 ? components[1] : className
    }
    
    class func nib() -> UINib {
        return UINib(nibName: reuseIdentifier(), bundle: nil)
    }
    
    class func registerNibCell(_ collectionView: UICollectionView) {
        collectionView.register(nib(), forCellWithReuseIdentifier: reuseIdentifier())
    }
    
    class func registerNibCell(_ collectionView: UICollectionView, reuseIdentifier: String) {
        collectionView.register(nib(), forCellWithReuseIdentifier: reuseIdentifier)
    }
    
    class func registerClass(_ collectionView: UICollectionView) {
        collectionView.register(self, forCellWithReuseIdentifier: reuseIdentifier())
    }
    
    class func registerClass(_ collectionView: UICollectionView, reuseIdentifier: String) {
        collectionView.register(self, forCellWithReuseIdentifier: reuseIdentifier)
    }
    
}

// MARK: - Reusable view
protocol ReusableView: class {
    static var defaultReuseIdentifier: String { get }
}

extension ReusableView where Self: UIView {
    static var defaultReuseIdentifier: String {
        return String(describing: self)
    }
}
extension UICollectionReusableView: ReusableView {}
// MARK: - UICollectionView convenient methods
extension UICollectionView {
    
    func register<T: UICollectionViewCell>(_: T.Type) {
        register(T.self, forCellWithReuseIdentifier: T.defaultReuseIdentifier)
    }
    
    func register<T: UICollectionViewCell>(_: T.Type) where T: NibLoadableView {
        let bundle = Bundle(for: T.self)
        let nib = UINib(nibName: T.nibName, bundle: bundle)
        
        register(nib, forCellWithReuseIdentifier: T.defaultReuseIdentifier)
    }
    
    func register<T: UICollectionReusableView>(_: T.Type, forSupplementaryViewOfKind kind: String) where T: NibLoadableView {
        
        let bundle = Bundle(for: T.self)
        let nib = UINib(nibName: T.nibName, bundle: bundle)
        
        register(nib, forSupplementaryViewOfKind: kind, withReuseIdentifier: T.defaultReuseIdentifier)
    }
    
    func dequeueReusableCell<T: UICollectionViewCell>(for indexPath: IndexPath) -> T {
        guard let cell = dequeueReusableCell(withReuseIdentifier: T.defaultReuseIdentifier, for: indexPath) as? T else {
            fatalError("Could not dequeue cell with identifier: \(T.defaultReuseIdentifier)")
        }
        
        return cell
    }
    
    func dequeueReusableSupplementaryView<T: UICollectionReusableView>(viewForSupplementaryElementOfKind kind: String, for indexPath: IndexPath) -> T {
        
        guard let view = dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: T.defaultReuseIdentifier, for: indexPath) as? T else {
            fatalError("Could not dequeue reusable view with identifier: \(T.defaultReuseIdentifier)")
        }
        
        return view
    }
}
