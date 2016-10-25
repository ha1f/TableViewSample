//
//  ViewController.swift
//  tableViewSample
//
//  Created by 山口 智生 on 2015/06/24.
//  Copyright (c) 2015年 NextVanguard. All rights reserved.
//



/*
手順
1. StoryboardにTableViewを配置(TableViewControllerではない)
<オリジナルのセルのプロトタイプを作る>
2. TableViewの上にTableViewCellを配置
3. TableViewCellに必要なパーツを配置
4. NewFileとしてiOS用のSWIFTファイルを選び、MyCell.swiftを追加
5. MyCell.swiftの内容を記述（コピペでよい）
6. IdentityInspecterからCustomClassをMyCellに設定
7. AttributesInspecterからIdentiferを指定(今回はcell0)
8. ConnectionsInspecterからTableCell上のパーツとMyCell.swift内のパーツを関連付け。
<セルをコードから制御する>
9. UITableViewのIBOutletをclass内に定義する(今回はtable)
10. classの定義文の後ろに, UITableViewDataSource, UITableViewDelegateを追加（コード参照）
11. classの内部にセルの個数を返す関数
func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{}
および、指定された行(列)のセルを作成して返す関数
func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {}
を記述する
(コード参照)
12. viewDidLoadに
table.dataSource=self
table.delegate=self
を記述する
13. Run!
*/

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet var table: UITableView!
    
    //リスト
    let names = ["a","b","c","d","e","f","g"]
    let texts = ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"]
    let imagePaths = ["IMG_0232.JPG", "IMG_0232.JPG", "IMG_0232.JPG", "IMG_0232.JPG", "IMG_0232.JPG", "IMG_0232.JPG", "IMG_0232.JPG"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        table.dataSource=self
        table.delegate=self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // 行数（セクション数はデフォルトで1）
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return texts.count
    }
    
    //セルの内容を変更
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell0") as! MyCell
        
        //indexPath.rowに何行目か、indexPath.sectionに何セクション目かが与えられる。それによりデータを呼び出してセルに適用
        cell.nameLabel.text = names[indexPath.row]
        cell.subLabel.text = texts[indexPath.row]
        cell.icon.image = UIImage(named: imagePaths[indexPath.row])
        
        return cell
    }
    
    
}

