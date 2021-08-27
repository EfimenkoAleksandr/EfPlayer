//
//  VideoViewController.swift
//  EfPlayer
//
//  Created by user on 25.08.2021.
//

import UIKit

class VideoViewController: UIViewController {
    
    var viewModel: VideoViewModelProtocol!
    var router: VideoRouterProtocol!

    @IBOutlet weak var collectioView: UICollectionView! {
        didSet {
            let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
 //           layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
            let width: CGFloat = (UIScreen.main.bounds.width / 2) - 5
            let aspectRatio: CGFloat = 0.75 //9 / 12
            let height = width * aspectRatio
            layout.itemSize = CGSize(width: width, height: height)
            layout.minimumLineSpacing = 10
            layout.minimumInteritemSpacing = 5
            
            collectioView.collectionViewLayout = layout
            collectioView.backgroundColor = .black
           
            collectioView.registerCell(type: VideoCollectionViewCell.self)
            collectioView.delegate = self
            collectioView.dataSource = self
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.viewModel.delegate = self
        self.view.backgroundColor = .black
        self.addBarButton()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        // Make the navigation bar background clear
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.isTranslucent = true
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)

        // Restore the navigation bar to default
        navigationController?.navigationBar.setBackgroundImage(nil, for: .default)
        navigationController?.navigationBar.shadowImage = nil
    }
    
    private func addBarButton() {
        let image = UIImage(systemName: "plus")?.withRenderingMode(.alwaysTemplate)
        let plusButton = UIBarButtonItem(image: image, style: .plain, target: self, action: #selector(VideoViewController.plusButton))
        plusButton.tintColor = .white
        
        self.navigationItem.leftBarButtonItem = plusButton
    }
    
    @objc func plusButton() {
        
    }

}

extension VideoViewController: VideoDelegate {
    func fetchVideo() {
        self.collectioView.reloadData()
    }
}

extension VideoViewController: VideoViewControllerProtocol {}

extension VideoViewController: UICollectionViewDelegate {}

extension VideoViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueCell(withType: VideoCollectionViewCell.self, for: indexPath) as? VideoCollectionViewCell else { return UICollectionViewCell() }
        
        cell.backgroundColor = .systemRed
        return cell
    }
    
    
}
