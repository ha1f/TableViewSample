# TableViewSample(iOS)
tableViewの使い方について。ViewControllerのコメント文参照


## 動作確認
```
git clone https://github.com/ha1fha1f/TableViewSample.git
cd TableViewSample
open tableSample.xcodeproj
```

## TableViewを使うときの手順

#### TableViewを配置する
1. StoryboardにTableViewを配置(TableViewControllerではない)

#### オリジナルのセルの枠組みを作る
2. 設置したTableViewの上にTableViewCellを配置
3. TableViewCellに必要なパーツを配置(UIImageView, UILabel等)

#### セル用のクラスを作る
4. File -> NewFileとして、iOS用のSwiftファイルを選び、MyCell.swiftを追加(クラス名なのでなんでも良い)
5. MyCell.swiftの内容を記述（3で配置したパーツに合わせて@IBOutletの変数を定義、MyCell.swift参照）
6. IdentityInspecterからCustomClassをMyCellに設定(さっきの)
7. AttributesInspecterからIdentiferを指定(今回はcell0)
8. ConnectionsInspecterからTableCell上のパーツとMyCell.swift内のパーツを関連付け。

#### データソースプロトコルの実装
9. UITableViewの@IBOutletをclass内に定義する(今回はtable、ViewController.swift参照)
10. classの定義文の後ろに, UITableViewDataSource, UITableViewDelegateを追加（ViewController.swift参照）
11. classの内部にセルの個数を返す関数

```swift
func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{}
```

および、指定された行(列)のセルのインスタンスを返す関数

```swift
func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {}
```

を記述する(ViewController.swift参照)

#### デリゲート、データソースをselfに設定する
12. ViewController.swiftのviewDidLoadに

```swift
table.dataSource=self
table.delegate=self
```

を記述する

13. Run!
