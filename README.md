# quiz

首先開啟終端機，進入項目資料夾中，執行命令 pub get，接著確保電腦已有安裝手機模擬器，用 VSCode 開啟項目資料夾後，右下角選擇要使用的手機模擬器，最後點擊 VSCode 上方選單列的執行 > 執行但不進行偵錯，即可開啟 APP，點擊 Start Quiz 按鈕，即可開始測驗，作答五題選擇題後顯示結果，並可點擊 Restart 重新測驗。

## 重點整理

可新增 models 資料夾，裏面用來放置資料架構設定檔案，其內容直接創建 class，不需做成無狀態或有狀態小部件。以本例子來說，`lib/models/quiz_question.dart` 內容如下：

```dart
class QuizQuestion { // 創建 class
  QuizQuestion(this.text, this.answers); // 定義傳入的內容

  final String text; // 定義傳入的內容類型
  final List<String> answers; // 定義傳入的內容類型

  List<String> get shuffleAnswers { // 通過 get 方法取出打亂的 answers
    final ans = List.of(answers); // 通過 List.of() 方法拷貝 answers
    ans.shuffle(); // 通過 shuffle 方法打亂 ans
    return ans; // 回傳 ans
  }
}
```

可新增 data 資料夾，裡面用來放置數據資料檔案，其內容要根據 models 生成。以本例子來說，`lib/data/qustions.dart` 內容如下：

```dart
import '../models/quiz_question.dart'; // 引入 models

final List<QuizQuestion> questions = [ // 宣告 questions 為 QuizQuestion 的陣列
  QuizQuestion( // 傳入 text 與 answers 給 QuizQuestion
    'Flutter UI 的主要構建模塊是什麼？',
    [
      'Widgets',
      'Components',
      'Blocks',
      'Functions',
    ],
  ),
  // ...
  QuizQuestion(
    '在 Flutter 中，哪個方法用於將新的路由添加到導航堆疊中？',
    [
      'push()',
      'replace()',
      'navigate()',
      'addRoute()',
    ],
  ),
];
```

- 切換 screen 的方法
  - 宣告 `activeScreen` 為 `StartScreen` ，再使用 `activeScreen` 作為 `Scaffold` 的 `body` ，期間通過 `setState()` 更改 `activeScreen` 的值。
  - 當需要傳入參數 `_toggleScreen` 給 `StartScreen` 時，由於宣告 `_toggleScreen` 與宣告 `activeScreen` 的時間點極為相近，所以無法用上一個方式處理，需要通過 `initState()` 將 `activeScreen` 設為 `StartScreen(_toggleScreen)` ，再使用 `activeScreen` 作為 `Scaffold` 的 `body` 。
  - 宣告 `isStartScreen` 為 `true` ，再通過三元三元表達式 `isStartScreen ? StartScreen(_toggleScreen) : const QuestionScreen()` 設置 `Scaffold` 的 `body`
  
> `initState()` 用於在小部件執行 `Widget build(BuildContext context)` 之前設置變量，可理解為 `setState()` 方法，但只會在執行 `Widget build(BuildContext context)` 之前觸發一次。

- 在參數、方法或 class 名稱前加上下底線，表示告知 dart ，該參數、方法或 class 只能在當前的文件中使用，無法於其他文件中引入使用。通常有狀態小部件中聲明的參數或方法最常加上下底線。

- 使用第三方包的方式，到 <https://pub.dev/> 搜尋 `google_fonts` ，點擊 `Installing` ，複製指令 `flutter pub add google_fonts` ，用終端機開啟本專案項目根目錄，執行剛才複製的指令，完成後重新執行 `flutter` ，接著回到 `google_fonts` 頁面，點擊 `Readme` ，參照上方說明，在需要使用到 google font 的地方引入 `import 'package:google_fonts/google_fonts.dart';` 並在 `Text` 小部件中的 `style` 寫作：
```dart
Text(
  'Learn Flutter the fun way!',
  style: GoogleFonts.lato(
    letterSpacing: 0.5,
    textStyle: const TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
  ),
),
```

- 使用 `Expanded` 小部件包住 `Column` 即可解決 `Column` 小部件高度溢出螢幕的問題。
- 使用 `CircleAvatar` 小部件可做出像 Google 帳號預設頭貼般的正圓形背景＋文字樣式。
- 使用 `SizedBox` 小部件設置好高度，設置 `child` 為 `SingleChildScrollView` 小部件，即可讓超過 `SizedBox` 高度的內容產生滾動。
- `.map()` 方法可將陣列遍歷後回傳小部件們。
  - 如果是在 `Column` 小部件中使用 `.map()` 方法生成小部件，且前後還有其他小部件，則需要通過 `...` 將小部件們攤平為一個一個的小部件。
  - 如果是在 `Column` 小部件中使用 `.map()` 方法生成小部件，且前後沒有任何小部件，則 children 處不需用 `[]` 而是直接用 `.map().toList()` 將小部件們作為陣列使用。

```dart
// 通過 `...` 將小部件們攤平放在 [] 中
child: Column(
  mainAxisAlignment: MainAxisAlignment.center,
  children: [
    Text(
      currentQuestion.text,
    ),
    ...currentQuestion.shuffleAnswers.map(
      (item) => TextButton(
        item,
        () {},
      ),
    ),
  ],
),

// 用 `.map().toList()` 將小部件們作為 [] 使用
Column(
  children: summaryData
      .map((e) => Padding(
            padding: const EdgeInsets.only(bottom: 15),
            child: Text(
              e['question'] as String,
            ),
          ))
      .toList(),
),
```