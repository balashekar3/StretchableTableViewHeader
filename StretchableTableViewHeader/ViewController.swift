//
//  ViewController.swift
//  StretchableTableViewHeader
//
//  Created by Balashekar Vemula on 07/03/23.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var mTableView: UITableView!
    
    let imageView = UIImageView()
    override func viewDidLoad() {
        super.viewDidLoad()
        customTableView()
        customHeaderView()
    }
    private func customHeaderView(){
        imageView.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: 300)
        imageView.image = UIImage.init(named: "poster")
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        view.addSubview(imageView)
    }
    private func customTableView(){
        mTableView.register(UINib(nibName: "CustomTableViewCell", bundle: nil), forCellReuseIdentifier: "CustomTableViewCell")
        mTableView.delegate = self
        mTableView.dataSource = self
        mTableView.contentInset = UIEdgeInsets(top: 300, left: 0, bottom: 0, right: 0)
        mTableView.estimatedRowHeight = 50
    }
    
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 30
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomTableViewCell", for: indexPath) as! CustomTableViewCell
        cell.titleLabel.text = "There is no one who loves pain itself, who seeks after it and wants to have it, simply because it is pain.There is no one who loves pain itself, who seeks after it and wants to have it, simply because it is pain."
        return cell
    }
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let y = 300 - (scrollView.contentOffset.y + 300)
        let height = min(max(y, 60), 400)
        imageView.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: height)
    }
}
