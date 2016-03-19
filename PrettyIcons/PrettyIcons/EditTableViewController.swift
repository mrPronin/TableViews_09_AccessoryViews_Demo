//
//  EditTableViewController.swift
//  PrettyIcons
//
//  Created by Brian on 10/8/15.
//  Copyright © 2015 Razeware LLC. All rights reserved.
//

import UIKit

class EditTableViewController: UITableViewController {

  var icon: Icon?
  @IBOutlet weak var iconImageView: UIImageView!
  @IBOutlet weak var titleTextField: UITextField!
  @IBOutlet weak var subtitleTextField: UITextField!
  @IBOutlet weak var ratingLabel: UILabel!

  
    override func viewDidLoad() {
        super.viewDidLoad()
    }
  
  override func viewWillAppear(animated: Bool) {
    super.viewWillAppear(animated)
    guard let icon = icon else {
      return
    }
    if let iconImage = icon.image {
      iconImageView.image = iconImage
    }
    titleTextField.text = icon.title
    subtitleTextField.text = icon.subtitle
    ratingLabel.text = String(icon.rating)
    
  }
  
  override func viewWillDisappear(animated: Bool) {
    guard let icon = icon else {
      return
    }
    if let iconImage = iconImageView.image {
      icon.image = iconImage
    }

    if let title = titleTextField.text {
      icon.title = title
    }
    if let subtitle = subtitleTextField.text {
      icon.subtitle = subtitle
    }

  }
  

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "GoToRating" {
            if let ratingController = segue.destinationViewController as? RatingTableViewController {
                ratingController.icon = icon
            }
        }
    }


}

extension EditTableViewController: UITextFieldDelegate {
  func textFieldShouldReturn(textField: UITextField) -> Bool {
    textField.resignFirstResponder()
    return true
  }
}
