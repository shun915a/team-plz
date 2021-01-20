class Tag < ActiveHash::Base
  self.data = [
    { id: 1, name: 'ランク' },
    { id: 2, name: 'アンレート' },
    { id: 3, name: 'スクリム' },
    { id: 4, name: '社会人' },
    { id: 5, name: '大学生' },
    { id: 6, name: '高校生' },
    { id: 7, name: '中学生' },
    { id: 8, name: '楽しく' },
    { id: 9, name: '勝ち重視' },
    { id: 10, name: '自由' },
    { id: 11, name: 'まったり' },
    { id: 12, name: 'がっつり' },
    { id: 13, name: 'フルタイム' },
    { id: 14, name: 'Discord' },
    { id: 15, name: 'TS3' },
    { id: 16, name: 'Skype' },
    { id: 17, name: 'ゲーム内VC' },
    { id: 18, name: '新設チーム' },
    { id: 19, name: '作戦あり' },
    { id: 20, name: '反省会あり' },
    { id: 21, name: '年齢不問' },
    { id: 22, name: '大会出場' },
    { id: 23, name: '大会入賞' },
    { id: 24, name: '大会参加希望' },
    { id: 25, name: '大会参加予定' }
  ]

  include ActiveHash::Associations
  has_many :recruitment_tag_relations
end
