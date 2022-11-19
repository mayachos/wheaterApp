//
//  ViewController.swift
//  wheaterApp
//
//  Created by maya on 2022/10/23.
//

import UIKit
import Alamofire
import SwiftyJSON

class ViewController: UIViewController {
    
    @IBOutlet var tenkiLabel: UILabel!
    var tenki: String = ""
    let city = "Kochi"
    var descriptionWeather: String?

    override func viewDidLoad() {
        super.viewDidLoad()

        yoho()
    }
    
    func yoho() {
        let text = "https://api.openweathermap.org/data/2.5/weather?q=\(city)&appid=912cb0543da45ffe0a97beb07e894531"
        let url = text.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
        AF.request(url!, method: .get, parameters: nil, encoding: JSONEncoding
                    .default).response { (response) in
                        switch response.result {
                        case .success:
                            let json = JSON(response.data as Any)
                            self.descriptionWeather = json["weather"][0]["main"].string!
                            //self.descriptionWeather = json["results"]["album"]["data"].string!
                            
                            self.tenkiLabel.text = self.descriptionWeather?.description
                            
                        case .failure(let error):
                            print(error)
                        }
                    }
                        
    }

}

