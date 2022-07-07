//
//  OnboardingViewController.swift
//  Trafel
//
//  Created by Kenneth Murerwa on 05/07/2022.
//

import UIKit

class OnboardingViewController: UIViewController {
    
    @IBOutlet weak var onboardingCollectionView: UICollectionView!
    
    @IBOutlet weak var pageControl: UIPageControl!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var descriptionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupCollectionView()
        
        setupPageControl()
    }

    private func setupCollectionView() {
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        
        onboardingCollectionView.backgroundColor = .systemGroupedBackground
        onboardingCollectionView.collectionViewLayout = layout
        onboardingCollectionView.isPagingEnabled = true
        onboardingCollectionView.showsHorizontalScrollIndicator = false
        
    }
    
    private func setupPageControl() {
        pageControl.numberOfPages = Slide.collection.count
    }
    
    @IBAction func getStartedButtonTapped(_ sender: UIButton) {
        
        performSegue(withIdentifier: Constants.Segues.showLoginSignUpScreen, sender: nil)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == Constants.Segues.showLoginSignUpScreen {
            if let destination = segue.destination as? LoginViewController {
                destination.delegate = self
            }
        }
    }
    
}


// MARK: - UICollectionView section

extension OnboardingViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Slide.collection.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell  = collectionView.dequeueReusableCell(withReuseIdentifier: "cellid", for: indexPath) as! OnboardingCollectionViewCell
        
        let image = Slide.collection[indexPath.item].imageName
        
        cell.configure(image: UIImage(named: image) ?? UIImage())
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return collectionView.frame.size
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let index = Int(scrollView.contentOffset.x) / Int(scrollView.frame.width)
        
        // Update pageControl
        pageControl.currentPage = index
        
        // Update the onboarding title and description
        let slide = Slide.collection[index]
        
        titleLabel.text = slide.title
        descriptionLabel.text = slide.description
    }
}


// MARK: - Onboarding delegate section

extension OnboardingViewController: OnboardingDelegate {
    func showMainTabBarController() {
        
        // Dismiss login view controller
        if let loginViewController = self.presentedViewController as? LoginViewController {
            
            loginViewController.dismiss(animated: true) {
                // Navigate to main tab bar
                PresenterManager.shared.show(viewController: .mainTabBarController)
            }
        }
        
    }
}


