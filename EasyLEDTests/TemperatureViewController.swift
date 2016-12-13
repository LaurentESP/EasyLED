//
//  TemperatureViewController.swift
//  EasyLED
//
//  Created by LMB SAS on 13/12/2016.
//  Copyright © 2016 laurent. All rights reserved.
//

import UIKit
import Charts
import RealmSwift

class TemperatureViewController: UIViewController {

    @IBOutlet weak var ui_lineChart: LineChartView!
    var temperatureManager:TemperatureManager?
    var realm:Realm?
    var listOfTemperatures:Results<Temperature>?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(Realm.Configuration.defaultConfiguration.fileURL)
        Realm.Configuration.defaultConfiguration.deleteRealmIfMigrationNeeded = true
        realm = try! Realm()
        
        ApiManagement._realm = realm
        _ = ApiManagement.get(Temperature.self, success : {
            print("Json Read is a success")
        }){ (error) in
            
        }

        temperatureManager = TemperatureManager(withRealm: realm!)
        listOfTemperatures = temperatureManager?.getTemperatureList()
        updateChartWithData()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func updateChartWithData() {
        var entries:[ChartDataEntry] = []
        if let listOfTemp = listOfTemperatures {
            for temp in listOfTemp {
                let dataEntry = ChartDataEntry(x: Double(temp.getDate()), y: Double(temp.getTempValue()))
                entries.append(dataEntry)
            }
            let lineDataSet:LineChartDataSet = LineChartDataSet(values: entries, label: "Temperatures")
            lineDataSet.setColor(.blue)
            let lineData:LineChartData = LineChartData(dataSet: lineDataSet)
            ui_lineChart.data = lineData
        }

    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
