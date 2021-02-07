# 電子レンジロジック
## 概要
- Startボタンを押すと、カウントダウンされ、０になるとあたため完了という文字が表示されます。

## 実装内容
- 60分まで温めることができる
- あたため途中で中止し、リセットすることができる
- 500W,600W,1200Wを選ぶことができる
- 0になると「あたため完了」と表示される
- UIpickerViewであたため時間を選択することができる

## 苦労したこと
- UIpickerViewのフレームがずれたこと（CGRectの使い方を参考に修正する）
- CGRectの使い方：　https://iphone-tora.sakura.ne.jp/uikit_size.html
- UIPickerViewの固定ラベルの付け方：　https://mjhd.hatenablog.com/entry/uipickerview-with-labels
- タイマー０になったときに、秒が「０」と表示されるのを、「００」に表示する方法
- Wを選択する際に、3回Buttonを押した後、もう一度500Wが表示されるように、リピートさせること
