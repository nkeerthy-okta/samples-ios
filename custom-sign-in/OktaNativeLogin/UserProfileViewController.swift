/*
 * Copyright 2019 Okta, Inc.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import UIKit
import OktaAuthSdk

class UserProfileViewController: UIViewController {
    
    var status: OktaAuthStatusSuccess?
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateUI()
    }
    
    // MARK: - Private
    
    private func updateUI() {
        guard let profile = status?.model.embedded?.user?.profile else { return }
        titleLabel.text = "Welcome, \(profile.firstName ?? "-")"
        subtitleLabel.text = profile.login
        timezoneLabel.text = profile.timeZone
        localeLabel.text = profile.locale
    }
    
    // MARK: - IB
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var timezoneLabel: UILabel!
    @IBOutlet weak var localeLabel: UILabel!
    
    @IBAction private func logoutTapped() {
        navigationController?.popViewController(animated: true)
    }
}
