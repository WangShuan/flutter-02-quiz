import '../models/quiz_question.dart';

final List<QuizQuestion> questions = [
  QuizQuestion(
    'Flutter UI 的主要構建模塊是什麼？',
    [
      'Widgets', // 答案選項
      'Components',
      'Blocks',
      'Functions',
    ],
  ),
  QuizQuestion(
    '在 Flutter 應用中，main() 函數的用途是什麼？',
    [
      '它是 Flutter 應用的入口點。', // 答案選項
      '用於定義應用的使用者界面佈局。',
      '用於聲明全局變量和常數。',
      '用於處理用戶與應用的交互。',
    ],
  ),
  QuizQuestion(
    '在 StatefulWidgets 內部應該如何更新數據？',
    [
      '通過調用 setState()', // 答案選項
      '通過調用 updateData()',
      '通過調用 updateUI()',
      '通過調用 updateState()',
    ],
  ),
  QuizQuestion(
    '在 Flutter 中，哪個 Widget 用於顯示等尺寸的子元素網格？',
    [
      'GridView', // 答案選項
      'ListView',
      'Column',
      'Row',
    ],
  ),
  QuizQuestion(
    'Flutter 的熱重載（hot reload）的用途是什麼？',
    [
      '自動編譯代碼以加快開發', // 答案選項
      '在編輯代碼後重新啟動應用程序',
      '檢查代碼中的錯誤',
      '自動格式化代碼',
    ],
  ),
  QuizQuestion(
    '在 Flutter 中，為了使 ListView 擁有滾動功能，你應該將其放在什麼 widget 中？',
    [
      'SingleChildScrollView', // 答案選項
      'Container',
      'Column',
      'Scrollable',
    ],
  ),
  QuizQuestion(
    '在 Flutter 中，用於將 widget 排列成水平方向的 widget 是什麼？',
    [
      'Row', // 答案選項
      'Column',
      'Wrap',
      'Align',
    ],
  ),
  QuizQuestion(
    '在 Flutter 中，用於設置 widget 大小的 widget 是什麼？',
    [
      'SizeBox', // 答案選項
      'SetSize',
      'Dimension',
      'SizeConstraint',
    ],
  ),
  QuizQuestion(
    '在 Flutter 中，用於在 widget 之間添加間距的 widget 是什麼？',
    [
      'Spacing', // 答案選項
      'Spacer',
      'Padding',
      'Margin',
    ],
  ),
  QuizQuestion(
    '在 Flutter 中，用於從用戶獲取文本輸入的 widget 是什麼？',
    [
      'Textfield', // 答案選項
      'TextInput',
      'InputField',
      'TextField',
    ],
  ),
];
